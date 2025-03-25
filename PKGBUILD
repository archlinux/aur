pkgname=('protobuf-29')
pkgver=29.3
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format"
arch=('x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD-3-Clause')
depends=(
  'gcc-libs'
  'glibc'
  'zlib'
  'abseil-cpp'
)
makedepends=('cmake')
provides=("protobuf=${pkgver}")
conflicts=('protobuf')
source=(https://github.com/protocolbuffers/protobuf/archive/v$pkgver/protobuf-$pkgver.tar.gz
        protobuf-fix-build-type-none.patch) # https://github.com/protocolbuffers/protobuf/issues/11935
sha512sums=('0c776133f5789d21baa8860cb41e7926a162d74810a01722b762a78f93e559494e903fcaa092515bfe2ce057fd065a5dd000b316edb1af32c2ef9dbadf02b4c6'
            '18bc71031bbcbc3810a9985fa670465040f06a6c104ab8079b56bdfc499bb6cec40805a0cefd455031142490a576dc60aa8000523877ac0353b93558e9beabbd')
options=(!lto)

prepare() {
  patch -d protobuf-$pkgver -p1 < protobuf-fix-build-type-none.patch # Fix cmake config compatibility mode
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
    -S "protobuf-$pkgver"
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
