pkgname=mingw-w64-libsquish
pkgver=1.14
pkgrel=2
pkgdesc="DXT compression library (mingw-w64)"
arch=(any)
url="http://sourceforge.net/projects/libsquish"
license=("MIT")
makedepends=(mingw-w64-cmake mingw-w64-libpng)
depends=(mingw-w64-crt)
options=(!libtool !strip !buildflags staticlibs)
optdepends=(mingw-w64-libpng)
source=("http://downloads.sourceforge.net/libsquish/libsquish-$pkgver.tgz"
"gcc440.patch"
"0001-fix-install.patch")
sha1sums=('6a395d8ffa01b201794499dd1affc8c67f92cad3'
          '51bcc11eafbf79d9cde24769397c7a42f886154a'
          'f533643fb9c15d89a9e8f89eb5b722099b9d7aa1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  patch -Np0 -i ${srcdir}/gcc440.patch
  patch -p1 -i ${srcdir}/0001-fix-install.patch
}

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}-static" && pushd "build-${_arch}-static"
    ${_arch}-cmake \
			-DCMAKE_BUILD_TYPE=Release \
			-DBUILD_SHARED_LIBS=OFF \
			..
    make
    popd
    mkdir "build-${_arch}-shared" && pushd "build-${_arch}-shared"
    ${_arch}-cmake \
			-DCMAKE_BUILD_TYPE=Release \
			-DBUILD_SQUISH_EXTRA=ON \
			..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
		cd "${srcdir}/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/build-${_arch}-shared"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
