# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=tcl-nothreading
pkgver=8.6.8
pkgrel=1
pkgdesc="The Tcl scripting language with threading disabled"
arch=('x86_64')
url="http://tcl.sourceforge.net/"
license=('custom')
depends=('zlib')
options=('staticlibs')
provides=("tcl=${pkgver}")
conflicts=('tcl')
source=(http://downloads.sourceforge.net/sourceforge/tcl/tcl${pkgver}-src.tar.gz)
sha1sums=('0d014d97ca38534d4be1dfc6c563a7a3a6aa737f')

prepare() {
  cd tcl${pkgver}
  # we build the tcl sqlite interface in sqlite-tcl package
  rm -rf pkgs/sqlite3*
}

build() {
  cd tcl${pkgver}/unix
  ./configure --prefix=/usr --mandir=/usr/share/man --disable-threads --enable-64bit
  make
}

package() {
  cd tcl${pkgver}/unix
  make INSTALL_ROOT="${pkgdir}" install install-private-headers
  ln -sf tclsh${pkgver%.*} "${pkgdir}/usr/bin/tclsh"
  ln -sf libtcl${pkgver%.*}.so "${pkgdir}/usr/lib/libtcl.so"
  install -Dm644 ../license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 tcl.m4 -t "$pkgdir"/usr/share/aclocal

  # remove buildroot traces
  sed -e "s#${srcdir}/tcl${pkgver}/unix#/usr/lib#" \
      -e "s#${srcdir}/tcl${pkgver}#/usr/include#" \
      -i "${pkgdir}/usr/lib/tclConfig.sh"

  tdbcver=tdbc1.0.6
  sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/$tdbcver#/usr/lib/$tdbcver#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver/generic#/usr/include#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver/library#/usr/lib/tcl${pkgver%.*}#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver#/usr/include#" \
      -i "${pkgdir}/usr/lib/$tdbcver/tdbcConfig.sh"

  itclver=itcl4.1.1
  sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/$itclver#/usr/lib/$itclver#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$itclver/generic#/usr/include#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/$itclver#/usr/include#" \
      -i "${pkgdir}/usr/lib/$itclver/itclConfig.sh"
}
