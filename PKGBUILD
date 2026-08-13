# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
# Contributor: ganthern <https://github.com/ganthern>
pkgname=tutanota-desktop
pkgver=357.260812.1
pkgrel=1
_nodeversion=24
pkgdesc="The desktop client for Tutanota, the secure e-mail service."
arch=('x86_64')
url="https://tuta.com/secure-email"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'libsecret'
  'nss'
)
makedepends=(
  'cargo'
  'emscripten'
  'git'
  'nvm'
  'python'
  'rust-wasm'
)
source=("git+https://github.com/tutao/tutanota.git#tag=$pkgname-release-$pkgver"
        'git+https://github.com/P-H-C/phc-winner-argon2.git'
        'git+https://github.com/open-quantum-safe/liboqs.git'
        'git+https://github.com/tutao/Signal-FTS5-Extension.git'
        "$pkgname.desktop")
sha256sums=('7f1be7c46d05f5f2afb622f6073e637c563093aefec2ada749b775b713e2bc35'
            'SKIP'
            'SKIP'
            'SKIP'
            '840ba6d4ce833abda80e3233600d3733063e57dd2ef99acf5cff9b9a1162b8e7')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"
  # The init script returns 3 if version specified
  # in ./.nvrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "${pkgname%-*}"
  git submodule init
  git config submodule.libs/webassembly/phc-winner-argon2.url "$srcdir/phc-winner-argon2"
  git config submodule.libs/webassembly/liboqs.url "$srcdir/liboqs"
  git config submodule.libs/Signal-FTS5-Extension.url "$srcdir/Signal-FTS5-Extension"
  git -c protocol.file.allow=always submodule update

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple

  _ensure_local_nvm
  nvm install "${_nodeversion}"

  export npm_config_cache="$srcdir/npm_cache"
  npm ci
}

build() {
  cd "${pkgname%-*}"
  CFLAGS+=" -ffat-lto-objects"
  export npm_config_cache="$srcdir/npm_cache"
  export RUSTUP_TOOLCHAIN=stable
  _ensure_local_nvm

  # Manually build sqlcipher extension to avoid build failure
  pushd node_modules/@signalapp/sqlcipher/deps/extension
  cargo build --release --target host-tuple
  popd

  node desktop --custom-desktop-release --unpacked
}

package() {
  cd "${pkgname%-*}"
  install -d "$pkgdir/opt/$pkgname/"
  cp -av artifacts/desktop/linux-unpacked/* "$pkgdir/opt/$pkgname/"
  chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/"

  for i in 64 512; do
    install -Dm644 resources/desktop-icons/icon/${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
