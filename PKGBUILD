# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=cutter-git
pkgver=1.0.r4.g7c2bd97
pkgrel=1
pkgdesc="A Qt and C++ GUI for radare2 reverse engineering framework (originally named Iaito)"
url="https://github.com/radareorg/cutter"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git' 'binutils' 'cmake' 'gcc' 'qt5-base')
depends=('radare2')
optdepends=()
provides=('cutter')
backup=()
source=("${pkgname}::git://github.com/radareorg/cutter.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "${pkgname}/build"
  cd "${pkgname}/build"

  cmake ../src
}

build() {
  cd "${pkgname}/build"
  make -j$(getconf _NPROCESSORS_ONLN)
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
