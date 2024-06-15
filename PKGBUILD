# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Luca Bennati <lucak3 AT gmail DOT com>
# Contributor: Glaucous <glakke1 at gmail dot com>

pkgname=lib32-apitrace
_name="${pkgname//lib32-/}"
pkgver=11.1
pkgrel=2
pkgdesc="Graphics API Tracing (32-bit)"
arch=('x86_64')
url="https://github.com/apitrace/apitrace"
license=(MIT)
depends=(
  $_name=$pkgver
  lib32-brotli
  lib32-gcc-libs
  lib32-glibc
  lib32-libpng
  lib32-libprocps
  lib32-libx11
  lib32-zlib
  python
  python-numpy
  python-pillow
)
makedepends=(
  cmake
  git
)
source=(
  $_name::git+$url.git#tag=$pkgver
  git+https://github.com/apitrace/gltrim-tests.git
  git+https://github.com/google/brotli.git
  git+https://github.com/google/googletest.git
  git+https://github.com/ianlancetaylor/libbacktrace.git
  git+https://github.com/apitrace/libpng.git
  git+https://github.com/google/snappy.git
  git+https://github.com/madler/zlib.git
  git+https://github.com/microsoft/DirectXMath.git
)
sha256sums=('2f641d885a7d69a6118a4348c4af85232194200c3ac1e6d7df140e283c2f2496'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $_name

  git submodule init
  git config submodule.frametrim/tests.url "$srcdir/gltrim-tests"
  git config submodule.thirdparty/brotli.url "$srcdir/brotli"
  git config submodule.thirdparty/gtest.url "$srcdir/googletest"
  git config submodule.thirdparty/libbacktrace.url "$srcdir/libbacktrace"
  git config submodule.thirdparty/libpng.url "$srcdir/libpng"
  git config submodule.thirdparty/snappy.url "$srcdir/snappy"
  git config submodule.thirdparty/zlib.url "$srcdir/zlib"
  git config submodule.thirdparty/directxmath.url "$srcdir/DirectXMath"
  git -c protocol.file.allow=always submodule update
}


build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D ENABLE_GUI=NO
    -D LIB_SUFFIX=32
    -S $_name
    -W no-dev
  )

  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
  cd $_name
}

package() {
  local binary

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $_name/LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"

  for binary in "$pkgdir/usr/bin/"*; do
    mv -v "$binary" "$binary-32"
  done
  mv -v "$pkgdir/usr/share/doc/$_name" "$pkgdir/usr/share/doc/$pkgname"
}

