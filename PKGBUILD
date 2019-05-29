# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
pkgname=compcert-git
_basepkgname=${pkgname%-*}
_dirname=CompCert
pkgver=3.5.r50.ge1055531
pkgrel=1
pkgdesc="The formally verified C compiler"
arch=('x86_64')
url="http://compcert.inria.fr"
license=('custom:INRIA Non-Commercial License Agreement')
depends=('gcc')
makedepends=('coq>=8.6.1' 'ocaml>=4.0.2'
             'ocaml-menhir>=20161201' 'ocaml-menhir<=20181113'
             'ocaml-findlib' # See: https://github.com/AbsInt/CompCert/issues/281
             'git'
             'parallel')
provides=($_basepkgname=$pkgver)
conflicts=($_basepkgname)
source=("git+https://github.com/AbsInt/CompCert.git")
sha1sums=('SKIP')

pkgver() {
  cd $srcdir/$_dirname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_dirname
}

build() {
  cd $srcdir/$_dirname

  # Some useful options:
  # -clightgen: builds and installs the clightgen tool
  # -install-coqdev: also installs the Coq development, implied by -clightgen, useful
  #   if you want to use tools such as Princeton VST)
  ./configure -prefix /usr $CARCH-linux

  make all
}

check() {
  cd $srcdir/$_dirname/test

  make all
  make parallel
}

package() {
  cd $srcdir/$_dirname
  make DESTDIR=$pkgdir install 
  
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
