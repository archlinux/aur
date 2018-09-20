# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-390xx-ck
pkgver=390.77
pkgrel=10
_extramodules=extramodules-ck
_pkgdesc="NVIDIA drivers for linux-ck, 390xx legacy branch."
pkgdesc="$_pkgdesc"
arch=('x86_64')
url="http://www.nvidia.com/"
makedepends=("nvidia-390xx-utils=${pkgver}" 'libglvnd' 'linux-ck-headers>=4.18' 'linux-ck-headers<4.19')
depends=('linux-ck>=4.18' 'linux-ck<4.19' 'libglvnd' "nvidia-390xx-utils=${pkgver}")
conflicts=('nvidia-340xx-ck' 'nvidia-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
options=('!strip')
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
kernel-4.16.patch
unfuck.patch)
sha256sums=('6eb950dc4b59697d12d79a975b2c21a5e3cde49a12b61432d7e836110a06a6ea'
            '622ac792ec200b2239cb663c0010392118b78c9904973d82cd261165c16d6385'
            'fa726a12083bd7415d4f827652caf66030224c8e69925aa9f650766e58790080')

_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"

    # Restore phys_to_dma support (still needed for 396.18)
    # https://bugs.archlinux.org/task/58074
    patch -Np1 -i ../kernel-4.16.patch
    patch -Np1 -i ../unfuck.patch
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
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-390xx-ck.conf"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

# vim:set ts=2 sw=2 et:
