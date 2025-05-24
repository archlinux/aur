#This is an unofficial script to build and install the AOCL-Cryptography library for Arch Linux AUR. 

pkgname=aocl-crypto
pkgver=5.1
pkgrel=1
pkgdesc="AOCL-Cryptography is a library consisting of cryptographic optimized functions for Zen."
arch=('x86_64')
url="https://github.com/amd/aocl-crypto"
options=("staticlibs")
depends=("aocl-utils")
makedepends=('cmake' 'ninja' 'gcc' 'clang' 'lsb-release')


source=("${pkgname}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "out.patch")
sha256sums=('a2f768b7d37516c5c29cca0034aba90b91d02e477c762f2fa0fe4b1c30613973'
            '52cc9e42ac1584a0872c70b09b1a443a655a21c6a2099dad980a2b38f608188c')

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}
    patch -p1 < ../out.patch
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    #FIXME: Enable Assembly
    #FIXME: Enable Dynamic Compiler Picker
    cmake -B build -DAOCL_COMPAT_LIBS=openssl -DALCP_DISABLE_ASSEMBLY=ON -DALCP_ENABLE_EXAMPLES=OFF -DCMAKE_INSTALL_PREFIX=/usr \
    -DOPENSSL_INSTALL_DIR=/usr  -DAOCL_UTILS_INSTALL_DIR=/usr -DALCP_ENABLE_DYNAMIC_COMPILER_PICK=OFF \
    -G Ninja
    cmake --build build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}/build
    DESTDIR=${pkgdir} ninja install
}
