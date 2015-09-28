# Maintainer : Kaan Genç <aur@kaangenc.me>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-grsec
pkgver=355.11
_extramodules=extramodules-4.1.7-grsec
pkgrel=1
pkgdesc="NVIDIA drivers for linux-grsec kernel"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('libgl' "nvidia-utils=${pkgver}" 'linux-grsec>=4.1.7' 'linux-grsec<4.2')
makedepends=('nvidia-libgl' "nvidia-utils=${pkgver}" 'linux-grsec' 'linux-grsec-headers>=4.1.7' 'linux-grsec-headers<4.2')
license=('custom')
install=nvidia-grsec.install
options=(!strip)
source=('nvidia-drivers-pax-usercopy.patch'
         'nvidia-drivers-pax-constify.patch'
         'nv-drm.patch')
md5sums=('2d3de69362039a4ff10b68dadebc49ca'
         'cea9a028cb816b5495759cfad2d981b6'
         '72cdf32a6d35729a12c6c23a7e91e972')
md5sums_i686=('16d143ccafe99328a2ca8e5a396fd4bc')
md5sums_x86_64=('30133d89690f4683c4e289ec6c0247dc')
source_i686="ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
source_x86_64="ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
md5sums_i686='16d143ccafe99328a2ca8e5a396fd4bc'
md5sums_x86_64='30133d89690f4683c4e289ec6c0247dc'

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
}

package() {
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
            "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"

    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-grsec.conf"
}
