# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps
pkgver=1.8.0
pkgrel=1
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
optdepends=(
  "linglong-pica: deb package to Linglong package tool."
  "ll-killer-go: 玲珑杀手 Go: 玲珑应用快速构建系统"
)
install=${pkgname}.install
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}.install"
)
sha256sums=('3d7813d17aa6a7c6cb2961203a335c76385936e0ae2ce7dad7a0bb88301a6d0c'
            '2ede7bc18aad4065a5c3f4552af1dde0b029099d572670b118a1453bf3d75f66')

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
