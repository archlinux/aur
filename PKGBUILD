# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=libsbml
pkgver=5.21.2
pkgrel=1
pkgdesc="XML-based description language for computational models in systems biology"
url="https://github.com/sbmlteam/libsbml"
license=('LGPL-2.1-or-later' 'Zlib')
arch=('i686' 'x86_64')
depends=('bzip2' 'libgcc' 'libstdc++' 'libxml2' 'zlib')
optdepends=('python: Python bindings') # 'perl' 'ruby' 'java-runtime' 'octave' 'mono'
makedepends=('cmake' 'swig' 'python') # 'perl' 'ruby' 'java-environment' 'octave' 'mono'
options=('!libtool')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('7649262405660a16161db8324ae817e3509fca072c6a06a80d6487d30f97d3be')

build() {
  cmake -S "$pkgname-$pkgver" -B "build-$pkgver" \
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

  cmake --build "build-$pkgver"
}

package() {
  DESTDIR="$pkgdir" cmake --install "build-$pkgver"

  rm "$pkgdir"/usr/share/cmake/Modules/Find{ZLIB,LIBXML,BZ2}.cmake
  install -Dm644 "$pkgname-$pkgver/src/sbml/compress/00README.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/minizip.LICENSE"
}
