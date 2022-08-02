# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-opencore-amr
pkgver=0.1.6
pkgrel=1
pkgdesc="Open source implementation of the Adaptive Multi Rate (AMR) speech codec (mingw-w64)"
arch=('any')
license=('APACHE')
url="https://opencore-amr.sourceforge.net/"
source=(https://downloads.sourceforge.net/sourceforge/opencore-amr/opencore-amr-$pkgver.tar.gz)
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
makedepends=('mingw-w64-gcc')
sha512sums=('8955169954b09d2d5e2190888602c75771b72455290db131ab7f40b587df32ea6a60f205126b09193b90064d0fd82b7d678032e2b4c684189788e175b83d0aa7')
b2sums=('5f2f618b6d80d667fd99f1df8793cf0260d582e2fc8021f4af35d60b2b1db7be7c897d4b78589da5a442e684161cecef005ec4247cef7a9c3df797c68db97d52')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}
    unset LDFLAGS CPPFLAGS
    $srcdir/opencore-amr-$pkgver/configure --prefix=/usr/${_arch} --host=${_arch} --enable-static

    # prevent excessive overlinking due to libtool
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}
    make DESTDIR="$pkgdir" install

    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

