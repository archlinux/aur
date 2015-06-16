# Maintainer: Arch User <alaviss0@gmail.com>
pkgname=openmprtl-svn
pkgver=r239801
pkgrel=1
pkgdesc="Intel(R) OpenMP* Runtime Library"
arch=("x86_64" "i686")
url="http://openmp.llvm.org/"
license=("MIT" "custom:UIUC")
depends=('glibc')
makedepends=('gcc>=4.6.2' 'subversion')
provides=('openmprtl')
conflicts=('openmprtl')
source=("openmp::svn+http://llvm.org/svn/llvm-project/openmp/trunk")
md5sums=("SKIP")

_svndir=openmp

pkgver() {
  cd "$srcdir/$_svndir/"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$_svndir/runtime"
  cmake -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ \
    -DLIBOMP_CPPFLAGS="$CPPFLAGS" -DLIBOMP_CFLAGS="$CFLAGS" \
    -DLIBOMP_LDFLAGS="$LDFLAGS" -DCMAKE_INSTALL_PREFIX=/usr

  make all
}

package() {
  cd "$srcdir/$_svndir/runtime"
  make install DESTDIR="$pkgdir"

  # remove conflicting symlink
  rm "$pkgdir"/usr/lib/libgomp.so
}
