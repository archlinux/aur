# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-390xx-ck
pkgver=390.87
pkgrel=9
_extramodules=extramodules-ck
_pkgdesc="NVIDIA drivers for linux-ck, 390xx legacy branch."
pkgdesc="$_pkgdesc"
arch=('x86_64')
url="http://www.nvidia.com/"
makedepends=("nvidia-390xx-utils=${pkgver}" 'libglvnd' 'linux-ck-headers>=4.19' 'linux-ck-headers<4.20')
depends=('linux-ck>=4.19' 'linux-ck<4.20' 'libglvnd' "nvidia-390xx-utils=${pkgver}")
conflicts=('nvidia-340xx-ck' 'nvidia-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
options=('!strip')
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
kernel-4.16.patch kernel-4.19.patch unfuck.patch)
sha256sums=('c7c07151e17f610af11f7870560d96c3a3ee9bb91ba1bb82fcc7b5d473d40b66'
            '622ac792ec200b2239cb663c0010392118b78c9904973d82cd261165c16d6385'
            'e425320bd3712cc789035d5936412724b0b410f50463980c0a48715fd3f8c431'
            'fa726a12083bd7415d4f827652caf66030224c8e69925aa9f650766e58790080')

_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"

    # Restore phys_to_dma support (still needed for 396.18)
    # https://bugs.archlinux.org/task/58074
    patch -Np1 -i ../kernel-4.16.patch

    # Ad-hoc patch
    patch -Np1 -i ../kernel-4.19.patch
    
    # https://bugs.archlinux.org/task/59199
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
