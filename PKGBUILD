# $Id: PKGBUILD 239545 2015-05-18 23:54:05Z svenstaro $
# Maintainer:  Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Morgan Cox <morgancoxuk@gmail.com>
# Contributor: AudioLinux <audiolinux AT fastmail DOT fm>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-rt
pkgver=352.21
_extramodules=extramodules-4.0-rt
pkgrel=1
pkgdesc="NVIDIA drivers for linux-rt."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-rt>=4.0' 'linux-rt<4.1' "nvidia-utils=${pkgver}" 'libgl')
makedepends=('linux-rt-headers>=4.0' 'linux-rt-headers<4.1')
license=('custom')
install="${pkgname}.install"
options=(!strip)
source=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
        "ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums=('c91760a04f658845722380f6c7fd4709'
         '4eea308a1b04553f720f82fd2fac79d3')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make IGNORE_PREEMPT_RT_PRESENCE=1 SYSSRC=/usr/lib/modules/"${_kernver}/build" module

    if [[ "$CARCH" = "x86_64" ]]; then
        cd uvm
        make IGNORE_PREEMPT_RT_PRESENCE=1 SYSSRC=/usr/lib/modules/"${_kernver}/build" module
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
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"

    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
}
