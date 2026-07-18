#This is an unofficial script to build and install the AOCL-Cryptography library with AOCC for Arch Linux AUR. 

pkgname=aocl-crypto-aocc
pkgaltname=aocl-crypto
pkgver=5.3
pkgrel=1
pkgdesc="AOCL-Cryptography is a library consisting of cryptographic optimized functions for Zen."
arch=('x86_64')
url="https://github.com/amd/aocl-crypto"
options=("staticlibs")
depends=("aocl-utils-aocc" "openssl" "libc++")
provides=("aocl-crypto")
conflicts=("aocl-crypto")
makedepends=('cmake' 'ninja' 'aocc' 'lsb-release')


source=("${pkgaltname}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8f7fa806879aac399c73e044048fc507c06fd099642cd7fece9e6ba9945d968e')

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
