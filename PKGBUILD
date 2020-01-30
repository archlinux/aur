# Maintainer: arch AT nnamuab DOT de
pkgname=phreeqc
pkgver=3.5.0
_pkgsvn=14000
pkgrel=2
pkgdesc="A Computer Program for Speciation, Batch-Reaction, One-Dimensional Transport, and Inverse Geochemical Calculations"
arch=('x86_64')
url="http://wwwbrr.cr.usgs.gov/projects/GWC_coupled/phreeqc/"
license=('custom:CC0')
groups=()
depends=('gmp')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="install.sh"
changelog=
source=("http://water.usgs.gov/water-resources/software/PHREEQC/${pkgname}-${pkgver}-${_pkgsvn}.tar.gz"
        install.sh
        phreeqc.el
        "https://raw.githubusercontent.com/jaalto/project-emacs--folding-mode/master/folding.el")
md5sums=('0e77b2538d61df00212b9f648aae9c75'
         '8facd6e784cd1985b2c57c092b753002'
         '914dcb4f5e6e148d8c580346dacf97db'
         '17b0ad8422172efda2051eefac4a33a9')

build() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgsvn"
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
  install -m644 ../folding.el ${pkgdir}/usr/share/emacs/site-lisp/$pkgname

  # install licence
  mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
  install -m644 doc/NOTICE ${pkgdir}/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
