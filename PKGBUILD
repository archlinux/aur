# Maintainer: Edmund Lodewijks <edmund@proteamail.com>

# NOTES from the packager:
# 1.) Upstream does not yet provide SONAMEs. Cf.: https://github.com/aws/aws-lc/issues/1098
# 2.) Three binaries are installed into /usr/bin/aws-lc so that 'openssl' does not interfere
#     with the binary from the package 'openssl'. Check with 'which openssl'.

pkgname=aws-lc
pkgver=1.57.0
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
b2sums=('bc62aa726cabeabef64bae7edaba57478ab944a3b33722bb9ce4562a1247cf7a6d4fe7e02197f0311af636f14efca27d0e5fd2de76ebb5eee76d84c295633c8f')

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
	  -DCMAKE_INSTALL_RPATH=/usr/lib/aws-lc

    ninja -C build -j $(nproc)
}

check() {
    cd ${pkgname}-${pkgver}

    ninja -C build run_tests
}

package() {
    cd ${pkgname}-${pkgver}
    
    DESTDIR="$pkgdir" ninja -C build install

    # Documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Licenses
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
