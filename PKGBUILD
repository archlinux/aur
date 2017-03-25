# $Id$
# Maintainer: L <alaviss0 plus aur at gmail dot com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=openmp-svn
_pkgname=${pkgname%-svn}
pkgver=5.0.r298769
pkgrel=1
pkgdesc="LLVM OpenMP Runtime Library"
arch=('i686' 'x86_64')
url="http://openmp.llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('glibc')
makedepends=('cmake')
provides=('openmp')
conflicts=('openmp')
source=("${_pkgname}::svn+https://llvm.org/svn/llvm-project/${_pkgname}/trunk")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname/runtime"

  # Borrowed from llvm-svn
  echo $(awk -F 'MAJOR |MINOR |)' \
            'BEGIN { ORS="." ; i=0 } \
             /set\(LIBOMP_VERSION_/ { print $2 ; i++ ; if (i==1) ORS="" } \
             END { print "\n" }' \
        CMakeLists.txt).r$(svnversion | tr -d [A-z])
}

prepare() {
  cd "$_pkgname"
  mkdir build
}

build() {
  cd "$_pkgname/build"

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

#check() {
#  # Requires llvm-lit
#  cd "$_pkgname/build"
#
#  make check-libomp
#}

package() {
  cd "$_pkgname"

  make -C build DESTDIR="$pkgdir" install

  # libgomp.so is also provided by gcc-libs; remove it to fix the conflict
  rm "$pkgdir/usr/lib/libgomp.so"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
