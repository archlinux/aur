# Maintainer: insmtr <insmtr@insmtr.cn>
pkgname=p4lang-pi
pkgver=0.1.2
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
sha256sums=('c1b8938022d662d4311852cfce8bc79bd9e02b8cd42533374c339c435b36967b')
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
