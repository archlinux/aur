# Maintainer: Xuanrui Qi <me@xuanruiqi.com>

pkgname=compcert
_dirname=CompCert
pkgver=3.5
pkgrel=3
pkgdesc="The formally verified C compiler"
arch=('x86_64')
url="http://compcert.inria.fr"
license=('custom:INRIA Non-Commercial License Agreement')
depends=('gcc')
makedepends=('coq>=8.6.1' 'ocaml>=4.0.2'
             'ocaml-menhir>=20161201' 'ocaml-menhir<=20181113'
             'ocaml-findlib' # See: https://github.com/AbsInt/CompCert/issues/281
             'parallel')
source=("http://compcert.inria.fr/release/$pkgname-$pkgver.tgz"
        "Makefile.patch"
        "Makefile-runtime.patch")
sha1sums=('375705b2a02062d3af0906cb53d9a08a25382097'
          '12abd465a238501777573391c551deb1637a9384'
          '810e5efc65179168764221d4d7fd83b8340f61bb')

prepare() {
  cd $srcdir/$_dirname-$pkgver

  # Fix missing $DESTDIR references in Makefile
  # Until upstream fixes this, we're forced to use this patch
  patch -Np0 -i ../Makefile.patch
  patch -Np0 -i ../Makefile-runtime.patch
}

build() {
  cd $srcdir/$_dirname-$pkgver

  # Some useful options:
  # -clightgen: builds and installs the clightgen tool
  # -install-coqdev: also installs the Coq development, implied by -clightgen, useful
  #   if you will use tools such as the Princeton VST)
  ./configure -prefix /usr $CARCH-linux

  make all
}

check() {
  cd $srcdir/$_dirname-$pkgver/test

  make all
  make parallel
}

package() {
  cd $srcdir/$_dirname-$pkgver
  make DESTDIR=$pkgdir install
  
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

