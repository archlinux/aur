# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com> PGP-Key: 78695CFD
# Contributor: shivik <> PGP-Key: 761E4.4C
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-lqx
pkgver=364.16
_extramodules=extramodules-4.4-lqx
pkgrel=1
pkgdesc="NVIDIA drivers for linux-lqx"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lqx>=4.4' 'linux-lqx<4.5' "nvidia-libgl" "nvidia-utils=${pkgver}")
makedepends=('linux-lqx-headers>=4.4' 'linux-lqx-headers<4.5')
conflicts=('nvidia-304xx-lqx' 'nvidia-340xx-lqx')
license=('custom')
install=nvidia-lqx.install
options=(!strip)
# See nvidia-utils
# source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
# source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}.run")
source_i686=("NVIDIA-Linux-x86-${pkgver}.run::https://developer.nvidia.com/linux32bit")
source_x86_64=("NVIDIA-Linux-x86_64-${pkgver}.run::https://developer.nvidia.com/linux64bit")
sha256sums_i686=('94ba58dcacf18ea08ae588c993af1075271fe43940ea7d555314896acb889b43')
sha256sums_x86_64=('97b8067f072f945d032caa6fff938ac2a8c84481e82080b9c4a8e161a7d84c40')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here
}

build() {
	_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
	cd "${_pkg}/kernel"
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
	install -Dm644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
		"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
        install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-modeset.ko" \
                "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-modeset.ko"
        install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-drm.ko" \
		"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-drm.ko"
        


	if [[ "$CARCH" = "x86_64" ]]; then
		install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
			"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
	fi

	gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
	install -dm755 "${pkgdir}/usr/lib/modprobe.d"
        echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-lqx.conf"
}
