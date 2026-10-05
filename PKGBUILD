# Maintainer: Bink
pkgname=ktx-software-bin
pkgver=4.4.2
pkgrel=2
pkgdesc="KTX (Khronos Texture) Library and Tools"
arch=("x86_64" "aarch64")
url="https://github.com/KhronosGroup/KTX-Software"
license=("Apache-2.0")
depends=(
    "gcc-libs"
)
makedepends=("patchelf")
provides=(
    "ktx-software"
    "libktx.so=4-64"
    "libktx-jni.so=4-64"
)
conflicts=("ktx-software")
options=('!strip')
source=("KtxTargets-release.cmake.in")
source_x86_64=("https://github.com/KhronosGroup/KTX-Software/releases/download/v${pkgver}/KTX-Software-${pkgver}-Linux-x86_64.tar.bz2")
source_aarch64=("https://github.com/KhronosGroup/KTX-Software/releases/download/v${pkgver}/KTX-Software-${pkgver}-Linux-arm64.tar.bz2")
sha256sums=('87a2b69f2a78ef4e9fa3c21b5f6db8f06151013afe872decb34dda17d4871cce')
sha256sums_x86_64=('a8781bad05f9624edbf910b7f258cd0a4ba7d3e63b49ecc0a0ab440bf6a0a245')
sha256sums_aarch64=('60382e7b842177b8048bd58ccdc770383f8ef65b94452a25d3afdb55f2405c5a')

package() {
    # Upstream names its arm64 release directory arm64, not aarch64.
    local _arch="${CARCH/aarch64/arm64}"
    cd "${srcdir}/KTX-Software-${pkgver}-Linux-${_arch}" || exit

    # Binaries
    install -Dm755 bin/* -t "${pkgdir}/usr/bin"

    # Headers
    install -Dm644 include/*.h -t "${pkgdir}/usr/include"
    install -Dm644 include/KHR/*.h -t "${pkgdir}/usr/include/KHR"

    # Libraries (symlinks preserved)
    install -d "${pkgdir}/usr/lib"
    cp -a lib/libktx.so* lib/libktx-jni.so* "${pkgdir}/usr/lib/"
    chmod 755 "${pkgdir}"/usr/lib/libktx*.so."${pkgver}"
    
    # Remove the runtime search path from the JNI library.
    patchelf --remove-rpath "${pkgdir}/usr/lib/libktx-jni.so.${pkgver}"

    # CMake package config (targets file filled from pkgver)
    install -Dm644 lib/cmake/ktx/* -t "${pkgdir}/usr/lib/cmake/ktx"
    sed -e "s|@PKGVER@|${pkgver}|g" -e "s|@SOVER@|${pkgver%%.*}|g" \
        "${srcdir}/KtxTargets-release.cmake.in" \
        > "${pkgdir}/usr/lib/cmake/ktx/KtxTargets-release.cmake"
    chmod 644 "${pkgdir}/usr/lib/cmake/ktx/KtxTargets-release.cmake"

    # Manual pages
    install -Dm644 share/man/man1/* -t "${pkgdir}/usr/share/man/man1"
}
