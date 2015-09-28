# Maintainer: Sandor Nagy <sandor.nagy-at-kdemail-dot-net>
# Contributor: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor:  Morgan Cox <morgancoxuk@gmail.com>
# Contributor: Joakim Hernberg <jbh@alchemy.lu>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: 325.15 - patch : Ninez 

pkgname=nvidia-340xx-rt
pkgver=340.76
_extramodules=extramodules-4.1-rt
pkgrel=6
pkgdesc="NVIDIA drivers for linux-rt, 340xx legacy branch"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-rt>=4.1' 'linux-rt<4.2' "nvidia-340xx-utils=${pkgver}")
makedepends=('linux-rt' 'linux-rt-headers>=4.1' 'linux-rt-headers<4.2')
conflicts=('nvidia-rt' 'nvidia-last-rt' 'nvidia-rt-lts')
license=('custom')
install=${pkgname}.install
options=(!strip)
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
source=(nv-drm.patch
        nvidia-4.0.patch)
md5sums_i686=('8064c0a0998c3e7ee3c98ac1832b8194')
md5sums_x86_64=('440df290e213280d6e20d4d4be6f8b4c')
md5sums=('79671a27131da619a33eb02ed0c2c031'
         'f42bdf589f52d4e6c38baa5bef15eef8')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    rm -Rf ${srcdir}/${_pkg}
    sh "${_pkg}.run" --extract-only

    cd "${_pkg}"
    patch -Np0 -i ../nv-drm.patch
    patch -Np0 -i ../nvidia-4.0.patch
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
    gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -d -m755 "${pkgdir}/etc/modprobe.d"
    echo "blacklist nouveau" >> "${pkgdir}/etc/modprobe.d/${pkgname}.conf"
    sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/${pkgname}.install"
    install -D -m644 ${srcdir}/${_pkg}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
