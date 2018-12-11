# Maintainer: Maxime Arthaud <maxime@arthaud.me>
# Author: Vivien Maisonneuve
# Category: science

pkgname='apron'
pkgver=0.9.10
pkgrel=2
pkgdesc='APRON numerical abstract domain library'
arch=('i686' 'x86_64')
url='http://apron.cri.ensmp.fr/library/'
license=('LGPL2')
provides=('apron')
depends=('gmp>=5' 'mpfr>=3' 'ppl')
makedepends=('sed')
source=("http://apron.cri.ensmp.fr/library/apron-$pkgver.tgz"
        '0001-Remove-strdup-implementation.patch'
        '0002-Fix-invalid-operands-to-binary-expression.patch')
sha256sums=('b108de2f4a8c4ecac1ff76a6d282946fd3bf1466a126cf5344723955f305ec8e'
            'fe8d85b1f2db6dad149209324b32a8e81deab6868147e71bcfe4c8df57303fc9'
            'f624c2152ac6c621f92d1cbb58a891701e938d44dc0fde6a1b80b4a7d3c8ba43')

prepare() {
  cd "$srcdir/apron-$pkgver"
  sed \
    -e 's|^APRON_PREFIX *=.*$|APRON_PREFIX=/usr|' \
    -e 's|^HAS_OCAML *=.*$|HAS_OCAML=|' \
    -e 's|^HAS_OCAMLOPT *=.*$|HAS_OCAMLOPT=|' \
    -e 's|^OCAMLFIND *=.*$|OCAMLFIND=|' \
    -e 's|^# HAS_PPL *=.*$|HAS_PPL=1|' \
    Makefile.config.model > Makefile.config
  patch -p0 < ../0001-Remove-strdup-implementation.patch
  patch -p0 < ../0002-Fix-invalid-operands-to-binary-expression.patch
}

build() {
  cd "$srcdir/apron-$pkgver"
  make -j1
}

package() {
  cd "$srcdir/apron-$pkgver"
  make APRON_PREFIX="$pkgdir"/usr install

  # fix include/ permissions
  find "$pkgdir"/usr/include -type d -exec chmod 755 '{}' ';'
  find "$pkgdir"/usr/include -type f -exec chmod 644 '{}' ';'

  # remove test binaries
  rm "$pkgdir"/usr/bin/*test*

  # remove ocaml stuff
  rm "$pkgdir"/usr/lib/*.ml
  rm "$pkgdir"/usr/lib/*.mli
  rm "$pkgdir"/usr/lib/*.idl
}
