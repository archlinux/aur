# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: A.J. Korf <jacobkorf at gmail dot com>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-304xx-ck
pkgver=304.137
_extramodules=extramodules-4.13-ck
pkgrel=3
_pkgdesc="NVIDIA drivers for linux-ck, 304xx legacy branch."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=4.13' 'linux-ck<4.14' 'libgl' "nvidia-304xx-utils=${pkgver}")
makedepends=('linux-ck-headers>=4.13' 'linux-ck-headers<4.14' 'nvidia-304xx-libgl')
conflicts=('nvidia-340xx-ck' 'nvidia-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
install=readme.install
options=(!strip)
source_i686+=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums_i686=('ca98379fc2090bdfe8b74113d6ac7bcc7eadbd86a489c3c4ec4cd5ba9f6064f8')
sha256sums_x86_64=('cd774539c322fca8328d382389a40f5aaece4c4bc562fac400f45af6ba7b78b1')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

build() {
	_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  sh "${_pkg}.run" --extract-only
	cd ${_pkg}/kernel
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
	install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
		"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
	install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-304xx-ck.conf"
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/readme.install"
	gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

	# the license file is part of nvidia-304xx-utils - the module depends on it, so we don't ship it another time.
}
