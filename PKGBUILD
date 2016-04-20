# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-ck
pkgver=364.16
_extramodules=extramodules-4.4-ck
pkgrel=2
_pkgdesc="NVIDIA drivers for linux-ck."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=4.4' 'linux-ck<4.5' 'libgl' "nvidia-utils=${pkgver}")
makedepends=('linux-ck-headers>=4.4' 'linux-ck-headers<4.5' 'nvidia-libgl')
#makedepends=('linux-ck-headers>=4.3' 'linux-ck-headers<4.4' 'nvidia-libgl' "nvidia-utils=${pkgver}")
conflicts=('nvidia-340xx-ck' 'nvidia-304xx-ck' 'nvidia-275xx-ck' 'nvidia-319-ck' 'nvidia-96xx-ck' 'nvidia-beta-ck' 'nvidia-ck-atom' 'nvidia-ck-barcelona' 'nvidia-ck-bulldozer' 'nvidia-ck-corex' 'nvidia-ck-core2' 'nvidia-ck-broadwell' 'nvidia-ck-skylake' 'nvidia-ck-haswell' 'nvidia-ck-ivybridge' 'nvidia-ck-kx' 'nvidia-ck-k10' 'nvidia-ck-nehalem' 'nvidia-ck-p4' 'nvidia-ck-piledriver' 'nvidia-ck-pentm' 'nvidia-ck-sandybridge' 'nvidia-304xx-ck-atom' 'nvidia-304xx-ck-barcelona' 'nvidia-304xx-ck-corex' 'nvidia-304xx-ck-core2' 'nvidia-304xx-ck-haswell' 'nvidia-304xx-ck-broadwell' 'nvidia-304xx-ck-ivybridge' 'nvidia-304xx-ck-kx' 'nvidia-304xx-ck-k10' 'nvidia-304xx-ck-nehalem' 'nvidia-304xx-ck-p4' 'nvidia-304xx-ck-piledriver' 'nvidia-304xx-ck-pentm' 'nvidia-304xx-ck-sandybridge' 'nvidia-340xx-ck-atom' 'nvidia-340xx-ck-barcelona' 'nvidia-340xx-ck-bulldozer' 'nvidia-340xx-ck-core2' 'nvidia-340xx-ck-haswell' 'nvidia-340xx-ck-broadwell' 'nvidia-340xx-ck-ivybridge' 'nvidia-340xx-ck-kx' 'nvidia-340xx-ck-k10' 'nvidia-340xx-ck-nehalem' 'nvidia-340xx-ck-p4' 'nvidia-340xx-ck-piledriver' 'nvidia-340xx-ck-pentm' 'nvidia-340xx-ck-sandybridge' 'nvidia-340xx-ck-silvermont' 'nvidia-304xx-ck-silvermont' 'nvidia-304xx-ck-skylake' 'nvidia-340xx-ck-skylake')
#groups=('ck-generic')
#replaces=()
license=('custom')
install=nvidia-ck.install
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

	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-ck.conf"
}
