
pkgname=mingw-w64-libsvm
pkgver=3.32
pkgrel=1
pkgdesc="A library for Support Vector Machines classification (mingw-w64)"
arch=(any)
url="http://www.csie.ntu.edu.tw/~cjlin/libsvm/"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://www.csie.ntu.edu.tw/~cjlin/libsvm/libsvm-${pkgver}.tar.gz")
sha256sums=('8644cc6518ca88bbc50d8c8ead1734f1ab9b6f17017045ef9ae38773aa653dad')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"      

build()
{
  cd "$srcdir/libsvm-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-c++ -D_FORTIFY_SOURCE=3 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4 -Wformat -Werror=format-security -fcf-protection -c ../svm.cpp
    ${_arch}-c++ -shared -o libsvm.dll svm.o -Wl,--out-implib,libsvm.dll.a -fstack-protector
    ${_arch}-ar cr libsvm.a svm.o 
    ${_arch}-ranlib libsvm.a
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libsvm-$pkgver/build-${_arch}"
    install -D -m644 ../svm.h "$pkgdir"/usr/${_arch}/include/svm.h
    install -d "$pkgdir"/usr/${_arch}/lib
    install -m644 libsvm.a  "$pkgdir"/usr/${_arch}/lib
    install -m644 libsvm.dll.a "$pkgdir"/usr/${_arch}/lib
    install -D -m755 libsvm.dll "$pkgdir"/usr/${_arch}/bin/libsvm.dll
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
