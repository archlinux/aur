# Maintainer: Markus Koch <markus@notsyncing.net>
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=nvc-git
pkgver=r3073.078b5e7
pkgrel=1
pkgdesc="VHDL compiler and simulator"
arch=('i686' 'x86_64')
url="https://github.com/nickg/nvc"
license=('GPL3')
provides=('nvc')
conflicts=('nvc')
depends=(libelf llvm-libs ncurses zstd)
makedepends=(pkgconfig make flex check llvm tcl automake autoconf)
optdepends=('ruby: for the scripts to download and install VHDL libraries')
noextract=()
md5sums=('SKIP')
_gitname=nvc
_gitver=master
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
  sh ../configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${_gitname}"
}

package() {
  cd "${srcdir}/${_gitname}"
  cd _build
  make DESTDIR="${pkgdir}" install
  mkdir "${pkgdir}/usr/include/"
  cp "${srcdir}/${_gitname}/src/vhpi/vhpi_user.h" "${pkgdir}/usr/include/"
}

# EOF
