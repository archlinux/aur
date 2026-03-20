# Maintainer: Edmund Lodewijks <edmund@proteamail.com>

# NOTES from the packager:
# 1.) Inital work is done on SONAMES since v1.57.0.
#     Cf.: https://newreleases.io/project/github/aws/aws-lc/release/v1.57.0
#     Note that this PKGBUILD does not build shared libraries by default (following upstream).
# 2.) This PKGBUILD does NOT build aws-lc as an openssl replacement (upstream does). Instead,
#     this package installs to /usr/lib/aws-lc and /usr/include/aws-lc
#     to avoid conflicts with system OpenSSL. To build software against AWS-LC,
#     specify the library and include paths explicitly during configuration.

pkgname=aws-lc
pkgver=1.71.0
pkgrel=1
pkgdesc='General-purpose cryptographic library maintained by the AWS Cryptography team for AWS'
url='https://github.com/aws/aws-lc'
license=('MIT' 'ISC' 'Apache-2.0' 'OpenSSL')
options=()
depends=(
  'glibc'
  'gcc-libs'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'go'
  'perl'
  'libunwind'
)
optdepends=(
  'clang: alternative C/C++ compiler'
  'llvm: LLVM toolchain utilities (ar, ranlib, etc.) for use with clang'
)
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d458951843c6c269fabc794e121ef97f97e90d98bab97282aa28252dad9f3278794d3625a11800d42ca44dacc122e633fcb8f1a9a2b5f6da270393e25d772625')
options=('!lto' 'staticlibs')

# Temporary: testing with Clang/LLVM toolchain
# No need to disable lto in 'options' above when using Clang
#_set_clang_toolchain() {
#    export CC=clang CXX=clang++ AR=llvm-ar NM=llvm-nm RANLIB=llvm-ranlib
#}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"

    # IF you want to build with FIPS support:
    #   1.) Add "-DFIPS=ON" to the "cmake -B build" options below;
    #   1.) Set '!lto' in 'options()' above; and
    #   2.) Enable the following 3 lines of Flags.

    # Remove -no-plt flag from CFLAGS and CXXFLAGS for building with FIPS support:
    #CFLAGS="${CFLAGS//-fno-plt/}"
    #CXXFLAGS="${CXXFLAGS//-fno-plt/}"
    #export CFLAGS CXXFLAGS

    # Temporary: testing with Clang/LLVM toolchain
    #_set_clang_toolchain
    
    cmake -B build \
          -GNinja \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_SBINDIR:PATH=bin/${pkgname} \
          -DCMAKE_INSTALL_BINDIR:PATH=bin/${pkgname} \
          -DCMAKE_INSTALL_LIBDIR:PATH=lib/${pkgname} \
          -DCMAKE_INSTALL_INCLUDEDIR:PATH=include/${pkgname}

    ninja -C build
}

check() {
    cd "$srcdir/${pkgname}-${pkgver}"

    # Temporary: testing with Clang/LLVM toolchain
    #_set_clang_toolchain

    ninja -C build -j $(nproc) run_tests
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"

    DESTDIR="$pkgdir" ninja -C build install

    # Ensure the parent directory exists
    mkdir -p "$pkgdir/usr/lib"

    # Move the whole folder and rename it in one go
    mv "$pkgdir/usr/lib/$pkgname/pkgconfig" "$pkgdir/usr/lib/pkgconfig"

    # Rename the individual pc-files to not conflict with local OpenSSL
    mv "$pkgdir/usr/lib/pkgconfig/openssl.pc"   "$pkgdir/usr/lib/pkgconfig/$pkgname.pc"
    mv "$pkgdir/usr/lib/pkgconfig/libssl.pc"    "$pkgdir/usr/lib/pkgconfig/$pkgname-libssl.pc"
    mv "$pkgdir/usr/lib/pkgconfig/libcrypto.pc" "$pkgdir/usr/lib/pkgconfig/$pkgname-libcrypto.pc"

    # Update pkgconfig's "Requires" to our new locations
    sed -i 's/^Requires: libssl libcrypto/Requires: aws-lc-libssl aws-lc-libcrypto/' \
    "$pkgdir/usr/lib/pkgconfig/$pkgname.pc"
    sed -i 's/^Requires\.private: libcrypto/Requires.private: aws-lc-libcrypto/' \
    "$pkgdir/usr/lib/pkgconfig/$pkgname-libssl.pc"

    # Documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Licenses
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
