# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps-installer
_tagname=v1.6.6
pkgver="${_tagname//-/_}"
pkgrel=1
pkgdesc='玲珑（Linglong）linyaps-web-store-installer is a package installer for the Linyaps Web store.'
arch=($CARCH)
url='https://github.com/OpenAtom-Linyaps/linyaps-web-store-installer'
license=('LGPL-3.0-or-later')
provides=(
  ${pkgname}
)
conflicts=(
  ${pkgname}
)
replaces=()
_qt=qt6
depends=(
  gcc-libs
  glibc
  ${_qt}-base
  xdg-utils
)
makedepends=(
  cmake
  git
  gtest
  ninja
  ${_qt}-tools
  pkgconf
)
checkdepends=()
optdepends=(
  "linyaps: Linglong is the container application toolkit ofdeepin."
  "linyaps-box: 玲珑（Linglong） is the container application toolkit of deepin."
  "linglong-pica: deb package to Linglong package tool."
)
source=("${pkgname}::git+${url}.git#tag=${_tagname}")
sha256sums=('9ed8959c7c4e92976e92ded10ac7c6f112271ef3241ceee26e57e2109f6165d2')

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}"/${pkgname}/

  # see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -Wno-dev \
    -B build \
    -G Ninja

  ninja -C build
}

# check() {
#   cd "${srcdir}"/${pkgname}/
#   ctest --test-dir build --output-on-failure
# }

package() {
  cd "${srcdir}"/${pkgname}
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
