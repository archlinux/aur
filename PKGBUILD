# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=radare2-cutter
_gitcommit=6663c3ebeeaa98025f55732f90e084a0ea147f11
pkgver=1.0
pkgrel=1
pkgdesc='Qt and C++ GUI for radare2 reverse engineering framework (originally named Iaito)'
url='https://github.com/radareorg/cutter'
arch=('x86_64')
license=('GPL3')
depends=('radare2-git' 'capstone' 'qt5-base' 'qt5-svg' 'icu')
makedepends=('git' 'cmake')
source=(${pkgname}::"git+https://github.com/radareorg/cutter#commit=${_gitcommit}"
        git+https://github.com/radare/radare2)
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --always --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p ${pkgname}/build
  cd ${pkgname}/build

  git submodule init
  git config submodule.radare2.url "${srcdir}/radare2"
  git submodule update --recursive

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
  ../src
}

build() {
  cd ${pkgname}/build
  make
}

package() {
  cd ${pkgname}
  install -DTm 755 build/cutter "${pkgdir}/usr/bin/cutter"
  install -DTm 644 src/cutter.desktop "${pkgdir}/usr/share/applications/cutter.desktop"
  install -DTm 644 src/img/cutter.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cutter.svg"
  install -dm 755 docs/ "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -a docs/* "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim: ts=2 sw=2 et:
