# Maintainer: Oystein Sture <oysstu at gmail.com>
# Contributor:

pkgname=alliedvision-vimba-x
_pkgver=2026.1.0
_pkgver_short=${_pkgver::6}
_pkgver_short_dash=${_pkgver_short//./-}
pkgver=$_pkgver
pkgrel=1
pkgdesc="Allied Vision Vimba X SDK"
url="https://www.alliedvision.com/en/products/software/vimba-x-sdk"
arch=('x86_64' 'aarch64')
license=('custom')
depends=('glibc' 'gcc-libs')
makedepends=('cmake' 'gcc')
source_x86_64=("https://allied-vision-web.atw.io/downloads/software/Vimba_X/VimbaX_Setup-${_pkgver_short_dash}-Linux64.tar.gz")
source_aarch64=("https://allied-vision-web.atw.io/downloads/software/Vimba_X/VimbaX_Setup-${_pkgver_short_dash}-Linux_ARM64.tar.gz")
sha256sums_x86_64=('74ca5b7dec96ae4845e54afc551cf2343f0beea6ac6d79811263da14781cc5c9')
sha256sums_aarch64=('b8f08149ca77786a98dc412d3c1b588ea7849f5163cc85d622908dd3cb242860')


build() {
    export CMAKE_POLICY_VERSION_MINIMUM=3.5

    # Re-build the distributed C++ binaries from source
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
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -r "cti" "${pkgdir}/usr/share/${pkgname}"

    # Export transport layer location
    mkdir -p "${pkgdir}/etc/profile.d/"
    printf "#!/bin/sh\nexport GENICAM_GENTL64_PATH=$GENICAM_GENTL64_PATH:\"/usr/share/${pkgname}/cti\"\n" > ${pkgdir}/etc/profile.d/AVT_CTI.sh
    chmod +x ${pkgdir}/etc/profile.d/AVT_CTI.sh

    # Create udev rule for USB
    _udev_dir=${pkgdir}/etc/udev/rules.d/
    _udev_file=${_udev_dir}/99-AVTUSBTL.rules
    mkdir -p "${_udev_dir}"
    printf "SUBSYSTEM==\"usb\", ACTION==\"add\", ATTRS{idVendor}==\"1ab2\", ATTRS{idProduct}==\"0001\", MODE=\"0666\"\nSUBSYSTEM==\"usb\", ACTION==\"add\", ATTRS{idVendor}==\"1ab2\", ATTRS{idProduct}==\"ff01\", MODE=\"0666\"\n" > ${_udev_file}
}
