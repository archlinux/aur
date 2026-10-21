# Maintainer: aur.chaotic.cx
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Eric S. Londres <ericlondres@protonmail.com>
# Contributor: Mandeep Sangwan <mandeep@sangwan.me>
# Contributor: Joakim Nylén <me@jnylen.nu>
# Contributor: Rashintha Maduneth <rashinthamaduneth@gmail.com>
# Contributor: Dhananjay Balan <mail@dbalan.in>

pkgname=mailspring
pkgver=1.26.1
pkgrel=1
pkgdesc="A beautiful and fast mail client"
url="https://github.com/Foundry376/Mailspring"
license=(
  'GPL-3.0-only'
  'BSD-3-Clause' # libetpan, mailcore2
  'MIT' # SQLiteCpp, spdlog, icalendarlib, better-sqlite3 and most node modules
)
arch=('x86_64')

_electron=electron44
# headers for building native node modules, must match the major version of $_electron
_electron_headers=44.9.1

depends=(
  'bash'
  'ctemplate'
  'curl'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'icu'
  'libgcc'
  'libsasl'
  'libstdc++'
  'libxml2'
  'openssl'
  'sqlite'
  'tidy' # dlopen()ed by mailsync
  'util-linux-libs'
  'zlib'
  # runtime dependencies are added in package() because we do not need them to build
)
makedepends=(
  'git'
  'cmake'
  'autoconf'
  'automake'
  'libtool'
  'c-ares'
  'nlohmann-json'
  'xz'
  'nodejs'
  'npm'
  'node-gyp'
  'python'
)
optdepends=(
  'org.freedesktop.secrets: credential storage (e.g. gnome-keyring or keepassxc)'
  'cyrus-sasl-gssapi: Kerberos authentication'
  'binutils: symbolized mailsync crash backtraces'
)
source=(
  "git+$url.git#tag=$pkgver"
  "git+https://github.com/Foundry376/Mailspring-Sync.git"
  "electron-v$_electron_headers-headers.tar.gz::https://artifacts.electronjs.org/headers/dist/v$_electron_headers/node-v$_electron_headers-headers.tar.gz"
  "$pkgname.sh.in"
  "mailspring-0001-build-take-Electron-zip-from-ELECTRON_ZIP_DIR.patch"
  "mailsync-0001-cmake-link-against-shared-system-libraries.patch"
  "mailsync-0002-cmake-use-system-nlohmann-json.patch"
  "mailsync-0003-cmake-use-system-sqlite.patch"
)
sha256sums=('6a225d223c439a39ffe31bd28debd983c1e3d3f44f87bb01cc4ac52f5ffbcc92'
            'SKIP'
            '761d2595a05d3d41b129d8fd9b7ad45a6175a0ccce311fe20341d21f8275007a'
            'ca87bb310800d33f29c3afca818bd93f96f1dfd88ca22402bc0e9cbbdc6a2d14'
            'ab90583d28509b05d39a43698bada97a34aa62a94d5f292daff1f52a337b7d35'
            'c75cb94e5a272d7a3f4b506285b7ded0ee0a390c42fd43984bf3868d0907a1e0'
            '2195d736ad8177281dbd132476bf51ccf38ce3025e68b5eb9cfb46bea407f38e'
            'bd6711ffafb42ea5eb36b94d9d152b80a297ed7b59d4afca5e723aa374f9f0bd')

_check_electron() {
  local _expected
  _expected="electron$(node -p 'require("./mailspring/package.json").dependencies.electron.split(".")[0]')"
  if [[ "$_electron" != "$_expected" ]]; then
    error "Using $_electron but upstream specifies $_expected"
    return 1
  fi
  if [[ "${_electron#electron}" != "${_electron_headers%%.*}" ]]; then
    error "Using $_electron but headers are for electron${_electron_headers%%.*}"
    return 1
  fi
}

_npm_ci() {
  npm ci \
    --ignore-scripts \
    --allow-git=root \
    --no-audit \
    --no-fund \
    "$@"
}

