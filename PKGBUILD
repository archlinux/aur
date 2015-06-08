
pkgname=mingw-w64-f2c
pkgver=1.0
pkgrel=1
pkgdesc='Fortran to C code translator (mingw-w64)'
url='http://www.netlib.org/f2c/index.html'
license=('custom')
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://www.netlib.org/f2c/libf2c.zip" libf2c-1.patch)
noextract=("libf2c.zip")
sha256sums=('5dff29c58b428fa00cd36b1220e2d71b9882a658fdec1aa094fb7e6e482d6765'
            '87094ca646b67339bcb8faef5d400249e4abf744086398788d15c17f306eda36')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"

  # zipbomb
  rm -rf libf2c 
  mkdir -p libf2c && pushd libf2c
  unzip "${srcdir}"/libf2c.zip

  # mxe patch
  patch -p1 -i "${srcdir}"/libf2c-1.patch
}

build() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    cp -r libf2c build-${_arch} && pushd build-${_arch}   
    make -f makefile.u CC=${_arch}-gcc AR=${_arch}-ar LD=${_arch}-ld RANLIB=${_arch}-ranlib CFLAGS='-O -DUSE_CLOCK'
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/build-${_arch}"
    install -Dm644 f2c.h "${pkgdir}"/usr/${_arch}/include/f2c.h
    install -Dm644 libf2c.a "${pkgdir}"/usr/${_arch}/lib/libf2c.a
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
} 

