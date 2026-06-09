# Maintainer: insmtr <insmtr@insmtr.cn>
pkgname=p4lang-pi
pkgver=0.1.1
pkgrel=1
pkgdesc="An implementation framework for a P4Runtime server"
arch=('x86_64')
url="https://github.com/p4lang/PI"
license=('Apache-2.0')
depends=(
    'grpc'
    'protobuf'
    'python-grpcio'
    'python-protobuf'
    'boost-libs'
    'readline'
)
makedepends=(
    'boost'
    'git'
)
source=("git+https://github.com/p4lang/PI.git#tag=v${pkgver}")
sha256sums=('58cbfbc4f76f5a6440572bd0bd496a6d4d43fa424403f7997af1737167fa6fa8')
options=(!debug)

prepare() {
    cd PI
    git submodule update --init
    sed -i 's/this->allocate(new_capacity, FMT_NULL)/std::allocator_traits<Allocator>::allocate(*this, new_capacity)/' proto/third_party/fmt/format.h
}

build() {
    cd PI
    sed -i 's/with_proto_demo=yes/with_proto_demo=no/' proto/configure.ac
    ./autogen.sh
    ./configure --prefix=/usr --with-proto
    make -j$(nproc)
}

package() {
    cd PI
    make DESTDIR="$pkgdir" install
}
