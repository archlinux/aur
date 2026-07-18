#This is an unofficial script to build and install the AOCL-Cryptography library for Arch Linux AUR. 

pkgname=aocl-crypto
pkgver=5.3
pkgrel=1
pkgdesc="AOCL-Cryptography is a library consisting of cryptographic optimized functions for Zen."
arch=('x86_64')
url="https://github.com/amd/aocl-crypto"
options=("staticlibs")
depends=("aocl-utils" "openssl")
makedepends=('cmake' 'ninja' 'gcc' 'clang' 'lsb-release')


source=("${pkgname}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8f7fa806879aac399c73e044048fc507c06fd099642cd7fece9e6ba9945d968e')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    #FIXME: Enable Assembly
    #FIXME: Enable Dynamic Compiler Picker
    cmake -B build -DAOCL_COMPAT_LIBS=openssl -DALCP_DISABLE_ASSEMBLY=ON -DALCP_ENABLE_EXAMPLES=OFF -DCMAKE_INSTALL_PREFIX=/usr \
    -DOPENSSL_INSTALL_DIR=/usr  -DAOCL_UTILS_INSTALL_DIR=/usr -DALCP_ENABLE_DYNAMIC_COMPILER_PICK=OFF \
    -DCMAKE_CXX_FLAGS="-Wno-error=maybe-uninitialized" \
    -G Ninja
    cmake --build build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}/build
    DESTDIR=${pkgdir} ninja install
}
