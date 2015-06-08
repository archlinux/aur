# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor:  Morgan Cox <morgancoxuk@gmail.com>
# Contributor: Joakim Hernberg <jbh@alchemy.lu>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: 325.15 - patch : Ninez 

pkgname=nvidia-last-rt
pkgver=352.09
_extramodules=extramodules-4.0-rt
_kernver="$(cat /lib/modules/${_extramodules}/version)"
pkgrel=4
pkgdesc="NVIDIA last drivers for linux-rt."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-rt>=4.0' 'linux-rt<4.1' "nvidia-utils=${pkgver}")
makedepends=('linux-rt-headers>=4.0' 'linux-rt-headers<4.1')
conflicts=('nvidia-96xx' 'nvidia-173xx' 'nvidia-rt' 'nvidia-340xx-rt')
provides=('nvidia-rt')
license=('custom')
install=nvidia.install
options=(!strip)

if [ "$CARCH" = "i686" ]; then
    _arch='x86'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}"
    source=("http://us.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run"
            "nv-drm-343.36.patch")
    md5sums=('SKIP' 'SKIP' )
elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86_64'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
    source=("http://us.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run"
            "nv-drm-343.36.patch")
    md5sums=('SKIP' 'SKIP' )
fi

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here
    patch -p1 -i ../nv-drm-343.36.patch
}

build() {
    cd "${srcdir}"
    cd "${_pkg}/kernel"    

    # Build module
    msg2 "Starting make module..."
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

    install -d -m755 "${pkgdir}/etc/modprobe.d"
    echo "blacklist nouveau" >> "${pkgdir}/etc/modprobe.d/nouveau_blacklist-nvidia-rt.conf"
    sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia.install"
    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
}
