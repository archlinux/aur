# Maintainer: PitBall

pkgname=nvidia-352-lts
pkgver=352.79
pkgrel=5
pkgdesc="NVIDIA drivers for linux-lts"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lts' "nvidia-utils-352=${pkgver}" 'libgl')
makedepends=('linux-lts-headers')
provides=('nvidia')
conflicts=('nvidia-lts')
license=('custom')
install=nvidia-352-lts.install
options=(!strip)
source=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
        "ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums=('8f5b2c809490e0ebec17b9074a5a8363'                                              
         'a9440d3f4b38c25ebb2ddf56739d404a')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

_major=$(pacman -Q linux-lts | grep -Po "\d+\.\d+")
_extramodules=extramodules-$_major-lts
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
 
prepare() {
    rm -rf "${_pkg}"	
    sh "${_pkg}.run" --extract-only 
    cd "${_pkg}"
}

build() {
    cd "${_pkg}"/kernel
    IGNORE_CC_MISMATCH=1 make SYSSRC=/usr/lib/modules/"${_kernver}/build" module

    if [[ "$CARCH" = "x86_64" ]]; then
        cd uvm
        IGNORE_CC_MISMATCH=1 make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
    fi
}

package() {
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "${srcdir}/${_pkg}/kernel/uvm/nvidia-uvm.ko" \
            "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko

}

