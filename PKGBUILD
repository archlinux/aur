# Maintainer: arch AT nnamuab DOT de
pkgname=phreeqc
pkgver=3.8.6
_pkgsvn=17100
pkgrel=2
pkgdesc="A Computer Program for Speciation, Batch-Reaction, One-Dimensional Transport, and Inverse Geochemical Calculations"
arch=('x86_64')
url="https://www.usgs.gov/software/phreeqc-version-3"
license=('custom:CC0')
depends=('gmp')
backup=()
install="install.sh"
source=("https://water.usgs.gov/water-resources/software/PHREEQC/${pkgname}-${pkgver}-${_pkgsvn}.tar.gz"
        install.sh
        phreeqc.el
        phreeqc-tmplog.patch)
md5sums=('7d0fd60d4e3d774ad467270f25f9550b'
         '8facd6e784cd1985b2c57c092b753002'
         'a059e5cf856ab104d278185d4f4199d6'
         '88b218f5687246282a9cca3c3d95118d')
backup=(usr/share/phreeqc/database/phreeqc.dat)


build() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgsvn"
  patch -p0 -i "${srcdir}/phreeqc-tmplog.patch"
  ./configure --prefix=/usr
  make CCFLAGS="-O3 -Wall -ansi -pedantic -DHAVE_ISFINITE -DNDEBUG -mtune=native"
}

package() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgsvn"

  make DESTDIR="${pkgdir}" install
  
  # move database and example files into previous location
  mkdir -p ${pkgdir}/usr/share/phreeqc/
  mv ${pkgdir}/usr/share/doc/phreeqc/database ${pkgdir}/usr/share/phreeqc/
  mv ${pkgdir}/usr/share/doc/phreeqc/examples ${pkgdir}/usr/share/phreeqc/

  # install supplementary files
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp/$pkgname
  install -m644 ../phreeqc.el ${pkgdir}/usr/share/emacs/site-lisp/$pkgname

  # install licence
  mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
  install -m644 doc/NOTICE ${pkgdir}/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
