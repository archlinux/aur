#
# nvc PKGBUILD
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#

pkgname=nvc-git
pkgver=r2798.e2bdf92
pkgrel=1
pkgdesc="VHDL compiler and simulator"
arch=('i686' 'x86_64')
url="https://github.com/nickg/nvc"
license=('GPLv3')
depends=('llvm' 'tcl')
makedepends=('pkgconfig' 'make' 'flex')
noextract=()
md5sums=('SKIP')
_gitname=nvc
_gitver=master
_gitrepo=https://github.com/nickg/${_gitname}.git
source=("git+https://github.com/nickg/${_gitname}.git")

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
}

build() {
  cd "${srcdir}/${_gitname}"
  #sh ./autogen.sh
  autoreconf --force --install -I m4
  sh ./tools/fetch-ieee.sh
  mkdir -p _build
  cd _build
  sh ../configure
  make
}

check() {
  cd "${srcdir}/${_gitname}"
}

package() {
  cd "${srcdir}/${_gitname}"
  cd _build
  make DESTDIR="${pkgdir}" install
  mkdir "${pkgdir}/usr/local/include/"
  cp "${srcdir}/${_gitname}/src/vhpi/vhpi_user.h" "${pkgdir}/usr/local/include/"
}
