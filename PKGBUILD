# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-ck
pkgver=390.42
pkgrel=1
epoch=1
_extramodules=extramodules-4.15-ck
_pkgdesc="NVIDIA drivers for linux-ck."
pkgdesc="$_pkgdesc"
arch=('x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=4.15' 'linux-ck<4.16' 'libgl' "nvidia-utils=${pkgver}")
makedepends=('linux-ck-headers>=4.15' 'linux-ck-headers<4.16' 'nvidia-libgl')
conflicts=('nvidia-340xx-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
options=('!strip')
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
        4.15-FS57305.patch)
sha256sums=('5f242cf0f7f4dcc45759eee3b4973191114842fe7c146c5ae7a12a2ebea394aa'
            '145d436f117455a1a8315b31dc2c9fce3c90c135d8c530b8b8da0e70548f48d9')

_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"

    patch -Np2 -i "${srcdir}"/4.15-FS57305.patch
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
