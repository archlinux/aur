# Maintainer: julienCXX <archlinux@chmodplusx.eu>

# Contributor: Moritz Maxeiner <moritz@ucworks.org>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=mingw-w64-libsearpc
_basever=3.0
_remotever=$_basever-latest
pkgver=$_basever.latest
pkgrel=4
pkgdesc="A simple and easy-to-use C language RPC framework (including both
server side & client side) based on GObject System (mingw-w64)."
arch=('any')
url="https://github.com/haiwen/libsearpc/"
license=('GPL3')
makedepends=('mingw-w64-configure' 'libtool>1.4' 'python2>=2.4')
depends=('mingw-w64-crt' 'mingw-w64-glib2>=2.26.0' 'mingw-w64-jansson>=2.2.1')
options=('!strip' '!buildflags' 'staticlibs')
source=("libsearpc-${pkgver}.tar.gz::https://github.com/haiwen/libsearpc/archive/v${_remotever}.tar.gz"
	"libsearpc.pc.patch")
sha256sums=('56313771e0ad7dc075c4590b6a75daeb3939937b21716d82c91be2612133b8cd'
            'aec39a303aaebc0777a22d8c53367f52f619654d63f62b362d75c1c599e632f4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/libsearpc-$_remotever"
  patch -p1 -i $srcdir/libsearpc.pc.patch
}

build() {
  cd "$srcdir/libsearpc-$_remotever"
  ./autogen.sh
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --enable-compile-demo=no PYTHON=python2
    make
    popd 
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libsearpc-${_remotever}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
