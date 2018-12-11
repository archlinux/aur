# Maintainer: Maxime Arthaud <maxime@arthaud.me>
# Author: Vivien Maisonneuve
# Category: science

pkgname='apron-svn'
pkgver=0.9.11.r1104
pkgrel=1
pkgdesc='APRON numerical abstract domain library'
arch=('i686' 'x86_64')
url='http://apron.cri.ensmp.fr/library/'
license=('LGPL2')
provides=('apron')
conflicts=('apron')
depends=('gmp>=5' 'mpfr>=3' 'ppl')
makedepends=('svn' 'sed')
source=("$pkgname::svn://scm.gforge.inria.fr/svnroot/apron/apron/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local rel="$(sed -n 's|Version \([^ ]\+\) *$|\1|p' Changes | head -n 1)"
  local ver="$(svnversion)"
  printf "%s.r%s" "$rel" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed \
    -e 's|^APRON_PREFIX *=.*$|APRON_PREFIX=/usr|' \
    -e 's|^HAS_OCAML *=.*$|HAS_OCAML=|' \
    -e 's|^HAS_OCAMLOPT *=.*$|HAS_OCAMLOPT=|' \
    -e 's|^OCAMLFIND *=.*$|OCAMLFIND=|' \
    -e 's|^# HAS_PPL *=.*$|HAS_PPL=1|' \
    Makefile.config.model > Makefile.config
}

build() {
  cd "$srcdir/$pkgname"
  make -j1
}

package() {
  cd "$srcdir/$pkgname"
  make APRON_PREFIX="$pkgdir"/usr install
  rm "$pkgdir"/usr/bin/*test* # remove test binaries
  rm "$pkgdir"/usr/lib/*.idl # remove ocaml stuff
}
