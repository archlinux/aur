# Maintainer: Darryl Pogue <darryl at dpogue dot ca>

pkgname=physx
pkgdesc='NVIDIA PhysX SDK'
pkgver=4.1.2.29882248
pkgrel=1
_reponame=PhysX
_commit='c3d5537bdebd6f5cd82fcaf87474b838fe6fd5fa'
arch=('i686' 'x86_64')
url='https://developer.nvidia.com/physx-sdk'
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake')
source=(
        "${pkgname}-${pkgver}.tar.gz::https://github.com/NVIDIAGameWorks/PhysX/archive/${_commit}.zip"
        "fix-compiler-flag.patch"
        "remove-werror.patch"
    )
sha256sums=(
        "4791bcbbbdf4d6ab69a3de195bd0c0468f973280706a0c13dd6bb57db773ba47"
        "9dec29f4ba44e9f7fe3c661374123c181684f96084c77173adc1ba863451cc3a"
        "34b8b488604c198b8545101edef7e24a226e355da6992160271b90ce0a294b50"
    )

prepare() {
    cd "${srcdir}/${_reponame}-${_commit}"

    patch --forward --strip=1 --input="${srcdir}/fix-compiler-flag.patch"
    patch --forward --strip=1 --input="${srcdir}/remove-werror.patch"
}

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    SOURCE_PATH="${srcdir}/${_reponame}-${_commit}"

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPHYSX_ROOT_DIR="${SOURCE_PATH}/physx" \
        -DPXSHARED_PATH="${SOURCE_PATH}/pxshared" \
        -DPXSHARED_INSTALL_PREFIX=/usr \
        -DCMAKEMODULES_PATH="${SOURCE_PATH}/externals/cmakemodules" \
        -DTARGET_BUILD_PLATFORM=linux \
        -DPX_OUTPUT_BIN_DIR="${srcdir}/build" \
        -DPX_OUTPUT_LIB_DIR="${srcdir}/build" \
        "${SOURCE_PATH}/physx/compiler/public"

    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_reponame}-${_commit}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Reorganize the libs into /usr/lib
    mkdir -p "${pkgdir}/usr/lib"
    find "${pkgdir}/usr/bin" \( -iname "*.a" -o -iname "*.so" \) -exec mv -t "${pkgdir}/usr/lib" {} +

    # Clean up some of the PhysX folder structure
    rm -rf "${pkgdir}/usr/bin"
    rm -rf "${pkgdir}/usr/source"
}
