# Maintainer: Darryl Pogue <darryl at dpogue dot ca>
# Contributor: Michael Hansen <zrax0111 at gmail dot com>

pkgname=mingw-w64-libwebm
pkgver=1.0.0.28
pkgrel=1
pkgdesc="WebM video file parser"
url="https://www.webmproject.org/"
arch=(any)
license=('BSD')
depends=(mingw-w64-crt)
makedepends=(cmake mingw-w64-gcc)
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/webmproject/libwebm/archive/libwebm-${pkgver}.tar.gz"
        cmake_install.patch)
sha256sums=('4df11d93260d3cd9f17c3697b0828d38400a8f87082183368df6a1ae7a9fc635'
            '8041827dc63d45c65af9870f2a7958a4be81db8da511f440f89aded8d29d8ca8')

_architectures="i686-w64-mingw32:x86-mingw-gcc x86_64-w64-mingw32:x86_64-mingw-gcc"

prepare() {
  cd "$srcdir/libwebm-libwebm-$pkgver"
  patch -p1 -i ../cmake_install.patch
}

build() {
  cd "$srcdir/libwebm-libwebm-$pkgver"
  for _arch in ${_architectures}; do
    IFS=':' read -ra ARCH <<< "${_arch}"
    mkdir -p build-${ARCH[0]} && pushd build-${ARCH[0]}
    cmake \
      -DCMAKE_TOOLCHAIN_FILE=build/${ARCH[1]}.cmake \
      -DCMAKE_INSTALL_PREFIX=/usr/${ARCH[0]} \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
      -DBUILD_SHARED_LIBS=ON \
      -DENABLE_WEBM_PARSER=ON \
      -DENABLE_WEBMTS=OFF \
      -DENABLE_WEBMINFO=OFF \
      -DENABLE_SAMPLES=OFF \
      -DENABLE_TOOLS=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    IFS=':' read -ra ARCH <<< "${_arch}"
    cd "$srcdir/libwebm-libwebm-$pkgver/build-${ARCH[0]}"
    make DESTDIR="$pkgdir" install
    ${ARCH[0]}-strip --strip-unneeded "$pkgdir"/usr/${ARCH[0]}/bin/*.dll
    ${ARCH[0]}-strip -g "$pkgdir"/usr/${ARCH[0]}/lib/*.a
    if [[ $NO_EXECUTABLES ]]; then
      find "${pkgdir}/usr/${ARCH[0]}" -name '*.exe' -delete
    else
      find "${pkgdir}/usr/${ARCH[0]}" -name '*.exe' -exec ${ARCH[0]}-strip --strip-all {} \;
    fi
    install -Dm644 ../LICENSE.TXT $pkgdir/usr/${ARCH[0]}/share/licenses/libwebm/LICENSE
  done
}
