# Maintainer: Edmund Lodewijks <edmund@proteamail.com>

# NOTES from the packager:
# 1.) Inital work is done on SONAMES since v1.57.0.
#     Cf.: https://newreleases.io/project/github/aws/aws-lc/release/v1.57.0
#     Note that this PKGBUILD does not build shared libraries by default (following upstream).
# 2.) This package installs to /usr/lib/aws-lc and /usr/include/aws-lc
#     to avoid conflicts with system OpenSSL. To build software against AWS-LC,
#     specify the library and include paths explicitly during configuration.

pkgname=aws-lc
pkgver=1.67.0
pkgrel=3
pkgdesc='general-purpose cryptographic library maintained by the AWS Cryptography team for AWS'
url='https://github.com/aws/aws-lc'
license=('MIT' 'ISC' 'Apache-2.0' 'OpenSSL')
options=()
depends=(
  'glibc'
  'bash'
  'gcc-libs'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'go'
  'perl'
)
optdepends=(
  'libunwind: For extra tests'
  'clang: alternative C/C++ compiler'
  'llvm: LLVM toolchain utilities (ar, ranlib, etc.) for use with clang'
)
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('2fc94dca5ff6bd2bd387035270bd65674621bc62b4d33522134c881aa81e59131eeb99f3d3e9a72e74e3bbb03770e5c5f425ec28007b58fd28ecc6219693f60f')
options=(!strip)

# Temporary: testing with Clang/LLVM toolchain
#_set_clang_toolchain() {
#    export CC=clang CXX=clang++ AR=llvm-ar NM=llvm-nm RANLIB=llvm-ranlib
#}

prepare() {
    cd ${pkgname}-${pkgver}

    # Fix const qualifier warning in OPENSSL_memchr
    # Reported upstream: https://github.com/aws/aws-lc/issues/2995
    sed -i 's/return memchr(s, c, n);/return (void *)memchr(s, c, n);/' \
    crypto/internal.h
}

build() {
    cd ${pkgname}-${pkgver}

    # IF you want to build with FIPS support:
    #   1.) Add "-DFIPS=ON" to the "cmake -B build" options below;
    #   1.) Set '!lto' in 'options()' above; and
    #   2.) Enable the following 3 lines of Flags.
    # There might be a better way to get rid of '-no-plt', but we're testing now.

    # Remove -no-plt flag from CFLAGS and CXXFLAGS for building with FIPS support:
    #CFLAGS="${CFLAGS//-fno-plt/}"
    #CXXFLAGS="${CXXFLAGS//-fno-plt/}"
    #export CFLAGS CXXFLAGS

    # Temporary: testing with Clang/LLVM toolchain
    #_set_clang_toolchain
    
    cmake -B build \
          -GNinja \
          -DCMAKE_BUILD_TYPE=RelWithAsserts \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_SBINDIR:PATH=bin/aws-lc \
          -DCMAKE_INSTALL_BINDIR:PATH=bin/aws-lc \
          -DCMAKE_INSTALL_LIBDIR:PATH=lib/aws-lc \
          -DCMAKE_INSTALL_INCLUDEDIR:PATH=include/aws-lc

    ninja -C build -j $(nproc)
}

check() {
    cd ${pkgname}-${pkgver}

    # Temporary: testing with Clang/LLVM toolchain
    #_set_clang_toolchain

    # ONLY FOR CLEAN-CHROOT: Skip OCSP integration tests - require external network connectivity
    #export GTEST_FILTER='-All/OCSPIntegrationTest.*'

    ninja -C build -j $(nproc) run_tests
}

package() {
    cd ${pkgname}-${pkgver}
    
    DESTDIR="$pkgdir" ninja -C build install

    # Clean up installation
    mkdir -p "$pkgdir/usr/lib/pkgconfig"

    # Rename with explicit mapping for clarity
    if [ -f "$pkgdir/usr/lib/$pkgname/pkgconfig/openssl.pc" ]; then
        mv "$pkgdir/usr/lib/$pkgname/pkgconfig/openssl.pc" \
          "$pkgdir/usr/lib/pkgconfig/aws-lc.pc"
    fi

    if [ -f "$pkgdir/usr/lib/$pkgname/pkgconfig/libssl.pc" ]; then
        mv "$pkgdir/usr/lib/$pkgname/pkgconfig/libssl.pc" \
          "$pkgdir/usr/lib/pkgconfig/aws-lc-libssl.pc"
    fi

    if [ -f "$pkgdir/usr/lib/$pkgname/pkgconfig/libcrypto.pc" ]; then
        mv "$pkgdir/usr/lib/$pkgname/pkgconfig/libcrypto.pc" \
          "$pkgdir/usr/lib/pkgconfig/aws-lc-libcrypto.pc"
    fi

    rm -rf "$pkgdir/usr/lib/$pkgname/pkgconfig"

    # Fix internal references in the pkg-config files
    sed -i 's/^Requires: libssl libcrypto/Requires: aws-lc-libssl aws-lc-libcrypto/' \
        "$pkgdir/usr/lib/pkgconfig/aws-lc.pc" 2>/dev/null || true
    sed -i 's/^Requires\.private: libcrypto/Requires.private: aws-lc-libcrypto/' \
        "$pkgdir/usr/lib/pkgconfig/aws-lc-libssl.pc" 2>/dev/null || true

    # Documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Licenses
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
