# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# NOTE: this is copy version of abseil-cpp AUR package but with some changes on pkgver and 
# compilcation step for google-cloud-cpp package.
# source: https://aur.archlinux.org/packages/abseil-cpp

pkgname=google-cloud-cpp-abseil-cpp
pkgver=20200923.3
pkgrel=1
pkgdesc="Abseil Common Libraries (C++)"
arch=('any')
url="https://github.com/abseil/abseil-cpp"
license=('Apache')
makedepends=('cmake' 'git')
conflicts=('abseil-cpp')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('ebe2ad1480d27383e4bf4211e2ca2ef312d5e6a09eba869fd2e8a5c5d553ded2')

prepare() {
	mv "abseil-cpp-$pkgver" "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    cmake -H. -Bbuild \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DABSL_RUN_TESTS=OFF \
        -DBUILD_TESTING=OFF \
        -DABSL_USE_GOOGLETEST_HEAD=OFF \
        -DCMAKE_CXX_STANDARD=17
}

build() {
    cd "$pkgname-$pkgver"
    cmake --build build
}

# time test failes
#check() {
#    cd "$pkgname-$pkgver"
#    cmake --build build -- test ARGS="$MAKEFLAGS"
#}

package() {
    cd "$pkgname-$pkgver"
    cmake --build build -- DESTDIR="$pkgdir" install
}
