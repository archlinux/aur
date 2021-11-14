# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=lib32-tcl
pkgver=8.6.12
pkgrel=1
pkgdesc='The Tcl scripting language'
arch=(x86_64)
url=http://tcl.sourceforge.net/
license=(custom)
depends=(
  lib32-glibc
  lib32-zlib
  tcl
)
options=(staticlibs)
source=(https://downloads.sourceforge.net/sourceforge/tcl/tcl${pkgver}-src.tar.gz)
b2sums=('21367f4ee5903fac68177b6cc61517237e1b9347a18f213cb02ebd7cde21af9d5590d7270bc5ba8c03f3595dea1f2eaf065165b1cc0b0bc34e5329cd197b8159')

prepare() {
  cd tcl${pkgver}

  rm -rf pkgs/sqlite3*
}

build() {
  cd tcl${pkgver}/unix

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --mandir=/usr/share/man \
    --enable-threads
  make
}

package() {
  cd tcl${pkgver}/unix

  make INSTALL_ROOT="${pkgdir}" install install-private-headers
  rm -rf "${pkgdir}"/usr/{bin,include,lib,share}
  ln -sf libtcl${pkgver%.*}.so "${pkgdir}"/usr/lib32/libtcl.so
  strip "${pkgdir}"/usr/lib32/libtcl8.6.so
  chmod 644 "${pkgdir}"/usr/lib32/libtclstub8.6.a

  sed -e "s#${srcdir}/tcl${pkgver}/unix#/usr/lib32#" \
      -e "s#${srcdir}/tcl${pkgver}#/usr/include#" \
      -i "${pkgdir}/usr/lib32/tclConfig.sh"

  tdbcver=1.1.3
  sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/tdbc${tdbcver}#/usr/lib32/tdbc${tdbcver}#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc${tdbcver}/generic#/usr/include#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc${tdbcver}/library#/usr/lib32/tcl${pkgver%.*}#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc${tdbcver}#/usr/include#" \
      -i "${pkgdir}/usr/lib32/tdbc${tdbcver}/tdbcConfig.sh"

  ictlver=4.2.2
  sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/itcl${ictlver}#/usr/lib32/${ictlver}#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/itcl${ictlver}/generic#/usr/include#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/itcl${ictlver}#/usr/include#" \
      -i "${pkgdir}/usr/lib32/itcl${ictlver}/itclConfig.sh"


  install -dm 755 -p "${pkgdir}"/usr/share/licenses
  ln -s tcl "${pkgdir}"/usr/share/licenses/lib32-tcl
}

# vim: ts=2 sw=2 et:
