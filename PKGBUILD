# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=libsbml
pkgver=5.20.5
pkgrel=1
pkgdesc="XML-based description language for computational models in systems biology"
url="https://github.com/sbmlteam/libsbml"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libxml2')
optdepends=('bzip2' 'python' 'perl' 'ruby' 'java-runtime') # 'octave' 'mono'
makedepends=('cmake' 'swig' 'python' 'perl' 'ruby' 'java-environment') # 'octave', 'mono'
options=('!libtool')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
  fix-gcc15.patch::https://github.com/tim-gromeyer/html2md/commit/b77a8a8516dc4112a9c7f16bc7af04fcca7bda65.patch)
sha256sums=('21c88c753a4a031f157a033de3810488b86f003e684c6ca7aa3d6e26e7e0acfc'
            'aa23cb077e1bd98ba87a9dfc89fd3b837d8819ba466ed93e8ba306de5f31b3a4')

prepare() {
  cd $pkgname-$pkgver/src/sbml/html2md
  patch -p2 < "$srcdir"/fix-gcc15.patch
}

build() {
  cd $pkgname-$pkgver
  ./autogen.sh

  mkdir -p "$srcdir"/build-$pkgver && cd "$srcdir"/build-$pkgver
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR:PATH=lib \
    -DWITH_LIBXML=ON \
    -DWITH_EXPAT=OFF \
    -DWITH_BZIP2=ON \
    -DWITH_ZLIB=ON \
    -DWITH_PYTHON=ON \
    -DENABLE_LAYOUT=ON \
    -DENABLE_RENDER=ON \
    -DENABLE_QUAL=ON \
    -DENABLE_MULTI=ON \
    -DENABLE_COMP=ON \
    -DENABLE_FBC=ON \
    -DENABLE_GROUPS=ON

  make
}

package() {
  cd build-$pkgver
  DESTDIR="$pkgdir" cmake -DCMAKE_INSTALL_PREFIX=/usr -P cmake_install.cmake

  rm "$pkgdir"/usr/share/cmake/Modules/Find{ZLIB,LIBXML,BZ2}.cmake
}
