# Maintainer: Oystein Sture <oysstu at gmail.com>
# Contributor:

pkgname=alliedvision-vimba-x
_pkgver=2023.4.0
_pkgver_short=${_pkgver::6}
_pkgver_short_dash=${_pkgver_short//./-}
pkgver=$_pkgver
pkgrel=1
pkgdesc="Allied Vision Vimba X SDK"
url="https://www.alliedvision.com/en/products/software/vimba-x-sdk"
arch=('x86_64' 'aarch64')
license=('custom')
depends=()
makedepends=('cmake')
source_x86_64=("https://downloads.alliedvision.com/VimbaX/VimbaX_Setup-${_pkgver_short_dash}-Linux64.tar.gz")
source_aarch64=("https://downloads.alliedvision.com/VimbaX/VimbaX_Setup-${_pkgver_short_dash}-Linux_ARM64.tar.gz")
sha256sums_x86_64=('f4458b72ed3d7e167e2c4026180780254fad7667e9a46b63f9a74caa4e581871')
sha256sums_aarch64=('daa552b0b116c19c8d4d784a740bd630033e6eedc334f6361d114a9ce05e2bde')


build() {
    cd "$srcdir/VimbaX_${_pkgver_short_dash}/api/source/VmbCPP"
    mkdir -p build
    cd build
    cmake -DCMAKE_LIBRARY_ARCHITECTURE="$CARCH-linux-gnu" ..
    make
}

package() {
    cd "${srcdir}/VimbaX_${_pkgver_short_dash}"

    # Install distributed headers/binaries
    mkdir -p "${pkgdir}/usr/include"
    cp -r "api/include" "${pkgdir}/usr/"
    cp -r "api/lib" "${pkgdir}/usr/lib"

    # Install re-built cpp wrapper and generated headers
    install -m644 "api/source/VmbCPP/build/libVmbCPP.so" "${pkgdir}/usr/lib/libVmbCPP.so"
    cp -r "api/source/VmbCPP/build/VmbCppGenIncludes/" "${pkgdir}/usr/include"

    # Install transport layers
    mkdir -p "${pkgdir}/usr/share/vimba-x-sdk/"
    cp -r "cti" "${pkgdir}/usr/share/vimba-x-sdk/"
}
