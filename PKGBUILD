

pkgname=mingw-w64-resource
pkgver=0
pkgrel=1
pkgdesc='support for getrusage (mingw-w64)'
url='http://sourceforge.net/p/mingw-w64/code/HEAD/tree/experimental/getrusage'
arch=('any')
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'subversion')
options=('staticlibs' '!buildflags' '!strip')
source=("sys::svn+svn://svn.code.sf.net/p/mingw-w64/code/experimental/getrusage")
md5sums=('SKIP' )

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-gcc -I.. -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4 -c ../sys/getrusage.c -o getrusage.o
    ${_arch}-gcc -shared -o libgetrusage.dll getrusage.o -Wl,--out-implib,libgetrusage.dll.a
    ${_arch}-ar cru libgetrusage.a getrusage.o
    ${_arch}-ranlib libgetrusage.a
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/build-${_arch}
    install -D -m 644 "${srcdir}"/sys/resource.h "$pkgdir"/usr/${_arch}/include/sys/resource.h
    install -D -m 644 libgetrusage.a "$pkgdir"/usr/${_arch}/lib/libgetrusage.a
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

