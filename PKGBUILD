# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps
pkgver=1.7.0
pkgrel=0
pkgdesc='Linglong is the container application toolkit of deepin.'
arch=($CARCH)
url='https://github.com/OpenAtom-Linyaps/linyaps'
license=('LGPL-3.0-or-later')
provides=(
  ${pkgname}
  linglong
)
conflicts=(
  ${pkgname}
  linglong
)
replaces=(linglong-git)
_qt=qt5
depends=(
  sh
  curl
  gcc-libs
  glib2
  glibc
  libelf
  libseccomp
  ${_qt}-base
  systemd-libs
  ostree
  yaml-cpp
)
makedepends=(
  cli11
  cmake
  git
  gtest
  ${_qt}-tools
  ninja
  nlohmann-json
  openssl
  pkgconf
  tl-expected
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/V${pkgver}.tar.gz")
sha1sums=('9bdcbc615460966faff3a3a018b23cb65b80cac0')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}/
  # see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCPM_LOCAL_PACKAGES_ONLY=ON \
    -DLINGLONG_VERSION="$pkgver" \
    -Wno-dev \
    -B build \
    -G Ninja

  ninja -C build
}

# check() {
#   cd "${srcdir}"/${pkgname}-${pkgver}/
#   ctest --test-dir build --output-on-failure
# }

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}-${pkgver}/build install
}
