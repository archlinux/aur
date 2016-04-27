# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Lawliet <yanzilme@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
 
pkgname=nvidia-bfq-304xx
pkgver=304.131
_extramodules=extramodules-4.5-bfq
pkgrel=4
_pkgdesc="NVIDIA 304xx drivers for linux-bfq."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-bfq>=4.5' 'linux-bfq<4.6' "nvidia-304xx-libgl" "nvidia-304xx-utils=${pkgver}")
makedepends=('linux-bfq-headers>=4.5' 'linux-bfq-headers<4.6')
conflicts=('nvidia-bfq' 'nvidia-bfq-340xx')
license=('custom')
install=nvidia-bfq-304xx.install
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
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-bfq-304xx.conf"
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia-bfq-304xx.install"
	gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

	# the license file is part of nvidia-304xx-utils - the module depends on it, so we don't ship it another time.
}
