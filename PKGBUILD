# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-390xx-ck
pkgver=390.129
pkgrel=10
_pkgdesc="NVIDIA drivers for linux-ck, 390xx legacy branch."
pkgdesc="$_pkgdesc"
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=("nvidia-390xx-utils=${pkgver}" 'libglvnd' 'linux-ck-headers')
depends=('linux-ck' 'libglvnd' "nvidia-390xx-utils=${pkgver}")
conflicts=('nvidia-340xx-ck' 'nvidia-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
options=('!strip')
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
'kernel-4.16.patch')
sha256sums=('a7925a327cab828d1eb9e74f8943623c5dbc9a5e376a4c0184065d4a319696c1'
            '622ac792ec200b2239cb663c0010392118b78c9904973d82cd261165c16d6385')

_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

# default is 'linux' substitute custom name here
_kernelname=linux-ck
_kernver="$(</usr/src/$_kernelname/version)"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"

    # Restore phys_to_dma support (still needed for 396.18)
    # https://bugs.archlinux.org/task/58074
    patch -Np1 -i ../kernel-4.16.patch
}

build() {
  cd "${_pkg}"/kernel
  make SYSSRC="/usr/src/$_kernelname" module
}

package() {
  _extradir="/usr/lib/modules/$_kernver/extramodules"
  install -Dt "${pkgdir}${_extradir}" -m644 \
    "${srcdir}/${_pkg}/kernel"/nvidia{,-modeset,-drm,-uvm}.ko

  find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

  echo "blacklist nouveau" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-390xx-ck.conf"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

# vim:set ts=2 sw=2 et:
