# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Lawliet <yanzilme@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
 
pkgname=nvidia-uksm-304xx
pkgver=304.125
_extramodules=extramodules-4.0-uksm
pkgrel=7
_pkgdesc="NVIDIA 304xx drivers for linux-uksm."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-uksm>=4.0' 'linux-uksm<4.1' "nvidia-304xx-libgl" "nvidia-304xx-utils=${pkgver}")
makedepends=('linux-uksm-headers>=4.0' 'linux-uksm-headers<4.1')
license=('custom')
install=nvidia-uksm-304xx.install
options=(!strip)
source=('nv-drm.patch' 
        'nvidia-3.19.patch'
        'nvidia-4.0.patch')
source_i686=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums=('2365f1405f0c7bbb8f8cd7ebd5e4e301'
         'd14e651d20054d18e0360c157ae60ae4'
         'f42bdf589f52d4e6c38baa5bef15eef8')
md5sums_i686=('bc3b0ac291fa998d5109a6f7e94fb2d4')
md5sums_x86_64=('291d41ccdbcc08f752a38f9e0a7eeea0')


[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
	sh "${_pkg}.run" --extract-only
	cd "${_pkg}"
	patch -p0 -i "$srcdir/nv-drm.patch"
	patch -p1 -i "$srcdir/nvidia-3.19.patch"
        patch -p1 -i "$srcdir/nvidia-4.0.patch"
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
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-uksm-304xx.conf"
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia-uksm-304xx.install"
	gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

	# the license file is part of nvidia-304xx-utils - the module depends on it, so we don't ship it another time.
}