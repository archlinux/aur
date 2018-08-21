# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=abseil-cpp
pkgver=20180600
pkgrel=1
pkgdesc="Abseil Common Libraries (C++)"
arch=('any')
url="https://github.com/abseil/abseil-cpp"
license=('Apache')
makedepends=('cmake' 'git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('794d483dd9a19c43dc1fbbe284ce8956eb7f2600ef350dac4c602f9b4eb26e90')

build() {
    cd "$pkgname-$pkgver"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DABSL_RUN_TESTS=ON \
        -DABSL_USE_GOOGLETEST_HEAD=ON \

    cmake --build build
}

check() {
    cd "$pkgname-$pkgver"
    cmake --build build -- test ARGS="$MAKEFLAGS"
}

package() {
    cd "$pkgname-$pkgver"
    # quick and dirty until official install comes (if not I should patch their
    # cmake files)
    mkdir -p "$pkgdir/usr/include"
    cp -a absl "$pkgdir/usr/include/absl"
    mkdir "${pkgdir}/usr/lib/"
    find build/absl -name "*.a" -exec cp {} "${pkgdir}/usr/lib" \;

    # cmake --build build -- DESTDIR="$pkgdir" install
}
