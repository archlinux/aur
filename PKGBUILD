# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Alex Curtis <AlexDotJDotCurtisAtProtonDotMe>
pkgname=(
  'limo'
  'limo-docs'
)
pkgbase=limo
_app_id="io.github.${pkgbase}_app.$pkgbase"
pkgver=1.2.2
pkgrel=3
pkgdesc="A simple Qt based mod manager"
arch=('x86_64')
url="https://github.com/limo-app/limo"
license=('GPL-3.0-or-later')
depends=(
  'cpr'
  'curl'
  'hicolor-icon-theme'
  'jsoncpp'
  'libarchive'
  'libloot'
  'libunrar'
  'lz4'
  'openssl'
  'pugixml'
  'qt5-base'
  'qt5-svg'
  'xdg-utils'
  'zlib'
  'zstd'
)
makedepends=(
  'cmake'
  'doxygen'  # docs
  'git'
  'graphviz'  # docs
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("git+https://github.com/limo-app/limo.git#tag=v$pkgver"
        'libloot-compat.patch'
        'gcc16.patch')
sha256sums=('d9d9870d56ffef64400c40e19a358ed422ded57dd4d09cfec2b2b4dfb3a2f60b'
            '4b3b21fa40c64c23c6e5ffd6a0408dcd073e5d1c13a750926bbb249423c579b1'
            'ab37df7d1cff5358252c7b8fd59514bbfb88e93f9e40345f71403e806ae47e36')

prepare() {
  cd "$pkgbase"

  # Separate load list into two calls to preserve libloot compatibility
  # https://github.com/limo-app/limo/issues/203
  # https://github.com/limo-app/limo/pull/191
  patch -Np1 -i ../libloot-compat.patch

  # Add missing <cstdint> and <iomanip> includes for GCC 16
  # https://github.com/limo-app/limo/issues/271
  # https://github.com/limo-app/limo/pull/270
  patch -Np1 -i ../gcc16.patch
}

build() {
  cmake -B build -S "$pkgbase" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DLIMO_INSTALL_PREFIX='/usr' \
    -DUSE_SYSTEM_LIBUNRAR='ON' \
    -DBUILD_TESTING='OFF' \
    -Wno-author
  cmake --build build

  cd "$pkgbase"

  # build documentation
  doxygen src/lmm_Doxyfile
}

check() {
  cd "$pkgbase"
  appstreamcli validate --no-net "flatpak/${_app_id}.metainfo.xml" || :
  desktop-file-validate "flatpak/${_app_id}.desktop"
}

package_limo() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgbase"
  install -Dm644 "flatpak/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 resources/logo.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/${_app_id}.png"
  install -Dm644 resources/logo_small.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/${_app_id}.png"
}

package_limo-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  cd "$pkgbase"
  install -d "$pkgdir/usr/share/doc/$pkgbase"
  cp -r doc/* "$pkgdir/usr/share/doc/$pkgbase/"
}
