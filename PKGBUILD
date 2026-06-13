# Maintainer:  yjun <jerrysteve1101 at gmail dot com>
# Maintainer: taotieren <admin@taotieren.com>
# based on the PKGBUILD of dsview
# Origin Contributor: Anatol Pomozov
# Origin Contributor: Abdelhak Bougouffa <abougouffa@fedoraproject.org>
# Origin Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=pxview-git
pkgver=1.4.9.r2.g5d91251
pkgrel=1
epoch=1
pkgdesc='GUI program for supporting various instruments from PXLogic, including logic analyzers, oscilloscopes, etc.'
arch=($CARCH)
url='https://github.com/PXLogic/PXView'
license=(GPL-3.0-or-later)
depends=(
  hicolor-icon-theme 
  glib2
  glibc
  python 
  fftw
  libgcc
  libstdc++
  libusb 
  zlib 
  qt6-base 
  qt6-websockets
)
makedepends=(
  boost
  boost-libs
  cmake
  ninja
  npm
  git
  librsvg
  nlohmann-json
  minizip
  qt6-svg 
  qt6-tools
  pkgconf
  vulkan-headers
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^PXView_v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  cd "${srcdir}"/${pkgname}/

  sed -i 's#MODE="0666"#TAG+="uaccess"#' PXView/px.rules
}
 
build() {
  cd "${srcdir}"/${pkgname}/

  # see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -B build \
    -G Ninja

  ninja -C build
  ninja -C build webui
}

check() {
  cd "${srcdir}"/${pkgname}/
  ctest --test-dir build --output-on-failure
}

package() {
  cd "${srcdir}"/${pkgname}/

  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: set sw=2 ts=2 et:
