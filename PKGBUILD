# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
pkgname=compcert-git
_basepkgname=${pkgname%-*}
_dirname=CompCert
pkgver=3.5.r25.g8df51b98
pkgrel=1
pkgdesc="The formally verified C compiler"
arch=('x86_64')
url="http://compcert.inria.fr"
license=('custom:INRIA Non-Commercial License Agreement')
depends=('gcc')
makedepends=('coq>=8.6.1' 'ocaml>=4.0.2'
             'ocaml-menhir>=20161201' 'ocaml-menhir<=20181113'
             'ocaml-findlib' # See: https://github.com/AbsInt/CompCert/issues/281
             'git')
provides=($_basepkgname=$pkgver)
conflicts=($_basepkgname)
source=("git+https://github.com/AbsInt/CompCert.git"
        "Makefile.patch"
        "Makefile-runtime.patch")
sha1sums=('SKIP'
          '12abd465a238501777573391c551deb1637a9384'
          '810e5efc65179168764221d4d7fd83b8340f61bb')

pkgver() {
  cd $srcdir/$_dirname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_dirname

  # Fix missing $DESTDIR references in Makefile
  # Until upstream fixes this, we're forced to use this patch
  patch -Np0 -i ../Makefile.patch
  patch -Np0 -i ../Makefile-runtime.patch  
}

build() {
  cd $srcdir/$_dirname

  # Some useful options:
  # -clightgen: builds and installs the clightgen tool
  # -install-coqdev: also installs the Coq development, implied by -clightgen, useful
  #   if you will use tools such as Princeton VST)
  ./configure -prefix /usr $CARCH-linux

  make all
}

package() {
  cd $srcdir/$_dirname
  make DESTDIR=$pkgdir install 
  
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
