# Maintainer: abdul444

pkgname=rats-search
pkgver=2.3.6
pkgrel=1
pkgdesc="BitTorrent P2P search engine with an integrated torrent client"
arch=('x86_64')
url="https://github.com/librats/rats-search"
license=('MIT' 'GPL-3.0-only')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'mariadb-libs'
  'qt6-base>=6.9'
  'qt6-websockets>=6.9'
  'zlib'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'qt6-tools'
)

_librats_commit=364169f06d9ed38abdf95c6b000855849302eb78

# Search is backed by a Manticore daemon. Upstream pins its own prebuilt
# searchd through the imports/ submodule; the application itself is built from
# source, but searchd is taken from that same pinned binary repository.
_manticore_commit=b4951cbf49324d9f8d2c4702d3a4e236feae0a48
_manticore_license_commit=9d4cd4df2d8a3758099dd77009394003f809c615

source=(
  "$pkgname::git+$url.git#tag=v$pkgver"
  "librats::git+https://github.com/librats/librats.git#commit=$_librats_commit"
  "searchd::https://raw.githubusercontent.com/DEgITx/manticore-binary/$_manticore_commit/linux/x64/searchd"
  "manticore-LICENSE::https://raw.githubusercontent.com/manticoresoftware/manticoresearch/$_manticore_license_commit/LICENSE"
  "0001-disable-startup-update-check.patch"
)
sha256sums=('SKIP'
            'SKIP'
            'a9e138c95e621442a2240f8af65ea230de260885d2b12a51ad280644e3041337'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '4f91f3e63ad7714206f96715601b7908b71fe8ff530cda021936495317dc5401')

prepare() {
  cd "$srcdir/$pkgname"

  git submodule init src/librats
  git config submodule.src/librats.url "$srcdir/librats"
  git -c protocol.file.allow=always submodule update --init src/librats

  # Upstream ships Manticore's searchd next to the executable (imports/ tree).
  # Only searchd is used at runtime; the other bundled Manticore tools are not.
  install -Dm755 "$srcdir/searchd" "imports/linux/x64/searchd"

  # Distribution packages are updated through pacman, not by the in-app updater.
  patch -Np1 -i "$srcdir/0001-disable-startup-update-check.patch"
}

build() {
  cmake -S "$srcdir/$pkgname" -B "$srcdir/build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRATS_SEARCH_BUILD_TESTS=ON \
    -DRATS_SEARCH_USE_SYSTEM_LIBRATS=OFF

  cmake --build "$srcdir/build"
}

check() {
  # The integration test locates searchd through PATH; the copy in imports/ is
  # only found for in-tree builds, not for makepkg's sibling build directory.
  install -d "$srcdir/test-bin"
  ln -sf "$srcdir/$pkgname/imports/linux/x64/searchd" "$srcdir/test-bin/searchd"

  cd "$srcdir/build"
  PATH="$srcdir/test-bin:$PATH" QT_QPA_PLATFORM=offscreen ctest --output-on-failure
}

package() {
  cd "$srcdir/$pkgname"

  # The application locates imports/linux/x64/searchd relative to its own
  # executable, so keep the binary and the bundled engine together.
  install -Dm755 "$srcdir/build/bin/RatsSearch" "$pkgdir/usr/lib/$pkgname/RatsSearch"
  install -Dm755 "imports/linux/x64/searchd" "$pkgdir/usr/lib/$pkgname/imports/linux/x64/searchd"

  # The executable derives the location of imports/ from its own path, so it
  # must live next to them. The wrapper keeps applicationDirPath() on the real
  # binary instead of on the /usr/bin symlink.
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
exec /usr/lib/rats-search/RatsSearch "$@"
EOF

  install -Dm644 "resources/icons/512x512.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Rats Search
GenericName=BitTorrent Search Engine
Comment=Search the BitTorrent DHT network and download torrents
Exec=rats-search
Icon=rats-search
Terminal=false
Categories=Network;P2P;FileTransfer;
Keywords=torrent;bittorrent;dht;search;p2p;
StartupNotify=true
EOF

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/librats/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.librats"
  install -Dm644 "$srcdir/manticore-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.manticore"
}
