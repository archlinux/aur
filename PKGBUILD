# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: graysky <graysky AT archlnux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-r500v
pkgver=361.28
_extramodules=extramodules-4.5-r500v
pkgrel=1
_pkgdesc="NVIDIA drivers for linux-r500v"
pkgdesc="$_pkgdesc"
arch=('x86_64')
url="http://www.nvidia.com/"
depends=('linux-r500v>=4.5rc1' 'linux-r500v<4.6rc1' "nvidia-libgl" "nvidia-utils=${pkgver}" 'xz')
makedepends=('linux-r500v-headers>=4.5rc1' 'linux-r500v-headers<4.6rc1')
license=('custom')
install=nvidia-r500v.install
options=('!strip')
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums=('449db0a2817a0fb48e748f366ec5eee222023dcf1cfd7429b88ff2da6a1903cf')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}/kernel"
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
    install -Dm644 "${srcdir}/${_pkg}/kernel/nvidia.ko"         "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
    install -Dm644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko"     "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    install -Dm644 "${srcdir}/${_pkg}/kernel/nvidia-modeset.ko" "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-modeset.ko"
    
    xz -9 "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -dm755 "${pkgdir}/usr/lib/modprobe.d"
    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-r500v.conf"
}
