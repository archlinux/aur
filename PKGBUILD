pkgname=mingw-w64-libxml2
pkgver=2.12.2
pkgrel=1
arch=('any')
pkgdesc="XML parsing library, version 2 (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-libiconv' 'mingw-w64-zlib' 'mingw-w64-xz')
makedepends=('mingw-w64-configure')
options=('!buildflags' '!strip' 'staticlibs')
license=('LGPL')
url="http://www.xmlsoft.org/"
source=("https://download.gnome.org/sources/libxml2/${pkgver::4}/libxml2-${pkgver}.tar.xz")
sha256sums=('3f2e6464fa15073eb8f3d18602d54fafc489b7715171064615a40490c6be9f4f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/libxml2-${pkgver}"

  # disable doc & examples
  sed -i "s| doc example | |g" Makefile.am
  autoreconf -vfi
}

build()
{
  cd "${srcdir}/libxml2-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --without-python
    make

    # deps symbols are not included in static lib:
    ${_arch}-ar x /usr/${_arch}/lib/libiconv.a
    ${_arch}-ar x /usr/${_arch}/lib/liblzma.a
    ${_arch}-ar x /usr/${_arch}/lib/libz.a
    ${_arch}-ar x /usr/${_arch}/lib/libws2_32.a
    ${_arch}-ar cru .libs/libxml2.a *.o 
    ${_arch}-ranlib .libs/libxml2.a

    popd
  done
}

package()
{
  for _arch in ${_architectures}; do
    cd "${srcdir}/libxml2-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    rm -r "${pkgdir}"/usr/${_arch}/share
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-debug "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

