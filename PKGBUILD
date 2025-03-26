pkgname='protobuf-dllexport'
_pkgname=protobuf
pkgver=30.1
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format"
arch=('x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('gcc-libs' 'glibc' 'zlib' 'abseil-cpp')
makedepends=('cmake')
replaces=('protobuf-cpp')
provides=('libprotoc.so' 'libprotobuf.so' 'libprotobuf-lite.so')
provides=("protobuf=$pkgver")
conflicts=('protobuf')
source=(https://github.com/protocolbuffers/protobuf/archive/v$pkgver/$_pkgname-$pkgver.tar.gz protobuf-fix-build-type-none.patch)
sha512sums=('bd1516718a8bfa2420a75ac94476dcc3315ee78633656d3ccdb346189320bad1584040d0c13904139dd0d11c89472dcc2b211f92efd6b298a648714fac56bb95' SKIP)

prepare() {
  cd $_pkgname-$pkgver
  patch -p 1 -i ../protobuf-fix-build-type-none.patch

  # Remove dllexport attribute on variable definition
  curl -L https://github.com/protocolbuffers/protobuf/pull/20833.patch | patch -p1
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" 
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
    -D protobuf_BUILD_SHARED_LIBS=ON
    -D protobuf_BUILD_TESTS=OFF
    -D protobuf_ABSL_PROVIDER=package
    -S "$_pkgname-$pkgver"
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
