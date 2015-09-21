# Maintainer: Sandor Nagy <sandor.nagy-at-kdemail-dot-net>
# Contributor: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor:  Morgan Cox <morgancoxuk@gmail.com>
# Contributor: Joakim Hernberg <jbh@alchemy.lu>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: 325.15 - patch : Ninez 

pkgname=nvidia-340xx-rt
pkgver=340.76
_extramodules=extramodules-4.1-rt
pkgrel=5
pkgdesc="NVIDIA drivers for linux-rt, 340xx legacy branch"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-rt>=4.1' 'linux-rt<4.2' "nvidia-340xx-utils=${pkgver}")
makedepends=('linux-rt-headers>=4.1' 'linux-rt-headers<4.2')
conflicts=('nvidia-rt' 'nvidia-last-rt' 'nvidia-rt-lts')
license=('custom')
install=${pkgname}.install
options=(!strip)

if [ "$CARCH" = "i686" ]; then
    _arch='x86'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}"
elif [ "$CARCH" = "x86_64" ]; then
    _arch=$CARCH
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
fi
source=("http://us.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run"
        nv-drm.patch
        nvidia-4.0.patch)

md5sums=(SKIP
         '79671a27131da619a33eb02ed0c2c031'
         'f42bdf589f52d4e6c38baa5bef15eef8')

prepare() {
    rm -Rf ${srcdir}/${_pkg}
    sh "${_pkg}.run" --extract-only

    cd "${_pkg}"
    patch -p0 -i ../nv-drm.patch
    patch -p0 -i ../nvidia-4.0.patch
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
    echo "blacklist nouveau" >> "${pkgdir}/etc/modprobe.d/nouveau_blacklist-nvidia-rt.conf"
    sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/${pkgname}.install"
    install -D -m644 ${srcdir}/${_pkg}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
