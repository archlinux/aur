# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-ck
pkgver=430.14
pkgrel=3
epoch=2
_extramodules=extramodules-ck
_pkgdesc="NVIDIA drivers for linux-ck."
pkgdesc="$_pkgdesc"
arch=('x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck' 'libgl' "nvidia-utils=${pkgver}")
makedepends=("nvidia-utils=${pkgver}" 'libglvnd' 'linux-ck-headers')
conflicts=('nvidia-340xx-ck' 'nvidia-390xx-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-${pkgver}"
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run"
        fs62142.patch)
sha256sums=('00d46ffaf3e1e430081ddbd68b74cc361cd1328e8944224dfe69630dd8540f17'
            '24a3082688ee4d60d27f601d535b1e6ced7537b46cc83fc9bb6da0f76e07e017')

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"

    # Fix https://bugs.archlinux.org/task/62142
    patch -Np1 -i ../fs62142.patch
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
