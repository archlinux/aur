# $Id$
# Maintainer: Jiahui Feng <fengjiahui@megvii.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=nvidia-tesla-lts
pkgver=375.66
_extramodules=extramodules-4.9-lts
pkgrel=1
pkgdesc="NVIDIA Tesla drivers for linux-lts"
arch=('x86_64')
url="http://www.nvidia.com/"
makedepends=("nvidia-utils=$pkgver" 'linux-lts>=4.9.27' 'linux-lts-headers>=4.9.27')
conflicts=('nvidia-lts')
provides=('nvidia-lts')
license=('custom')
install=nvidia-lts.install
options=('!strip')
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}.run")
sha512sums_x86_64=('518534816da3e20e9b539e19b0e93340b6141aebe76989139aa130883106a68da74f9ef3692419e0b3c111a7c50ceb20e45ecdde53af78c7c709b4d51acb5164')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}"

prepare() {
    sh ${_pkg}.run --extract-only
}

build() {
    export IGNORE_CC_MISMATCH=1

    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}/kernel"
    make SYSSRC=/usr/lib/modules/${_kernver}/build module
}

package() {
    depends=('linux-lts>=4.9.27' "nvidia-utils=$pkgver" 'libgl')

    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
      "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/nvidia.ko"
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-modeset.ko" \
      "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/nvidia-modeset.ko"
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-drm.ko" \
      "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-drm.ko"

    if [[ "$CARCH" = "x86_64" ]]; then
      install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/"*.ko
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-lts.conf"
    echo "blacklist nvidiafb" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-lts.conf"
    install -D -m644 "${srcdir}/${_pkg}/LICENSE" "${pkgdir}/usr/share/licenses/nvidia-lts/LICENSE"
}
