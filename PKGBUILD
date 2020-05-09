# Maintainer: Xuanrui Qi <me@xuanruiqi.com>

pkgname=compcert
_dirname=CompCert
pkgver=3.7
pkgrel=1
pkgdesc="The formally verified C compiler"
arch=('x86_64')
url="http://compcert.inria.fr"
license=('custom:INRIA Non-Commercial License Agreement')
depends=('gcc')
makedepends=('coq>=8.8.0' 'ocaml>=4.05.0'
             'ocaml-menhir>=20190626'
             'ocaml-findlib' # See: https://github.com/AbsInt/CompCert/issues/281
            )
checkdepends=('parallel')
source=("http://compcert.inria.fr/release/$pkgname-$pkgver.tgz")
sha1sums=('63f327b7ee8a76fb720b7f1a644283d43dccd53a')

prepare() {
  cd $srcdir/$_dirname-$pkgver
}

build() {
  cd $srcdir/$_dirname-$pkgver

  # Some useful options:
  # -clightgen: builds and installs the clightgen tool
  # -install-coqdev: also installs the Coq development, implied by -clightgen, useful
  #   if you will use tools such as the Princeton VST)
  #
  # Current latest Coq version is 8.11.0, not officially supported but works, so ignoring Coq version
  ./configure -ignore-coq-version -prefix /usr $CARCH-linux

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

