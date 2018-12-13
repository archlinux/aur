# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-ck
pkgver=415.22
pkgrel=3
epoch=2
_extramodules=extramodules-ck
_pkgdesc="NVIDIA drivers for linux-ck."
pkgdesc="$_pkgdesc"
arch=('x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=4.19' 'linux-ck<4.20' 'libgl' "nvidia-utils=${pkgver}")
makedepends=("nvidia-utils=${pkgver}" 'libglvnd' 'linux-ck-headers>=4.19' 'linux-ck-headers<4.20')
conflicts=('nvidia-340xx-ck' 'nvidia-390xx-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-${pkgver}"
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run"
kernel-4.16.patch)
sha256sums=('22188f7e095b648554738638258107b89288b7902bdc3b4edaabbda615745b9b'
            '622ac792ec200b2239cb663c0010392118b78c9904973d82cd261165c16d6385')

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"

    # Restore phys_to_dma support (still needed for 396.18)
    # https://bugs.archlinux.org/task/58074
    patch -Np1 -i ../kernel-4.16.patch
}

build() {
	_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
	cd "${_pkg}"/kernel
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
  install -Dt "${pkgdir}/usr/lib/modules/${_extramodules}" -m644 \
    "${srcdir}/${_pkg}/kernel"/nvidia{,-modeset,-drm,-uvm}.ko

  find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

  echo "blacklist nouveau" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-ck.conf"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

# vim:set ts=2 sw=2 et:
