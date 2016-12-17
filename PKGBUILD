pkgname=mingw-w64-stormlib
pkgver=9.21
pkgrel=1
arch=(any)
pkgdesc="A C/C++ API to read and write MPQ files with support for merged archives, patch MPQs and more. (mingw-w64)"
license=("MIT")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake setconf)
options=(staticlibs !strip !buildflags)
url="http://www.zezula.net/en/mpq/stormlib.html"
source=("https://github.com/ladislav-zezula/StormLib/archive/v$pkgver.tar.gz")
sha256sums=('e23e9f106c6367f161fc63e015e7da6156b261b14c7e4a5aa542df02009294f9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	for _arch in ${_architectures}; do
    unset LDFLAGS
    cd $srcdir
    
    mkdir "build-${_arch}-shared" && pushd "build-${_arch}-shared"
    cp -r ../StormLib-$pkgver/* .
    setconf makefile.w32 CC ${_arch}-gcc
    setconf makefile.w32 CPP ${_arch}-g++
    setconf makefile.w32 CFLAGS "-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
    setconf makefile.w32 AR ${_arch}-ar
    make -f makefile.w32
    ${_arch}-dlltool --dllname StormLib.dll --def stormlib_dll/StormLib.def --output-lib libStormLib.dll.a
    popd
    
    cd StormLib-$pkgver
    mkdir "build-${_arch}-static" && pushd "build-${_arch}-static"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DWITH_STATIC=ON \
      -DBUILD_SHARED_LIBS=OFF \
      ..
    make
    popd
  done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/build-${_arch}-shared"
		install -Dm644 StormLib.dll "$pkgdir/usr/${_arch}/bin/StormLib.dll"
		install -Dm644 libStormLib.dll.a "$pkgdir/usr/${_arch}/lib/libStormLib.dll.a"
    cd "${srcdir}/StormLib-$pkgver/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    ln -s /usr/${_arch}/lib/libstorm.a "$pkgdir/usr/${_arch}/lib/libStormLib.a"
  done
}
