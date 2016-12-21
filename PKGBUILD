# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=mingw-w64-libconfig
pkgver=1.5
pkgrel=1
pkgdesc="C/C++ Configuration File Library (mingw-w64)"
arch=(any)
url="http://hyperrealm.com/libconfig/libconfig.html"
license=('LGPL')
depends=('automake-1.14' 'mingw-w64-crt' 'gcc-libs' 'texinfo')
makedepends=('mingw-w64-configure' 'mingw-w64-gcc')
options=('staticlibs' '!strip' '!buildflags')
source=("http://pkgs.fedoraproject.org/repo/pkgs/libconfig/libconfig-1.5.tar.gz/a939c4990d74e6fc1ee62be05716f633/libconfig-1.5.tar.gz")
md5sums=('a939c4990d74e6fc1ee62be05716f633')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/libconfig-$pkgver"
  touch "lib/scanner.l"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    cp "../lib/libconfig.h" "lib/"
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
  	cd "$srcdir/libconfig-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir/usr/${_arch}/share/info/dir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
