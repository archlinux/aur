# Maintainer: Maxime Arthaud <maxime@arthaud.me>
# Mainly adapted from apron-svn by Vivien Maisonneuve, thanks to him
# Category: science

pkgname='apron-ocaml-svn'
pkgver=0.9.11.r1054
pkgrel=1
pkgdesc='OCaml interface for the APRON numerical abstract domain library'
arch=('any')
url='http://apron.cri.ensmp.fr/library/'
license=('LGPL')
depends=('gmp>=5' 'mpfr>=3' 'mlgmpidl-svn' 'ppl' 'ocaml' 'ocaml-findlib' 'apron-svn')
makedepends=('svn' 'sed')
source=("$pkgname::svn://scm.gforge.inria.fr/svnroot/apron/apron/trunk")
md5sums=('SKIP')
options=('staticlibs' '!strip')

_DESTDIR=$(ocamlfind printconf destdir)
_LDCONF=$(ocamlfind printconf ldconf)


pkgver() {
  cd "$srcdir/$pkgname"
  local rel="$(sed -n 's|Version \([^ ]\+\) *$|\1|p' Changes | head -n 1)"
  local ver="$(svnversion)"
  printf "%s.r%s" "$rel" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed \
    -e 's|^OCAMLFIND *=.*$|OCAMLFIND=ocamlfind|' \
    -e 's|^APRON_PREFIX *=.*$|APRON_PREFIX=/usr|' \
    -e 's|^MLGMPIDL_PREFIX *=.*$|MLGMPIDL_PREFIX=/usr|' \
    -e 's|^CAML_PREFIX *=.*$|CAML_PREFIX=/usr|' \
    -e 's|# *HAS_PPL *=.*$|HAS_PPL = 1|' \
    Makefile.config.model > Makefile.config

  sed -i 's|#if !(defined __.*|#if 0|' apron/ap_config.h

  sed \
    -e "s|\\$(OCAMLFIND) remove|\\$(OCAMLFIND) remove -destdir $pkgdir/$_DESTDIR -ldconf $pkgdir/$_LDCONF|g" \
    -e "s|\\$(OCAMLFIND) install|\\$(OCAMLFIND) install -destdir $pkgdir/$_DESTDIR -ldconf $pkgdir/$_LDCONF|g" \
    -i Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make rebuild
  make
}

package() {
  mkdir -p $pkgdir$_DESTDIR
  touch $pkgdir$_DESTDIR/ld.conf

  cd "$srcdir/$pkgname"
  make APRON_PREFIX="$pkgdir"/usr install

  rm $pkgdir$_DESTDIR/ld.conf
}
