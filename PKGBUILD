# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=lib32-tcl-ar
pkgver=8.6.14
pkgrel=1
pkgdesc='The Tcl scripting language (with *.a files)'
arch=(x86_64)
url=http://tcl.sourceforge.net/
provides=("lib32-tcl=${pkgver}")
conflicts=("lib32-tcl")
license=(custom)
depends=(
  lib32-glibc
  lib32-zlib
  tcl
)
makedepends=(multilib-devel)
options=('staticlibs' '!lto')
source=("https://cfhcable.dl.sourceforge.net/project/tcl/Tcl/${pkgver}/tcl${pkgver}-src.tar.gz")
sha256sums=('5880225babf7954c58d4fb0f5cf6279104ce1cd6aa9b71e9a6322540e1c4de66')

prepare() {
  cd tcl${pkgver}
  rm -rf pkgs/sqlite3*
}

build() {
  cd tcl${pkgver}/unix
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS+=" -lm"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config
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
  # find "${pkgdir}" -type f -name '*.a' -delete
  ln -sf libtcl${pkgver%.*}.so "${pkgdir}"/usr/lib32/libtcl.so

  sed -e "s#${srcdir}/tcl${pkgver}/unix#/usr/lib32#" \
    -e "s#${srcdir}/tcl${pkgver}#/usr/include#" \
    -i "${pkgdir}/usr/lib32/tclConfig.sh"

  tdbcver=1.1.7
  sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/tdbc${tdbcver}#/usr/lib32/tdbc${tdbcver}#" \
    -e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc${tdbcver}/generic#/usr/include#" \
    -e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc${tdbcver}/library#/usr/lib32/tcl${pkgver%.*}#" \
    -e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc${tdbcver}#/usr/include#" \
    -i "${pkgdir}/usr/lib32/tdbc${tdbcver}/tdbcConfig.sh"

  itclver=4.2.4
  sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/itcl${itclver}#/usr/lib32/${itclver}#" \
    -e "s#${srcdir}/tcl${pkgver}/pkgs/itcl${itclver}/generic#/usr/include#" \
    -e "s#${srcdir}/tcl${pkgver}/pkgs/itcl${itclver}#/usr/include#" \
    -i "${pkgdir}/usr/lib32/itcl${itclver}/itclConfig.sh"

  install -dm 755 -p "${pkgdir}"/usr/share/licenses
  ln -s tcl "${pkgdir}"/usr/share/licenses/lib32-tcl
}

# vim: ts=2 sw=2 et:
