# Maintainer: Azat Khuzhin <a3at.mail@gmail.coM>
# Based on PKGBUILD by
# - Daichi Shinozaki <dsdseg@gmail.com>     (grpc-git)
# - Simon Schäfer <simon.schaefer@koeln.de> (grpc-git-boringssl)
#
# This package differs from grpc-git, since it uses cmake to overcome
# "Argument list too long" issue:
#   https://github.com/grpc/grpc/issues/14844

pkgname=grpc-git-cmake
_pkgname=${pkgname/-git-cmake/}
pkgver=v1.12.1.r5278.g8c3d4a7dfd
pkgrel=1
pkgdesc="gRPC - An RPC library and framework (uses cmake for building)"
arch=('i686' 'x86_64')
url='http://www.grpc.io/'
license=('BSD')
conflicts=('grpc'  'grpc-git' 'grpc-git-boringssl')
depends=('c-ares' 'protobuf>=3')
makedepends=('gflags' 'zlib' 'cmake' 'ninja')
options=(!makeflags)
source=('git+https://github.com/grpc/grpc.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  mkdir -p build
}

build() {
  cd "$_pkgname/build"

  local opts=(
    -DgRPC_BUILD_TESTS=OFF
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    -DCMAKE_INSTALL_LIBDIR="$pkgdir/usr/lib"
    -DgRPC_SSL_PROVIDER=package
    -DgRPC_ZLIB_PROVIDER=package
    -DgRPC_GFLAGS_PROVIDER=package
    -DgRPC_PROTOBUF_PROVIDER=package
    -DgRPC_BENCHMARK_PROVIDER=package
    -DgRPC_CARES_PROVIDER=packet
    -D_gRPC_PROTOBUF_PROTOC_LIBRARIES=protoc
    -D_gRPC_PROTOBUF_PROTOC=/usr/bin/protoc
    # hack with the libprotobuf and libprotoc since the cmakelist does not find
    # it correctly, and cares since this is not added by the packet
    # searcher
    -DCMAKE_C_FLAGS="-Wno-error=stringop-overflow -lprotobuf -lprotoc -lcares"
    -DCMAKE_CXX_FLAGS="-lprotobuf -lprotoc -lcares"
  )

  cmake -G Ninja .. "${opts[@]}"
  ninja
}

package() {
  cd "$_pkgname/build"

  ninja install

  # install pkg-config files
  cd ..
  make pc_c prefix=/usr
  make pc_c_unsecure prefix=/usr
  make pc_cxx prefix=/usr
  make pc_cxx_unsecure prefix=/usr
  cd -

  mkdir -p "$pkgdir"/usr/lib/pkgconfig
  install -Dm644 ../libs/opt/pkgconfig/grpc.pc "$pkgdir"/usr/lib/pkgconfig
  install -Dm644 ../libs/opt/pkgconfig/grpc_unsecure.pc "$pkgdir"/usr/lib/pkgconfig
  install -Dm644 ../libs/opt/pkgconfig/grpc++.pc "$pkgdir"/usr/lib/pkgconfig
  install -Dm644 ../libs/opt/pkgconfig/grpc++_unsecure.pc "$pkgdir"/usr/lib/pkgconfig

  # install license
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE

  # cleanup protobuf stuff since this comes from the arch package
  rm -rf "$pkgdir/usr/bin/protoc"
  rm -rf "$pkgdir/usr/include/google"
}
