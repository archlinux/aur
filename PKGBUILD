#This is an unofficial script to build and install the AOCL-Cryptography library with AOCC for Arch Linux AUR. 

pkgname=aocl-crypto-aocc
pkgaltname=aocl-crypto
pkgver=5.3.2
pkgrel=1
pkgdesc="AOCL-Cryptography is a library consisting of cryptographic optimized functions for Zen."
arch=('x86_64')
url="https://github.com/amd/aocl-crypto"
options=("staticlibs")
depends=("aocl-utils-aocc" "openssl" "libc++")
provides=("aocl-crypto")
conflicts=("aocl-crypto")
makedepends=('cmake' 'ninja' 'aocc' 'lsb-release')


source=("${pkgaltname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9fb1a7cf9fc56e02acd5befb51e8f90eb046879e4ea1e5533747cc4b66a9363d')

build() {
    cd ${srcdir}/${pkgaltname}-${pkgver}
    source /opt/aocc/setenv_AOCC.sh
    #FIXME: Enable Assembly
    #FIXME: Enable Dynamic Compiler Picker
    cmake -B build -DAOCL_COMPAT_LIBS=openssl -DALCP_DISABLE_ASSEMBLY=ON -DALCP_ENABLE_EXAMPLES=OFF -DCMAKE_INSTALL_PREFIX=/usr \
    -DOPENSSL_INSTALL_DIR=/usr  -DAOCL_UTILS_INSTALL_DIR=/usr -DALCP_ENABLE_DYNAMIC_COMPILER_PICK=OFF \
    -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_FLAGS="-stdlib=libc++" \
    -G Ninja
    cmake --build build
}

package() {
    cd ${srcdir}/${pkgaltname}-${pkgver}/build
    DESTDIR=${pkgdir} ninja install
}
