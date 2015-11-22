# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Lawliet <yanzilme@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
 
pkgname=nvidia-bfq
pkgver=358.16
_extramodules=extramodules-4.3-bfq
pkgrel=1
_pkgdesc="NVIDIA drivers for linux-bfq."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-bfq>=4.3' 'linux-bfq<4.4' "nvidia-libgl" "nvidia-utils=${pkgver}")
makedepends=('linux-bfq-headers>=4.3' 'linux-bfq-headers<4.4')
conflicts=('nvidia-bfq-304xx' 'nvidia-bfq-340xx')
license=('custom')
install=nvidia-bfq.install
options=(!strip)
source_i686=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums_i686=('5dfe11ca13548ca4813b10f3223d6014')
md5sums_x86_64=('efb1e649c0e0d62e92774bbf2c124488')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

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

	if [[ "$CARCH" = "x86_64" ]]; then
		install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
			"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
	fi

	gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
	install -dm755 "${pkgdir}/usr/lib/modprobe.d"
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-bfq.conf"
}
