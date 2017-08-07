#
# PKGBUILD for djgpp-allegro4
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#

#
# TODO:
#
# /usr/lib/gcc/i686-pc-msdosdjgpp/6.1.0/../../../../i686-pc-msdosdjgpp/lib/liballeg.a: error adding symbols: Archive has no index; run ranlib to add one
# collect2: error: ld returned 1 exit status
#

_pkgname=allegro
_pkgver=4.2.3.1

pkgname=djgpp-allegro4
pkgver=${_pkgver}
pkgrel=3
epoch=
pkgdesc="Allegro..."
arch=('i686' 'x86_64')
url="http://liballeg.org/old.html"
license=('custom')
groups=()
depends=('ncurses' 'libusb' 'libusb-compat')
makedepends=('djgpp-gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
noextract=()
source=(https://github.com/liballeg/allegro5/releases/download/v4-2-3-1/${_pkgname}-${_pkgver}.tar.gz)
md5sums=('92b0af3cccc5f3b4c3c1aad69a32baa9')


#_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_target="i686-pc-msdosdjgpp"

_pkgsrcdir="${_pkgname}-${pkgver}"

prepare() {
  cd "${srcdir}/${_pkgsrcdir}"
  
  patch -p0 < ${startdir}/makefile.all.djgpp.patch
  patch -p0 < ${startdir}/makefile.dj.djgpp.patch
  patch -p0 < ${startdir}/misc_mdhelper_sh.djgpp.patch
  patch -p0 < ${startdir}/src_misc_vbeafex_c.djgpp.patch
  
  sh ./fix.sh djgpp --quick
}

build() {
  cd "${srcdir}/${_pkgsrcdir}"

  make CROSSCOMPILE=1 UNIX_TOOLS=1 XPREFIX="${_target}-" DJDIR="/usr/${_target}" INSTALLDIR="${pkgdir}/usr/${_target}" lib

}

check() {
  cd "${srcdir}/${_pkgsrcdir}"
}

package() {
  cd "${srcdir}/${_pkgsrcdir}"
  make CROSSCOMPILE=1 UNIX_TOOLS=1 XPREFIX="${_target}-" DJDIR="/usr/${_target}" INSTALLDIR="${pkgdir}/usr/${_target}" install
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
}

# EOF
