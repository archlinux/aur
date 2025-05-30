# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps-box
_tagname=2.0.0-rc.5
pkgver="${_tagname//-/_}"
pkgrel=3
pkgdesc='玲珑（Linglong） is the container application toolkit of deepin.'
arch=($CARCH)
url='https://github.com/OpenAtom-Linyaps/linyaps-box'
license=('LGPL-3.0-or-later')
provides=(
  ${pkgname}
)
conflicts=(
  ${pkgname}
)
replaces=()
depends=(
  gcc-libs
  glibc
  libcap
)
makedepends=(
  cmake
  git
  gtest
  ninja
  libseccomp
  nlohmann-json
  pkgconf
  yaml-cpp
)
checkdepends=()
optdepends=(
  "linyaps: Linglong is the container application toolkit ofdeepin."
  "linglong-pica: deb package to Linglong package tool."
)
source=("${pkgname}-${_tagname}.tar.gz::${url}/archive/refs/tags/${_tagname}.tar.gz")
sha1sums=('773e453629b88bad83fbc85710da4420f1a7b612')

build() {
  cd "${srcdir}"/${pkgname}-${_tagname}/

  # see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Dlinyaps-box_STATIC=OFF \
    -Dlinyaps-box_ENABLE_SECCOMP_DEFAULT=ON \
    -Wno-dev \
    -B build \
    -G Ninja

  #   cmake --preset=release \
  #     -DCMAKE_INSTALL_PREFIX=/usr \
  #     -Wno-dev \
  #     -B build \
  #     -G Ninja

  ninja -C build
}

# check() {
#   cd "${srcdir}"/${pkgname}-${_tagname}/
#   ctest --test-dir build --output-on-failure
# }

package() {
  cd "${srcdir}"/${pkgname}-${_tagname}
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
