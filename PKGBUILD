# Maintainer: Edmund Lodewijks <edmund@proteamail.com>

# NOTES from the packager:
# 1.) This PKGBUILD does NOT build aws-lc as an openssl replacement. Instead,
#     this package adds suffix 'aws-lc' to avoid conflicts with system OpenSSL.
#     To build software against AWS-LC, specify the library and include paths
#     explicitly during configuration (pkgconfig provided).
#     The optional `ENABLE_DIST_PKG_OPENSSL_SHIM` flag creates `libcrypto.so`,
#     `libssl.so`, `include/openssl`, and `openssl.pc` symlinks or files
#     for drop-in OpenSSL compatibility

pkgname=aws-lc
pkgver=1.71.0
pkgrel=3
pkgdesc='General-purpose cryptographic library maintained by the AWS Cryptography team for AWS'
url='https://github.com/aws/aws-lc'
license=('ISC' 'Apache-2.0')
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "Patch01-tool-and-tool-openssl-bindir-cohabitant-headers.patch"
)
b2sums=('d458951843c6c269fabc794e121ef97f97e90d98bab97282aa28252dad9f3278794d3625a11800d42ca44dacc122e633fcb8f1a9a2b5f6da270393e25d772625'
        '55c39b51d3dabba02ba6b3d423846c0bbfee85aeed4e8ea3691488a1d78b98a5d4cd71a034aaabe438f995a9a3c535ac1fabeb79dd0df1f3c34ccb74c6119f89')
options=('!lto' 'staticlibs')

# Temporary: testing with Clang/LLVM toolchain
# No need to disable lto in 'options' above when using Clang
#_set_clang_toolchain() {
#    export CC=clang CXX=clang++ AR=llvm-ar NM=llvm-nm RANLIB=llvm-ranlib
#}

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    
    patch -p1 -i ../Patch01-tool-and-tool-openssl-bindir-cohabitant-headers.patch
}

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
          -DENABLE_DIST_PKG=ON \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_SBINDIR:PATH=bin \
          -DCMAKE_INSTALL_BINDIR:PATH=bin \
          -DCMAKE_INSTALL_LIBDIR:PATH=lib \
          -DCMAKE_INSTALL_INCLUDEDIR:PATH=include

    ninja -C build
}

#check() {
#    cd "$srcdir/${pkgname}-${pkgver}"

    # Temporary: testing with Clang/LLVM toolchain
    #_set_clang_toolchain

#    ninja -C build -j $(nproc) run_tests
#}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"

    DESTDIR="$pkgdir" ninja -C build install

    # Documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Licenses
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
