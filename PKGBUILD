# Maintainer: bastikr <basti.kr@gmail.com>

pkgname=blitz-cppqed-hg
pkgver=10.r1924
pkgrel=1
pkgdesc="C++ Class library for scientific computing. This version contains backward compatible patches needed for C++QED"
arch=('i686' 'x86_64')
url="http://www.sourceforge.net/projects/blitz/"
license=('custom' 'LGPL3' 'BSD')
depends=('gcc-libs' 'boost')
makedepends=('mercurial' 'gcc')
optdepends=()
provides=('blitz')
conflicts=('blitz')
source=("${pkgname}"::'hg+http://cppqed.hg.sourceforge.net:8000/hgroot/cppqed/blitz')
md5sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "10.r%s" "$(hg identify -n)"
}

build() {
  cd "${srcdir}/${pkgname}"
  autoreconf -vif
  if [ "$CARCH" = "x86_64" ]; then
    ./configure CXX=g++ --prefix=/usr --enable-shared --enable-serialization --enable-64bit|| return 1
  else
    # According to this bug report on
    # https://bugs.launchpad.net/ubuntu/+source/blitz++/+bug/1213144
    # we have to use --enable-simd-width=8
    ./configure CXX=g++ --prefix=/usr --enable-shared --enable-serialization --enable-simd-width=8|| return 1
  fi
}

package() {
  # Blitz uses /usr/bin/env python but needs python2
  mkdir "$srcdir/tempbin"
  ln -s /usr/bin/python2 "$srcdir/tempbin/python"
  export PATH="$srcdir/tempbin":$PATH

  cd "$srcdir/$pkgname"
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  make DESTDIR=$pkgdir install || return 1
  # building documentation causes trouble in some cases
  # make DESTDIR=$pkgdir install-html || return 1
  rm -rf "$srcdir/tempbin"
  rm -rf $pkgdir/usr/lib/pkgconfig
  # rmdir $pkgdir/usr/share/doc/blitz-*/doxygen
}


