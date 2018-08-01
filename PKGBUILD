# Maintainer: Vincent Bernardoff <vb AT luminar.eu.org>
pkgname=boringssl-git
pkgver=fips.20170615.1031.g548c27646
pkgrel=1
pkgdesc="BoringSSL is a fork of OpenSSL that is designed to meet Google's needs"
arch=(arm armv6h armv7h aarch64 x86_64 i686)
url="https://boringssl.googlesource.com/boringssl"
license=('MIT')
depends=()
makedepends=('git' 'cmake' 'go' 'perl' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=('git+https://boringssl.googlesource.com/boringssl')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --always --dirty --tags | sed -e 's/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=1 -GNinja ..
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ninja -C build
}

check() {
    cd "$srcdir/${pkgname%-git}"
    ninja -C build run_tests
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    for i in *.md ; do
        install -Dm644 $i "$pkgdir/usr/share/doc/$pkgname/$i"
    done
    install -d "$pkgdir/usr/lib"

    # install -Dm644 build/crypto/libcrypto.a "$pkgdir/usr/lib/crypto/libcrypto.a"
    install -Dm755 build/crypto/libcrypto.so "$pkgdir/usr/lib/crypto/libcrypto.so"

    # install -Dm644 build/ssl/libssl.a "$pkgdir/usr/lib/ssl/libssl.a"
    install -Dm755 build/ssl/libssl.so "$pkgdir/usr/lib/ssl/libssl.so"

    # install -Dm644 build/decrepit/libdecrepit.a "$pkgdir/usr/lib/decrepit/libdecrepit.a"
    install -Dm755 build/decrepit/libdecrepit.so "$pkgdir/usr/lib/decrepit/libdecrepit.so"

    # install -Dm644 build/libboringssl_gtest.a "$pkgdir/usr/lib/libboringssl_gtest.a"
    install -Dm755 build/libboringssl_gtest.so "$pkgdir/usr/lib/libboringssl_gtest.so"
}
