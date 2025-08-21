# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps-web-store-installer
_tagname=1.6.8
pkgver="${_tagname//-/_}"
pkgrel=4
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
  linyaps
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
  "linglong-pica: deb package to Linglong package tool."
)
source=("${pkgname}::git+${url}.git#tag=${_tagname}")
sha256sums=('3436e85fa8d36109a1ae22e5321a27b5d63360677cf052fef58d2f69e18c18dc')

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
