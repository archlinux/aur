# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-390xx-ck
pkgver=390.116
pkgrel=1
_extramodules=extramodules-ck
_pkgdesc="NVIDIA drivers for linux-ck, 390xx legacy branch."
pkgdesc="$_pkgdesc"
arch=('x86_64')
url="http://www.nvidia.com/"
makedepends=("nvidia-390xx-utils=${pkgver}" 'libglvnd' 'linux-ck-headers>=4.20' 'linux-ck-headers<4.21')
depends=('linux-ck>=4.20' 'linux-ck<4.21' 'libglvnd' "nvidia-390xx-utils=${pkgver}")
conflicts=('nvidia-340xx-ck' 'nvidia-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
options=('!strip')
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
kernel-4.16.patch)
sha256sums=('de85a2eea39ca16e25645b345259b01fbe858b833286b7e6785afa273009ef6f'
            '622ac792ec200b2239cb663c0010392118b78c9904973d82cd261165c16d6385')

_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

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
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-390xx-ck.conf"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

# vim:set ts=2 sw=2 et:
