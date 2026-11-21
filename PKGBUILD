# Maintainer: Amog-us <ask at amogussugomus at proton dot me>
# Contributor: davedatum <ask at davedatum dot com>

pkgname=rats-search-git
pkgver=2.3.6.r1.g826b2bd
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
  'cmake>=3.16'
  'git'
  'ninja'
  'qt6-tools>=6.9'
)
provides=('rats-search')
conflicts=('rats-search')

_appname=rats-search

# Upstream pins its own prebuilt Manticore searchd through the imports/
# submodule. The application is built from source; only searchd is shipped.
_manticore_license_commit=9d4cd4df2d8a3758099dd77009394003f809c615

source=(
  "$pkgname::git+$url.git"
  "librats::git+https://github.com/librats/librats.git"
  "manticore-binary::git+https://github.com/DEgITx/manticore-binary.git"
  "manticore-LICENSE::https://raw.githubusercontent.com/manticoresoftware/manticoresearch/$_manticore_license_commit/LICENSE"
  "rats-search-git.desktop"
  "0001-disable-startup-update-check.patch"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'a03e5803cb4226c5a3141308e17a20944737c0bac96ebbf120816ef82e7a04ed'
            '4f91f3e63ad7714206f96715601b7908b71fe8ff530cda021936495317dc5401')

pkgver() {
  cd "$srcdir/$pkgname"

  local desc
  if desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
    printf '%s\n' "${desc#v}" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$srcdir/$pkgname"

  git submodule init src/librats imports
  git config submodule.src/librats.url "$srcdir/librats"
  git config submodule.imports.url "$srcdir/manticore-binary"
  git -c protocol.file.allow=always submodule update --init src/librats imports

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
  install -Dm755 "$srcdir/build/bin/RatsSearch" "$pkgdir/usr/lib/$_appname/RatsSearch"
  install -Dm755 "imports/linux/x64/searchd" "$pkgdir/usr/lib/$_appname/imports/linux/x64/searchd"

  # The executable derives the location of imports/ from its own path, so it
  # must live next to them. The wrapper keeps applicationDirPath() on the real
  # binary instead of on the /usr/bin symlink.
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_appname" <<'EOF'
#!/bin/sh
exec /usr/lib/rats-search/RatsSearch "$@"
EOF

  install -Dm644 "$srcdir/rats-search-git.desktop" \
    "$pkgdir/usr/share/applications/$_appname.desktop"

  install -Dm644 "resources/icons/512x512.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_appname.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/librats/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.librats"
  install -Dm644 "$srcdir/manticore-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.manticore"
}
