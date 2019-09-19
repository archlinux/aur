# Maintainer: Xuanrui Qi <me@xuanruiqi.com>

pkgname=compcert
_dirname=CompCert
pkgver=3.6
pkgrel=1
pkgdesc="The formally verified C compiler"
arch=('x86_64')
url="http://compcert.inria.fr"
license=('custom:INRIA Non-Commercial License Agreement')
depends=('gcc')
makedepends=('coq>=8.7.2' 'ocaml>=4.0.2'
             'ocaml-menhir>=20190626'
             'ocaml-findlib' # See: https://github.com/AbsInt/CompCert/issues/281
            )
checkdepends=('parallel')
source=("http://compcert.inria.fr/release/$pkgname-$pkgver.tgz")
sha1sums=('2b0da15587fc1676852d241a5cc11c66e094f483')

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
  # Current latest Coq version is 8.9.1, not officially supported but works, so ignoring Coq version
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

