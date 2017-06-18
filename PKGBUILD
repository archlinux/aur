# Maintainer: Simon Schäfer <simon.schaefer@koeln.de>
# Based on PKGBUILD by Daichi Shinozaki <dsdseg@gmail.com> but this build uses boringssl and builds all plugins

pkgname=grpc-git-boringssl
_pkgname=${pkgname/-git-boringssl/}
pkgver=v1.3.5.r1011.g59c232c904
pkgrel=1
pkgdesc="gRPC - An RPC library and framework, using BoringSSL"
arch=('i686' 'x86_64')
url='http://www.grpc.io/'
license=('BSD')
conflicts=('grpc', 'grpc-git')
depends=('c-ares' 'protobuf>=3')
makedepends=('gflags' 'go' 'zlib' 'perl')  # BoringSSL require Go and Perl to build
options=(!makeflags)
# source=('git+https://github.com/grpc/grpc.git')
source=('git+https://github.com/grpc/grpc.git#branch=v1.4.x')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  git submodule init -- third_party/boringssl
  git submodule init -- third_party/benchmark
  git submodule update

  mkdir -p build
}

build() {
  cd "$_pkgname/build"

  cmake .. \
    -DgRPC_BUILD_TESTS:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DCMAKE_INSTALL_LIBDIR="$pkgdir/usr/lib" \
    -DBORINGSSL_ROOT_DIR="$srcdir/$_pkgname"/third_party/boringssl/ \
    -DgRPC_ZLIB_PROVIDER=package \
    -DgRPC_GFLAGS_PROVIDER=packet \
    -DgRPC_PROTOBUF_PROVIDER=package \
    -DgRPC_CARES_PROVIDER=packet \
    -D_gRPC_PROTOBUF_PROTOC_LIBRARIES=protoc \
    -D_gRPC_PROTOBUF_PROTOC=/usr/bin/protoc \
    -DCMAKE_C_FLAGS="-Wno-error=stringop-overflow -lprotobuf -lprotoc" \
    -DCMAKE_CXX_FLAGS="-lprotobuf -lprotoc -lcares" # hack with the libprotobuf and libprotoc since the cmakelist does not find it correctly, and cares since this is not added by the packet searcher

   make -j$(nproc)
}

package() {
  cd "$_pkgname/build"

  make install


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
