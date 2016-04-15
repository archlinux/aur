# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com> PGP-Key: 78695CFD
# Contributor: shivik <> PGP-Key: 761E4.5C
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-304xx-lqx
pkgver=304.131
_extramodules=extramodules-4.5-lqx
pkgrel=4
pkgdesc="NVIDIA drivers for linux-lqx kernel, 304xx legacy branch"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lqx>=4.5' 'linux-lqx<4.6' "nvidia-304xx-utils=${pkgver}" "nvidia-304xx-libgl")
makedepends=('linux-lqx-headers>=4.5' 'linux-lqx-headers<4.6')
conflicts=('nvidia-lqx' 'nvidia-340xx-lqx')
license=('custom')
install=nvidia-304xx-lqx.install
options=(!strip)
source=('disable-mtrr.patch')
source_i686=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums=('c4becf1145a139cc0121be9ad340bcd8')
md5sums_i686=('9f3222fd7287d9b31f54f1d75760e183')
md5sums_x86_64=('24c9c6a8679edae3b2a608b191fdc727')

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
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-304xx-lqx.conf"
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia-304xx-lqx.install"
	gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

	# the license file is part of nvidia-304xx-utils - the module depends on it, so we don't ship it another time.
}
