# Maintainer: Edmund Lodewijks <edmund@proteamail.com>

# NOTES from the packager:
# 1.) Inital work is done on SONAMES since v1.57.0.
#     Cf.: https://newreleases.io/project/github/aws/aws-lc/release/v1.57.0
# 2.) This package installs to /usr/lib/boringssl and /usr/include/boringssl
#     to avoid conflicts with system OpenSSL. To build software against BoringSSL,
#     specify the library and include paths explicitly during configuration.

pkgname=aws-lc
pkgver=1.66.2
pkgrel=1
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
  'clang: Alternative for gcc (gcc preferred by upstream)'
)
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('eaffacbbd7fa04bd9d5ea09c94f83edcf89a171abe736a9b5146b381267300a34b3dc947e445365149857a77885ca97cd03faf5469c15a1365173d987aebf0a2')
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
