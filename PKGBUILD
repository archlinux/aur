# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: A.J. Korf <jacobkorf at gmail dot com>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-304xx-ck
pkgver=304.135
_extramodules=extramodules-4.9-ck
pkgrel=1
_pkgdesc="NVIDIA drivers for linux-ck, 304xx legacy branch."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=4.9' 'linux-ck<4.10' 'libgl' "nvidia-304xx-utils=${pkgver}")
makedepends=('linux-ck-headers>=4.9' 'linux-ck-headers<4.10' 'nvidia-304xx-libgl')
conflicts=('nvidia-340xx-ck' 'nvidia-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
install=readme.install
options=(!strip)
source=('unfuck_kernel_4.9_series.patch')
source_i686+=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums=('c2e697e56ac1bf418052a24c16c77d5149474b661227c494ce9949d050c2d9c5')
sha256sums_i686=('5cb0a191ddca7b4c72b3c26cd57b7d719878ce628d24b5b026a0e5c8d3a00d93')
sha256sums_x86_64=('352f4a4d5ef692b26383e2cf9ec866f6973f905d53eb6bc9f2161b6ba2afae5a')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
	sh "${_pkg}.run" --extract-only
	cd "${_pkg}"
  
  # FS#52734
  patch -Np1 -i "$srcdir/unfuck_kernel_4.9_series.patch"
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
