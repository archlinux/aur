# Maintainer: Edmund Lodewijks <edmund@proteamail.com>

# NOTES from the packager:
# 1.) Inital work is done on SONAMES since v1.57.0.
#     Cf.: https://newreleases.io/project/github/aws/aws-lc/release/v1.57.0
# 2.) Three binaries are installed into /usr/bin/aws-lc so that 'openssl' does not interfere
#     with the binary from the package 'openssl'. Check with 'which openssl'.

pkgname=aws-lc
pkgver=1.66.1
pkgrel=1
pkgdesc='general-purpose cryptographic library maintained by the AWS Cryptography team for AWS'
url='https://github.com/aws/aws-lc'
license=('MIT' 'ISC' 'Apache-2.0' 'LicenseRef-SSLeay-License')
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
  'clang: Alternative for gcc (gcc preferred by upstream)'
)
arch=('x86_64')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "Patch01-disable-fortify-sources-jitterentropy.patch"
)
b2sums=('05f515f363efed85d0031bbd83d9c0d150d72c94d352a4e53a753872e92521218f2aa80098959f6cfd093035c8fba86bc675e035f5193aa924bc78bd71802ad9'
        '84c1e992d09720f77ee34ec951a6a0fe12d060431c22b8d2f567c888147c54472ce6b394d3f63c5e89eaa7d44c2625ed9de74bbb112ff4f8d7694fdb9b80020b')
options=(!strip !lto)

build() {
    cd ${pkgname}-${pkgver}

    # IF you want to build with FIPS support:
    #   1.) Add "-DFIPS=ON" to the "cmake -B build" options below;
    #   1.) Set '!lto' in 'options()' above; and
    #   2.) Enable the following 3 lines of Flags.
    # There might be a better way to get rid of '-no-plt', but we're testing now.

    # Remove -no-plt flag from CFLAGS and CXXFLAGS for building with FIPS support:
    CFLAGS="${CFLAGS//-fno-plt/}"
    CXXFLAGS="${CXXFLAGS//-fno-plt/}"

    export CFLAGS CXXFLAGS

    # CMake does not respect ASFLAGs set in /etc/makepkg.conf, so we have to set CMAKE_ASM_FLAGS here.
    cmake -B build \
	  -GNinja \
	  -DCMAKE_BUILD_TYPE=RelWithAssert \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_INSTALL_SBINDIR:PATH=bin/aws-lc \
	  -DCMAKE_INSTALL_BINDIR:PATH=bin/aws-lc \
	  -DCMAKE_INSTALL_LIBDIR:PATH=lib/aws-lc \
	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=include/aws-lc \
      -DCMAKE_C_FLAGS="$CFLAGS" \
      -DCMAKE_CXX_FLAGS="$CXXFLAGS"

    ninja -C build -j $(nproc)
}

check() {
    cd ${pkgname}-${pkgver}

    ninja -C build run_tests
}

package() {
    cd ${pkgname}-${pkgver}
    
    DESTDIR="$pkgdir" ninja -C build install

    # Clean up installation
    mkdir -p "$pkgdir/usr/lib/pkgconfig/$pkgname"
    mv $pkgdir/usr/lib/$pkgname/pkgconfig/* "$pkgdir/usr/lib/pkgconfig/$pkgname/"
    rm -rf "$pkgdir/usr/lib/$pkgname/pkgconfig"
    rm -rf "$pkgdir/usr/lib/$pkgname/ssl"

    # Documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Licenses
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
