# Maintainer: arch AT nnamuab DOT de
pkgname=phreeqc
pkgver=3.3.12
_pkgsvn=12704
pkgrel=1
pkgdesc="A Computer Program for Speciation, Batch-Reaction, One-Dimensional Transport, and Inverse Geochemical Calculations"
arch=('i686' 'x86_64')
url="http://wwwbrr.cr.usgs.gov/projects/GWC_coupled/phreeqc/"
license=('custom')
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
source=("ftp://brrftp.cr.usgs.gov/pub/charlton/phreeqc/phreeqc-$pkgver-$_pkgsvn.tar.gz"
        install.sh
        phreeqc.el
        "https://raw.githubusercontent.com/jaalto/project-emacs--folding-mode/master/folding.el")
md5sums=('d893ad155e02554e08a25c6cc36c2d67'
         '8facd6e784cd1985b2c57c092b753002'
         '2661645b6a28535f172b2314303c400b'
         'd262512bd4a19a68805914d35f8f9019')

build() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgsvn"
  ./configure --prefix=/usr
  make -j6 CCFLAGS="-O3 -Wall -ansi -pedantic -DHAVE_ISFINITE -DNDEBUG -mtune=native"
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
