# Maintainer: Sandor Nagy <sandor.nagy-at-kdemail-dot-net>
# Contributor: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor:  Morgan Cox <morgancoxuk@gmail.com>
# Contributor: Joakim Hernberg <jbh@alchemy.lu>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: 325.15 - patch : Ninez 

pkgname=nvidia-340xx-rt
pkgver=340.96
_extramodules=extramodules-4.6-rt
pkgrel=3
pkgdesc="NVIDIA drivers for linux-rt, 340xx legacy branch"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-rt>=4.6' 'linux-rt<4.7' 'libgl' "nvidia-340xx-utils=${pkgver}")
makedepends=("nvidia-340xx-libgl=${pkgver}" "nvidia-340xx-utils=${pkgver}" 'linux-rt' 'linux-rt-headers>=4.6' 'linux-rt-headers<4.7')
conflicts=('nvidia-rt' 'nvidia-last-rt' 'nvidia-rt-lts')
license=('custom')
install=${pkgname}.install
options=(!strip)
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
source=('linux-4.6.patch')
md5sums=('1f2baa65fd351ae7a2fc3dfd71ffcbfe')
md5sums_i686=('cb64b165b638671bcdc75bcf297b8d90')
md5sums_x86_64=('7bdbcee13bade63227933d9217571882')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    rm -Rf "${srcdir}/${_pkg}"
    sh "${_pkg}.run" --extract-only

    cd "${_pkg}"
    patch -p1 --no-backup-if-mismatch -i ../linux-4.6.patch
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
