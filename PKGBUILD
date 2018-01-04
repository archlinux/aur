# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: A.J. Korf <jacobkorf at gmail dot com>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-304xx-ck
pkgver=304.137
_extramodules=extramodules-4.14-ck
pkgrel=14
_pkgdesc="NVIDIA drivers for linux-ck, 304xx legacy branch."
pkgdesc="$_pkgdesc"
arch=('x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=4.14' 'linux-ck<4.15' "nvidia-304xx-utils=${pkgver}" 'libgl')
makedepends=('linux-ck-headers>=4.14' 'linux-ck-headers<4.15' 'nvidia-304xx-libgl')
conflicts=('nvidia-340xx-ck' 'nvidia-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
options=(!strip)
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
  'kernel-4.14.patch'
)
sha256sums=('cd774539c322fca8328d382389a40f5aaece4c4bc562fac400f45af6ba7b78b1'
            'dd9d17fbb29371ebb51d64ac2f5ec58fde2fce919fb49d95038cde064567c5d7')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
  sh "${_pkg}.run" --extract-only
	cd "${_pkg}"
  patch -Np1 < "${srcdir}/kernel-4.14.patch"
}

build() {
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  cd "${_pkg}"/kernel
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
  install -Dt "${pkgdir}/usr/lib/modules/${_extramodules}" -m644 \
    "${srcdir}/${_pkg}/kernel"/nvidia.ko

  find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

  echo "blacklist nouveau" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-ck.conf"
}
