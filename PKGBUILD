# Maintainer: Edmund Lodewijks <edmund@proteamail.com>

pkgname=aws-lc
pkgver=1.54.0
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
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('73d2935f2b1d98ed55dc3631108528c05fb3c5dfa9b6d2e76037a989332cb58c9ddc1d8a8b1f20cf95ccf0881c6bcadbfca62e07b1061ca29a9f67b4dd8aa0b7')
validpgpkeys=(968479a1aff927e37d1a566bb5690eeebb952194) # GitHub key

build() {
    cd ${pkgname}-${pkgver}

    # Add an extra flag to avoid a build error due to a warning
    #   IMPORTANT: If you use Clang, use "-Wno-error=uninitialized"
    CFLAGS+=" -Wno-error=maybe-uninitialized"
#    CFLAGS+=" -Wno-error=uninitialized"
    
    # 1.) Read 2.1.2 https://wiki.archlinux.org/title/CMake_package_guidelines
    # 2.) CMake does not respect ASFLAGs set in /etc/makepkg.conf, so we have to set CMAKE_ASM_FLAGS here.
    cmake -B build \
	  -GNinja \
	  -DCMAKE_BUILD_TYPE=RelWithAssert \
	  -DCMAKE_ASM_FLAGS="${CMAKE_ASM_FLAGS} -fcf-protection=full" \
	  -DBUILD_SHARED_LIBS=ON \
	  -DCMAKE_INSTALL_PREFIX=../aws-lc \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_INSTALL_SBINDIR:PATH=bin \
	  -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib/aws-lc \
	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=/usr/include/aws-lc \
	  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

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
    
    # Rename files in /usr/bin so that they don't clash with OpenSSL files
    cd ${pkgdir}/usr/bin
    for file in *; do
        mv "$file" "aws-lc-${file}"
    done
}
