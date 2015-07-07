# Maintainer : Kaan Genç <SeriousBug at gmail dot com>
# Contributor : Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-grsec
pkgver=352.21
_extramodules=extramodules-4.0.7-grsec
pkgrel=2
pkgdesc="NVIDIA drivers for linux-grsec kernel"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-grsec>=4.0' 'linux-grsec<4.1' "nvidia-libgl" "nvidia-utils=${pkgver}")
makedepends=('linux-grsec-headers>=4.0' 'linux-grsec-headers<4.1')
conflicts=('nvidia-96xx-grsec' 'nvidia-173xx-grsec')
license=('custom')
install=nvidia-grsec.install
options=(!strip)
source=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
        "ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
        "nvidia-drivers-pax-usercopy.patch"
        "nvidia-drivers-pax-constify.patch"
        "nv-drm.patch")
md5sums=('c91760a04f658845722380f6c7fd4709'
         '4eea308a1b04553f720f82fd2fac79d3'
         '5277c8699971b9bae8d2845cc00e0e5d'
         '29247a931d0d457692ae0bcd278d4d43'
         'ff8a5f979e4428f8c847423fb007042c')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here
    patch -Np1 -i "../nvidia-drivers-pax-usercopy.patch"
    patch -Np1 -i "../nvidia-drivers-pax-constify.patch"
    patch -Np1 -i "../nv-drm.patch"
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module

    cd uvm
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
    install -D -m644 "${srcdir}/${_pkg}/kernel/uvm/nvidia-uvm.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-grsec.conf"
    sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia-grsec.install"
}