prepare() {
  _check_electron

  # prepare launcher script
  sed -r \
    -e "s|@PKGNAME@|${pkgname}|g" \
    -e "s|@ELECTRON@|${_electron}|g" \
    "$pkgname.sh.in" \
    >"$pkgname.sh"

  cd Mailspring

  git submodule init mailsync
  git config submodule.mailsync.url "$srcdir/Mailspring-Sync"
  git -c protocol.file.allow=always submodule update mailsync

  local _patch
  for _patch in "${source[@]}"; do
    case "$_patch" in
    mailspring-*.patch) patch -Np1 -i "$srcdir/$_patch" ;;
    mailsync-*.patch) patch -d mailsync -Np1 -i "$srcdir/$_patch" ;;
    esac
  done

  # remove prebuilt Windows and macOS libraries
  rm -rf \
    mailsync/Vendor/libetpan/third-party \
    mailsync/Vendor/mailcore2/Externals \

  # use system nlohmann-json and sqlite
  rm -rf \
    mailsync/Vendor/nlohmann \
    mailsync/Vendor/SQLiteCpp/sqlite3 \

  # still vendored:
  # - better-sqlite3's bundled sqlite: it's compiled with settings that change behaviour
  #   (SQLITE_DEFAULT_FOREIGN_KEYS=1, SQLITE_DQS=0, UPDATE_DELETE_LIMIT), and Arch's sqlite
  #   doesn't have them
  # - spdlog: mailsync uses version 0.13, whose API doesn't match Arch's 1.x
  # - libetpan and mailcore2: they're forks
  # - SQLiteCpp, icalendarlib, StanfordCPPLib: not packaged in Arch

  (
    cd mailsync/Vendor/libetpan
    NOCONFIGURE=1 ./autogen.sh
  )

  # install node modules, skipping the postinstall script that downloads
  # a prebuilt mailsync and fetches prebuilt native modules
  _npm_ci
  (
    cd app
    _npm_ci
  )

  # Windows-only native module
  rm -rf app/node_modules/windows-focus-assist
  # prebuilt Java archives
  rm -rf app/node_modules/jasmine-reporters/ext
}

_build_libetpan() (
  cd mailsync/Vendor/libetpan
  ./configure \
    --prefix="$srcdir/libetpan" \
    --enable-static \
    --disable-shared \
    --disable-db \
    --with-openssl \
    --without-gnutls \

  make
  make install
)

_build_mailcore2() {
  cmake \
    -S mailsync/Vendor/mailcore2 \
    -B mailsync/Vendor/mailcore2/build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_PREFIX_PATH="$srcdir/libetpan" \
    -Wno-dev \

  cmake --build mailsync/Vendor/mailcore2/build --target MailCore
}

_build_mailsync() {
  cmake \
    -S mailsync \
    -B mailsync/build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_PREFIX_PATH="$srcdir/libetpan" \
    -Wno-dev \

  cmake --build mailsync/build --target mailsync
}

_build_better_sqlite3() (
  cd app/node_modules/better-sqlite3

  node-gyp rebuild --release --nodedir="$srcdir/node_headers"

  # keep only the addon itself
  mv build/Release/better_sqlite3.node .
  rm -rf build deps src binding.gyp
  install -Dm755 better_sqlite3.node -t build/Release
  rm better_sqlite3.node
)

_build_app() {
  # we only need the electron packager to build app.asar
  # inject a stub electron zip to avoid downloading a prebuilt blob
  local _electron_ver
  _electron_ver="$(node -p 'require("electron/package.json").version')"
  local -x ELECTRON_ZIP_DIR="$srcdir/electron-stub"
  rm -rf "$ELECTRON_ZIP_DIR"
  mkdir -p "$ELECTRON_ZIP_DIR/dist"
  install -m755 /dev/null "$ELECTRON_ZIP_DIR/dist/electron"
  bsdtar -C "$ELECTRON_ZIP_DIR/dist" -a -cf "$ELECTRON_ZIP_DIR/electron-v$_electron_ver-linux-x64.zip" electron

  local -x TMPDIR="$srcdir/tmp"
  mkdir -p "$TMPDIR"

  node app/build/build.js --skip-installers

  node -e '
    const fs = require("fs");
    const _ = require("underscore");
    const pkg = require("./app/package.json");
    const data = {
      name: pkg.name,
      productName: pkg.productName,
      description: pkg.description,
      desktopName: pkg.desktopName,
    };
    for (const file of process.argv.slice(1)) {
      const template = _.template(fs.readFileSync(file, "utf8"));
      fs.writeFileSync(file.replace(/\.in$/, ""), template(data));
    }
  ' \
    app/build/resources/linux/Mailspring.desktop.in \
    app/build/resources/linux/mailspring.metainfo.xml.in \

}

build() {
  cd Mailspring

  local -x CFLAGS="$CFLAGS -I$srcdir/libetpan/include"
  local -x CXXFLAGS="$CXXFLAGS -I$srcdir/libetpan/include"

  _build_libetpan
  _build_mailcore2
  _build_mailsync
  install -Dm755 mailsync/build/mailsync -t app

  _build_better_sqlite3
  _build_app
}

package() {
  depends+=(
    "$_electron"
  )

  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  cd Mailspring

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -dR --preserve=timestamps,links \
    app/dist/mailspring-linux-x64/resources/app.asar \
    app/dist/mailspring-linux-x64/resources/app.asar.unpacked \
    -t "$pkgdir/usr/lib/$pkgname"

  local _linux=app/build/resources/linux
  install -Dm644 "$_linux/Mailspring.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$_linux/mailspring.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
  local _size
  for _size in 16 32 64 128 256 512; do
    install -Dm644 "$_linux/icons/$_size.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$pkgname.png"
  done

  install -Dm644 mailsync/Vendor/libetpan/COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/libetpan.txt"
  install -Dm644 mailsync/Vendor/mailcore2/LICENSE "$pkgdir/usr/share/licenses/$pkgname/mailcore2.txt"
  install -Dm644 mailsync/Vendor/SQLiteCpp/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/SQLiteCpp.txt"
}
