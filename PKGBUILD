# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-schroedinger
pkgver=1.0.11
pkgrel=3
pkgdesc="An implemenation of the Dirac video codec in ANSI C code (mingw-w64)"
arch=('any')
url="http://www.diracvideo.org/"
license=('GPL2' 'LGPL2.1' 'MPL' 'MIT')
depends=('mingw-w64-crt' 'mingw-w64-orc')
options=(!strip !buildflags !libtool staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config')
source=(http://www.diracvideo.org/download/schroedinger/schroedinger-$pkgver.tar.gz
        'testsuite.patch')
md5sums=('da6af08e564ca1157348fb8d92efc891'
         '0d6d1f8e78befde9bd04d7e93aed0b67')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/schroedinger-$pkgver
  patch -Np1 < ../testsuite.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    unset LDFLAGS CPPFLAGS
    $srcdir/schroedinger-$pkgver/configure --prefix=/usr/${_arch} --host=${_arch}

    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}

    make DESTDIR="$pkgdir" install
    install -m644 -D ${srcdir}/schroedinger-$pkgver/COPYING.MIT "$pkgdir/usr/${_arch}/share/licenses/schroedinger/COPYING.MIT"
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    rm -r ${pkgdir}/usr/${_arch}/share/gtk-doc
  done
}
