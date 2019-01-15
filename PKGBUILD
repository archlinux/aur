# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=fbthrift
pkgver=2019.01.14.00
pkgrel=1
pkgdesc="Facebook's branch of Apache Thrift, including a new C++ server."
arch=('i686' 'x86_64')
url="https://github.com/facebook/fbthrift"
license=('Apache')
depends=('folly' 'krb5' 'numactl' 'gflags' 'google-glog' 'mstch' 'fizz' 'wangle' 'bison')
conflicts=('thrift')
provides=('thrift')
makedepends=('cmake' 'zstd' 'libunwind')
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('cc8c6c41b2c1f6e70e70fafa0dff04b7914ece0b4f6214cb0537127bfb9ec156')

prepare() {
    cd "$pkgname-$pkgver"
    cmake -H. -B_build \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
}

build() {
    cd "$pkgname-$pkgver"
    cmake --build _build
}

# check() {
#     cd "$pkgname-$pkgver"
#     cmake --build _build -- test
# }

package() {
  cd "$pkgname-$pkgver"
  cmake --build _build -- \
    PY_INSTALL_HOME="$pkgdir/usr" \
    PY_INSTALL_ARGS="--root '${pkgdir}' --prefix=/usr" \
    DESTDIR="$pkgdir" install
}
