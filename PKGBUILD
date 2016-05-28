# AUR Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>
# based on PKGBUILD of official PKGBUILD for tcl 8.6.4-1
# $Id: PKGBUILD 234188 2015-03-20 02:51:39Z eric $
# Original Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=tcl86
pkgver=8.6.4
pkgrel=1
pkgdesc="The Tcl scripting language, 8.6 series"
provides=('tcl=8.6.4')
conflicts=('tcl')
arch=('i686' 'x86_64')
url="http://tcl.sourceforge.net/"
license=('custom')
depends=('zlib')
options=('staticlibs')
source=(http://downloads.sourceforge.net/sourceforge/tcl/tcl${pkgver}-src.tar.gz)
sha1sums=('33c5a083a23cf54f15e25a9e787dc39ef3fa0a2b')

prepare() {
  cd tcl${pkgver}
  # we build the tcl sqlite interface in sqlite-tcl package
  rm -rf pkgs/sqlite3*
}

build() {
  cd tcl${pkgver}/unix
  [[ $CARCH == "x86_64" ]] && BIT="--enable-64bit"
  ./configure --prefix=/usr --mandir=/usr/share/man --enable-threads $BIT
  make
}

#check() {
#  cd tcl${pkgver}/unix
#  make test
#}

package() {
  cd tcl${pkgver}/unix
  make INSTALL_ROOT="${pkgdir}" install install-private-headers
  ln -sf tclsh${pkgver%.*} "${pkgdir}/usr/bin/tclsh"
  ln -sf libtcl${pkgver%.*}.so "${pkgdir}/usr/lib/libtcl.so"
  install -Dm644 ../license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove buildroot traces
  sed -e "s#${srcdir}/tcl${pkgver}/unix#/usr/lib#" \
      -e "s#${srcdir}/tcl${pkgver}#/usr/include#" \
      -i "${pkgdir}/usr/lib/tclConfig.sh"

  tdbcver=tdbc1.0.3
  sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/$tdbcver#/usr/lib/$tdbcver#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver/generic#/usr/include#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver/library#/usr/lib/tcl${pkgver%.*}#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver#/usr/include#" \
      -i "${pkgdir}/usr/lib/$tdbcver/tdbcConfig.sh"

  itclver=itcl4.0.3
  sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/$itclver#/usr/lib/$itclver#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$itclver/generic#/usr/include#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$itclver#/usr/include#" \
      -i "${pkgdir}/usr/lib/$itclver/itclConfig.sh"
}
