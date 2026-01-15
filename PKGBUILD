# Maintainer: Edmund Lodewijks <edmund AT proteamail.com>
# Contributor: Vincent Bernardoff <vb AT luminar.eu.org>

# Note: This package installs to /usr/lib/boringssl and /usr/include/boringssl
# to avoid conflicts with system OpenSSL. To build software against BoringSSL,
# specify the library and include paths explicitly during configuration.

pkgname=boringssl-git
_pkgname=boringssl
pkgver=0.20251124.0.174.gb648431a6e
pkgrel=1
pkgdesc="BoringSSL is a fork of OpenSSL that is designed to meet Google's needs"
arch=(arm armv6h armv7h aarch64 x86_64 i686)
url="https://boringssl.googlesource.com/boringssl"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cmake' 'go' 'perl' 'ninja' 'patchelf')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    'git+https://boringssl.googlesource.com/boringssl'
    'boringssl.pc'
)
b2sums=('SKIP'
        '299c46ea68a252e9dd33e789689255a740e69a2165ecf43158d4a159f04859bb6192cdaeb35cb77ed1435316fce55d5559c392cd7512b374d39de3c898b388ae')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --always --dirty --tags | sed -e 's/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
        -DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib/$_pkgname \
        -DCMAKE_INSTALL_BINDIR=bin/$_pkgname \
        -DCMAKE_INSTALL_INCLUDEDIR=include/$_pkgname \
        -DCMAKE_INSTALL_RPATH='$ORIGIN/../lib/boringssl' \
        -DBUILD_SHARED_LIBS=1 \
        -GNinja ..
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
    cd "$srcdir/$_pkgname"

    # Documentation
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    for i in *.md ; do
        install -Dm644 "$i" "$pkgdir/usr/share/doc/$_pkgname/$i"
    done

    # Libraries - all under /usr/lib/boringssl/
    install -Dm755 build/libcrypto.so "$pkgdir/usr/lib/$_pkgname/libcrypto.so"
    install -Dm755 build/libssl.so "$pkgdir/usr/lib/$_pkgname/libssl.so"
    install -Dm755 build/libdecrepit.so "$pkgdir/usr/lib/$_pkgname/libdecrepit.so"
    install -Dm755 build/libpki.so "$pkgdir/usr/lib/$_pkgname/libpki.so"
    install -Dm755 build/libboringssl_gtest.so "$pkgdir/usr/lib/$_pkgname/libboringssl_gtest.so"

    # Headers - under /usr/include/boringssl/
    # BoringSSL uses include/openssl subdirectory for compatibility
    install -d "$pkgdir/usr/include/$_pkgname"
    cp -r include/openssl "$pkgdir/usr/include/$_pkgname/"

    # Binary - under /usr/bin/boringssl/
    install -Dm755 build/bssl "$pkgdir/usr/bin/$_pkgname/bssl"

    echo "Fixing RPATHs with $ORIGIN..."

    # Fix the binary
    patchelf --set-rpath '$ORIGIN/../../lib/boringssl' "$pkgdir/usr/bin/$_pkgname/bssl"

    # Fix the libraries
    find "$pkgdir/usr/lib/$_pkgname" -type f -name "*.so" -exec \
        patchelf --set-rpath '$ORIGIN' {} +

    # Install pkg-config file so other apps can find this BoringSSL
    install -Dm644 "$srcdir/$_pkgname.pc" "${pkgdir}/usr/lib/pkgconfig/"
}

