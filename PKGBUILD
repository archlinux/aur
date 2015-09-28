# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-340xx-ck
pkgver=340.93
_extramodules=extramodules-4.1-ck
pkgrel=1
pkgdesc="NVIDIA drivers for linux-ck, 340xx legacy branch."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=4.1' 'linux-ck<4.2' "nvidia-340xx-libgl" "nvidia-340xx-utils=${pkgver}")
makedepends=('linux-ck-headers>=4.1' 'linux-ck-headers<4.2')
conflicts=('nvidia-ck' 'nvidia-304xx-ck' 'nvidia-275xx-ck' 'nvidia-319-ck' 'nvidia-96xx-ck' 'nvidia-beta-ck' 'nvidia-ck-atom' 'nvidia-ck-barcelona' 'nvidia-ck-bulldozer' 'nvidia-ck-corex' 'nvidia-ck-core2' 'nvidia-ck-haswell' 'nvidia-ck-broadwell' 'nvidia-ck-ivybridge' 'nvidia-ck-kx' 'nvidia-ck-k10' 'nvidia-ck-nehalem' 'nvidia-ck-p4' 'nvidia-ck-piledriver' 'nvidia-ck-pentm' 'nvidia-ck-sandybridge' 'nvidia-304xx-ck-atom' 'nvidia-304xx-ck-barcelona' 'nvidia-304xx-ck-corex' 'nvidia-304xx-ck-core2' 'nvidia-304xx-ck-haswell' 'nvidia-304xx-ck-broadwell' 'nvidia-304xx-ck-ivybridge' 'nvidia-304xx-ck-kx' 'nvidia-304xx-ck-k10' 'nvidia-304xx-ck-nehalem' 'nvidia-304xx-ck-p4' 'nvidia-304xx-ck-piledriver' 'nvidia-304xx-ck-pentm' 'nvidia-304xx-ck-sandybridge' 'nvidia-340xx-ck-atom' 'nvidia-340xx-ck-barcelona' 'nvidia-340xx-ck-bulldozer' 'nvidia-340xx-ck-core2' 'nvidia-340xx-ck-haswell' 'nvidia-340xx-ck-broadwell' 'nvidia-340xx-ck-ivybridge' 'nvidia-340xx-ck-kx' 'nvidia-340xx-ck-k10' 'nvidia-340xx-ck-nehalem' 'nvidia-340xx-ck-p4' 'nvidia-340xx-ck-piledriver' 'nvidia-340xx-ck-pentm' 'nvidia-340xx-ck-sandybridge')
#groups=('ck-generic')
#replaces=()
license=('custom')
install=nvidia-340xx-ck.install
options=(!strip)
source=("nv-drm.patch")
#"nvidia-4.0.patch")
source_i686+=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums=('9515310b017ad4134f50e92b39cb437e3d18605d26aead1dda02599d41e6ee26')
sha256sums_i686=('4a81c158302c595e1e72b5a1812eb3c67c8cf584ca74b1bc24163dad5289d612')
sha256sums_x86_64=('8fb230a7579a15c778ab7c2f160830682919729235beb8ea2b84326528c54843')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
		patch -Np0 -i "$srcdir/nv-drm.patch"
#		patch -Np0 -i "$srcdir/nvidia-4.0.patch"
}

build() {
	_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
	cd "${_pkg}/kernel"
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module

	cd uvm
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
	install -Dm644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
		"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
	install -D -m644 "${srcdir}/${_pkg}/kernel/uvm/nvidia-uvm.ko" \
		"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
	gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
	install -dm755 "${pkgdir}/usr/lib/modprobe.d"
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-340xx-ck.conf"
}
