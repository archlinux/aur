# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=radare2-cutter-git
pkgver=1.0.r9.gb331dfd
pkgrel=1
pkgdesc="A Qt and C++ GUI for radare2 reverse engineering framework (originally named Iaito)"
url="https://github.com/radareorg/cutter"
arch=('i686' 'x86_64')
license=('GPL')
depends=('radare2-git' 'capstone' 'qt5-base' 'qt5-svg' 'icu')
makedepends=('git' 'cmake')
optdepends=()
provides=('radare2-cutter')
backup=()
source=("${pkgname}::git+https://github.com/radareorg/cutter.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "${pkgname}/build"
  cd "${pkgname}/build"

  cmake -DCMAKE_BUILD_TYPE=Release ../src
}

build() {
  cd "${pkgname}/build"
  make
}

package() {
  cd ${pkgname}

  install -DTm755 build/cutter "${pkgdir}/usr/bin/cutter"
  install -DTm644 src/cutter.desktop "${pkgdir}/usr/share/applications/cutter.desktop"
  install -DTm644 src/img/cutter.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cutter.svg"
  install -DTm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 docs/ "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -a docs/* "${pkgdir}/usr/share/doc/${pkgname}/"
}
