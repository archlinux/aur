# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor:  Morgan Cox <morgancoxuk@gmail.com>
# Contributor: Joakim Hernberg <jbh@alchemy.lu>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: 325.15 - patch : Ninez 

pkgname=nvidia-340xx-rt
pkgver=340.76
_extramodules=extramodules-3.18-rt
_kernver="$(cat /lib/modules/${_extramodules}/version)"
pkgrel=4
pkgdesc="NVIDIA 340xx drivers for linux-rt."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-rt>=4.0' 'linux-rt<4.1' "nvidia-340xx-utils")
makedepends=('linux-rt>=4.0' 'linux-rt<4.1')
conflicts=('nvidia-96xx' 'nvidia-173xx' 'nvidia-rt' 'nvidia-last-rt')
license=('custom')
install=nvidia.install
options=(!strip)

if [ "$CARCH" = "i686" ]; then
    _arch='x86'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}"
    source=("http://us.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
    md5sums=(SKIP )
elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86_64'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
    source=("http://us.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
    md5sums=(SKIP )
fi

build() {
    cd "${srcdir}"
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}/kernel"

    # Build module
    msg2 "Starting make module..."
    make IGNORE_PREEMPT_RT_PRESENCE=1 SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
    install -d -m755 "${pkgdir}/etc/modprobe.d"
    echo "blacklist nouveau" >> "${pkgdir}/etc/modprobe.d/nouveau_blacklist-nvidia-rt.conf"
    sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia.install"
    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
}
