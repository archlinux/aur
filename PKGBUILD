# Maintainer:  Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Morgan Cox <morgancoxuk@gmail.com>
# Contributor: AudioLinux <audiolinux AT fastmail DOT fm>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-rt
pkgver=358.16
_extramodules=extramodules-4.1-rt
pkgrel=2
pkgdesc="NVIDIA drivers for linux-rt"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-rt>=4.1' 'linux-rt<4.2' "nvidia-utils=${pkgver}" 'libgl')
makedepends=('linux-rt-headers>=4.1' 'linux-rt-headers<4.2')
license=('custom')
options=(!strip)
install=nvidia-rt.install
source_i686="ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
source_x86_64="ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
sha256sums_i686=('d3a2842cbfb1163e20c658fbfaf5a235d5c9f035cd2d657f15df8a14b3fe80b1')
sha256sums_x86_64=('4f0f02d1eb123128d133a5fd00a5ff129b2ac0482f552e15eafa8baa943321f7')

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
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-modeset.ko" \
         "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-modeset.ko"

    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
            "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"

    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
}
