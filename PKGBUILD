# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=fbthrift
pkgver=2018.10.08.00
pkgrel=1
pkgdesc="Facebook's branch of Apache Thrift, including a new C++ server."
arch=('i686' 'x86_64')
url="https://github.com/facebook/fbthrift"
license=('Apache')
depends=('folly' 'krb5' 'numactl' 'gflags' 'google-glog' 'mstch' 'fizz' 'wangle')
conflicts=('thrift')
provides=('thrift')
makedepends=('cmake' 'zstd' 'libunwind')
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('b958e96a55963557263ddc66eccd477e9a0711947e4c15a186706a90890c887f')

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
