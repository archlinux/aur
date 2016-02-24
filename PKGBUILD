# $Id$
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Maintainer: Drew Walton <drewwalton19216801@gmail.com>

pkgname=nvidia-352-git
pkgver=352.79
pkgrel=1
pkgdesc="NVIDIA drivers for linux-git"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-git' 'linux-git' "nvidia-utils-352=${pkgver}" 'libgl')
makedepends=('linux-headers>=4.3' 'linux-git-headers')
provides=('nvidia')
conflicts=('nvidia-96xx' 'nvidia-173xx' 'nvidia')
license=('custom')
install=nvidia-352-git.install
options=(!strip)
source=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
        "ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums=('8f5b2c809490e0ebec17b9074a5a8363'
         'a9440d3f4b38c25ebb2ddf56739d404a')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here
}

build() {
    _major=$(pacman -Q linux-git | grep -Po "\d+\.\d+")
    _extramodules=extramodules-$_major-git
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    IGNORE_CC_MISMATCH=1 make SYSSRC=/usr/lib/modules/"${_kernver}/build" module

    if [[ "$CARCH" = "x86_64" ]]; then
        cd uvm
        IGNORE_CC_MISMATCH=1 make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
    fi
}

package() {
    _major=$(pacman -Q linux-git | grep -Po "\d+\.\d+")
    _extramodules=extramodules-$_major-git

    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "${srcdir}/${_pkg}/kernel/uvm/nvidia-uvm.ko" \
            "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"

    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
}
