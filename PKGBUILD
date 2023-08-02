pkgname=mingw-w64-libsndfile
pkgver=1.2.0
pkgrel=3
pkgdesc="A C library for reading and writing files containing sampled sound (mingw-w64)"
arch=(any)
url="https://libsndfile.github.io/libsndfile/"
license=(LGPL2.1)
makedepends=('mingw-w64-cmake' 'python')
depends=('mingw-w64-flac' 'mingw-w64-libvorbis' 'mingw-w64-lame' 'mingw-w64-opus' 'mingw-w64-speex' 'mingw-w64-sqlite' 'mingw-w64-mpg123')
options=('staticlibs' '!strip' '!buildflags')
source=(http://www.mega-nerd.com/libsndfile/files/libsndfile-${pkgver}.tar.gz)
source=(https://github.com/libsndfile/libsndfile/releases/download/$pkgver/libsndfile-$pkgver.tar.xz)
sha256sums=('0e30e7072f83dc84863e2e55f299175c7e04a5902ae79cfb99d4249ee8f6d60a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libsndfile-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DENABLE_EXTERNAL_LIBS=ON -DENABLE_MPEG=ON -DINSTALL_MANPAGES=OFF \
      -DBUILD_PROGRAMS=OFF -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF ..
    make
    popd
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake -DENABLE_EXTERNAL_LIBS=ON -DENABLE_MPEG=ON -DINSTALL_MANPAGES=OFF \
      -DBUILD_PROGRAMS=OFF -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DBUILD_SHARED_LIBS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/libsndfile-${pkgver}/build-${_arch}-static
    make DESTDIR="${pkgdir}" install
    cd ${srcdir}/libsndfile-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    rm -r $pkgdir/usr/${_arch}/share/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

