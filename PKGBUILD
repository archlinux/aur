# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=freemat
pkgver=4.2
pkgrel=9
pkgdesc="A free environment for rapid engineering, scientific prototyping and data processing"
arch=('x86_64')
url="http://freemat.sourceforge.net"
license=('GPL')
depends=('arpack' 'fftw' 'glu' 'portaudio' 'qt4' 'libffi')
makedepends=('cmake' 'python2' 'suitesparse' 'doxygen' 'gcc-fortran')
install=freemat.install
source=(https://downloads.sourceforge.net/project/freemat/FreeMat4/FreeMat-$pkgver-Source.tar.gz
	build-fix.patch
	remove-qwebkit.patch)
md5sums=('ace147e49273ae935d363da8e2a56d4d'
         '042f43dcae863e3fc4c9a10b46761344'
         '5e37816fafe46a79cc157549f5bec554')

prepare() {
  cd "$srcdir"/FreeMat-$pkgver-Source
  patch -p1 <"$srcdir"/build-fix.patch
  patch -p1 <"$srcdir"/remove-qwebkit.patch
}

build() {
  cd "$srcdir"/FreeMat-$pkgver-Source
  unset LDFLAGS CFLAGS CXXFLAGS CPPFLAGS
  rm -f CMakeCache.txt
  find . -type f -name '*.moc.cpp' -exec rm -f {} \;
  find . -type f -name 'add.so' -exec rm -f {} \;
  echo >libs/libMatC/CJitFuncClang.hpp
  echo >libs/libMatC/CJitFuncClang.cpp

  cmake \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DUSE_LLVM=OFF \
	-DFORCE_BUNDLED_UMFPACK=ON \
	-DFFI_INCLUDE_DIR=/usr/lib/libffi-`pacman -Q libffi | cut -f2 -d\ |cut -f1 -d-`/include/ \
	-DPYTHON_EXECUTABLE=/usr/bin/python2 \
	.
  make
}
package() {
  cd "$srcdir"/FreeMat-$pkgver-Source

  make DESTDIR="$pkgdir" install -j1
  sed -i "s|/FreeMat-.*/|/FreeMat-$pkgver/|g" $startdir/freemat.install
  rm "$pkgdir"/usr/bin/blas.ini
}
