# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
# Many thanks to the PKGBUILD for augeas (currently in [Community]) and the
# respective contributors and maintainer(s).
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
pkgname=augeas-git
pkgver=r2665.6418925
pkgrel=1
pkgdesc="A configuration editing tool that parses config files and transforms them into a tree (Git checkout)"
arch=('i686' 'x86_64')
url="http://augeas.net"
license=('LGPL')
install=
changelog=
noextract=()
depends=('libxml2' 'gcc-libs')
# optional, as the autogen.sh pulls in a copy. however, if you uncomment this line below, switch make lines below. untested.
#makedepends=('gnulib-git')
_pkgname=augeas
source=("${_pkgname}::git+https://github.com/hercules-team/${_pkgname}.git")
sha512sums=('SKIP')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver() {
  cd "${srcdir}/${_pkgname}"
  (
     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #( set -o pipefail
  #  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  #  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #)
  )
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh
	sed -i 's|Requires:.*|Requires: libxml-2.0|' augeas.pc.in
	./configure --prefix=/usr
	make
	# make --gnulib-srcdir=/usr/share/gnulib
}

package() {
	cd ${srcdir}/${_pkgname}
	make DESTDIR="${pkgdir}" install
}
