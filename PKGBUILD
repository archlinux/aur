# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=tcl-nothreading
pkgver=8.6.5
pkgrel=2
pkgdesc="The Tcl scripting language with threading disabled"
arch=('i686' 'x86_64')
url="http://tcl.sourceforge.net/"
license=('custom')
depends=('zlib')
provides=('tcl=8.6.5')
conflicts=('tcl')
options=('staticlibs')
source=(http://downloads.sourceforge.net/sourceforge/tcl/tcl${pkgver}-src.tar.gz tcl-fix-segv.patch)
sha1sums=('c3a50ea58dac00a3c7e83cb4a4651c40d0f55160'
          '1ec4fd9d159b920c15655936b1418034387114f0')

prepare() {
  cd tcl${pkgver}
  # we build the tcl sqlite interface in sqlite-tcl package
  rm -rf pkgs/sqlite3*
  # fix SEGV if cpu supports HLE/RTM http://core.tcl.tk/tcl/info/d3071887dbc7aeac
  patch -p1 -i ../tcl-fix-segv.patch
}

build() {
  cd tcl${pkgver}/unix
  [[ $CARCH == "x86_64" ]] && BIT="--enable-64bit"
  ./configure --prefix=/usr --mandir=/usr/share/man --disable-threads $BIT
  make
}

package() {
  cd tcl${pkgver}/unix
  make INSTALL_ROOT="${pkgdir}" install install-private-headers
  ln -sf tclsh${pkgver%.*} "${pkgdir}/usr/bin/tclsh"
  ln -sf libtcl${pkgver%.*}.so "${pkgdir}/usr/lib/libtcl.so"
  install -Dm644 ../license.terms "${pkgdir}/usr/share/licenses/tcl/LICENSE"

  # remove buildroot traces
  sed -e "s#${srcdir}/tcl${pkgver}/unix#/usr/lib#" \
      -e "s#${srcdir}/tcl${pkgver}#/usr/include#" \
      -i "${pkgdir}/usr/lib/tclConfig.sh"

  tdbcver=tdbc1.0.4
  sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/$tdbcver#/usr/lib/$tdbcver#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver/generic#/usr/include#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver/library#/usr/lib/tcl${pkgver%.*}#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver#/usr/include#" \
      -i "${pkgdir}/usr/lib/$tdbcver/tdbcConfig.sh"

  itclver=itcl4.0.4
  sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/$itclver#/usr/lib/$itclver#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$itclver/generic#/usr/include#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$itclver#/usr/include#" \
      -i "${pkgdir}/usr/lib/$itclver/itclConfig.sh"
}
