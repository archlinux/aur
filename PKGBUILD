# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=nvidia-think
pkgver=364.19
_extramodules=extramodules-4.5-think
pkgrel=1
pkgdesc="NVIDIA drivers for linux-think kernel"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-think>=4.5' 
	 'linux-think<4.6'
   	 'nvidia-utils=364.19' 
	 'libgl')
makedepends=('linux-think-headers>=4.5')
license=('custom')
install=nvidia.install
options=(!strip)
source=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
        "http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")


md5sums=('8a4015213c4a8f1c80e9520d04a32a7b'
         'ad7a0b1855b3913390fb75b4cc3a26dc')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
#[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    # patches here
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
    #if [[ "$CARCH" = "x86_64" ]]; then
    #    cd uvm
    #    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
    #fi	
}

package() {
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-modeset.ko" \
	"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-modeset.ko"

    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-drm.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-drm.ko"


    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
            "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
    #echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
}
