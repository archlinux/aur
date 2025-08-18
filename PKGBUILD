# Maintainer: Edmund Lodewijks <edmund@proteamail.com>

# NOTES from the packager:
# 1.) Inital work is done on SONAMES since v1.57.0.
#     Cf.: https://newreleases.io/project/github/aws/aws-lc/release/v1.57.0
# 2.) Three binaries are installed into /usr/bin/aws-lc so that 'openssl' does not interfere
#     with the binary from the package 'openssl'. Check with 'which openssl'.
# 3.) FIPS does not work, it throws errors during build. Reported upstream.

pkgname=aws-lc
pkgver=1.58.1
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ddb87f058b8206af7997437604743777e33c5686e8c20315f52e829b117e897cf4852188c2e2bdea33d68090c9e0ab1617f4cf7f3d9f82befff99a1f8df0e4ff')

build() {
    cd ${pkgname}-${pkgver}

    # CMake does not respect ASFLAGs set in /etc/makepkg.conf, so we have to set CMAKE_ASM_FLAGS here.
    cmake -B build \
	  -GNinja \
	  -DCMAKE_BUILD_TYPE=RelWithAssert \
	  -DCMAKE_ASM_FLAGS="${CMAKE_ASM_FLAGS} -fcf-protection=full" \
	  -DBUILD_SHARED_LIBS=ON \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_INSTALL_SBINDIR:PATH=bin/aws-lc \
	  -DCMAKE_INSTALL_BINDIR:PATH=bin/aws-lc \
	  -DCMAKE_INSTALL_LIBDIR:PATH=lib/aws-lc \
	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=include/aws-lc \
	  -DCMAKE_INSTALL_RPATH=/usr/lib/aws-lc \
      -DENABLE_PRE_SONAME_BUILD=0

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
