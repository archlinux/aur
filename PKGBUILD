# Contributor: naelstrof <naelstrof@gmail.com>

pkgname=mingw-w64-flac
pkgver=1.3.2
pkgrel=1
pkgdesc="Free Lossless Audio Codec (mingw-w64)"
arch=('any')
url="http://flac.sourceforge.net/"
license=('BSD' 'GPL')
depends=('mingw-w64-libogg' 'mingw-w64-crt')
makedepends=('nasm' 'mingw-w64-configure')
options=(!strip !buildflags staticlibs)
source=("http://downloads.xiph.org/releases/flac/flac-${pkgver}.tar.xz")
md5sums=('454f1bfa3f93cc708098d7890d0499bd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_pkgname="flac"

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    touch config.rpath
    ${_arch}-configure --disable-xmms-plugin --disable-sse --disable-asm-optimizations --with-pic
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/$_pkgname-$pkgver/build-${_arch}
    make DESTDIR="$pkgdir/" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r $pkgdir/usr/${_arch}/share/doc/
    rm -r $pkgdir/usr/${_arch}/share/man/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
