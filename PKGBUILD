# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: A.J. Korf <jacobkorf at gmail dot com>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-304xx-ck
pkgver=304.132
_extramodules=extramodules-4.8-ck
pkgrel=6
_pkgdesc="NVIDIA drivers for linux-ck, 304xx legacy branch."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=4.8' 'linux-ck<4.9' 'libgl' "nvidia-304xx-utils=${pkgver}")
makedepends=('linux-ck-headers>=4.8' 'linux-ck-headers<4.9' 'nvidia-304xx-libgl')
conflicts=('nvidia-340xx-ck' 'nvidia-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
install=readme.install
options=(!strip)
source=('disable-mtrr.patch')
source_i686+=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums=('cbaa0c4e4f30d993958c079a22e0346970f99d4fda9d12379777bb16ab3306c9')
sha256sums_i686=('d460f6ab63cc8c1f9fb89a344ad0f3ee1a90e7078b4edba78d86433e66bfd927')
sha256sums_x86_64=('3d7c18eef3044890536b50acab76977112ea5134425b75bba10af37091879ab8')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
	sh "${_pkg}.run" --extract-only
	cd "${_pkg}"

	# FS#47092
	(cd kernel; patch -p1 --no-backup-if-mismatch -i "$srcdir"/disable-mtrr.patch)
}

build() {
	_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
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
