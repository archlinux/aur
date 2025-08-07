# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps-installer
_tagname=1.6.7
pkgver="${_tagname//-/_}"
pkgrel=3
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
source=("${pkgname}::git+${url}.git#tag=v${_tagname}")
sha256sums=('6bde58936b4a7562dfe6b9470e69220c2bfd1bb6be442f5bcd429e95033ddafa')

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
