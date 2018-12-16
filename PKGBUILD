# Maintainer: Sandor Nagy <sandor.nagy-at-kdemail-dot-net>
# Contributor: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor:  Morgan Cox <morgancoxuk@gmail.com>
# Contributor: Joakim Hernberg <jbh@alchemy.lu>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: 325.15 - patch : Ninez

pkgname=nvidia-340xx-rt
pkgver=340.107
_extramodules=extramodules-rt
pkgrel=1
pkgdesc="NVIDIA drivers for linux-rt, 340xx legacy branch"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-rt>=4.18' 'linux-rt<4.19' 'libgl' "nvidia-340xx-utils=${pkgver}")
makedepends=('nvidia-340xx-libgl' "nvidia-340xx-utils=${pkgver}" 'linux-rt' 'linux-rt-headers>=4.18' 
'linux-rt-headers<4.19')
conflicts=('nvidia-rt' 'nvidia-last-rt' 'nvidia-rt-lts')
license=('custom')
install=${pkgname}.install
options=(!strip)
source=('kernel-4.11.patch')
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums=('e09208cdee41f89ae787f86c602c69d2')
md5sums_i686=('9a4b382ef545d836033630224735d5dd')
md5sums_x86_64=('ffca1879d77dfc491dfb0276ceb56cc1')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    rm -Rf "${srcdir}/${_pkg}"
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"

    patch -Np0 < "${srcdir}/kernel-4.11.patch"
}

build() {
    _kernver="$(cat /lib/modules/${_extramodules}/version)"

    cd "${_pkg}/kernel"
    make IGNORE_PREEMPT_RT_PRESENCE=1 SYSSRC=/usr/lib/modules/"${_kernver}/build" module

    cd uvm
    make IGNORE_PREEMPT_RT_PRESENCE=1 SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
    install -D -m644 "${srcdir}/${_pkg}/kernel/uvm/nvidia-uvm.ko" \
    	"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -d -m755 "${pkgdir}/etc/modprobe.d"
    echo "blacklist nouveau" >> "${pkgdir}/etc/modprobe.d/${pkgname}.conf"
    sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/${pkgname}.install"
    install -D -m644 ${srcdir}/${_pkg}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
