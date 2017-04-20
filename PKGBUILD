# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Lawliet <yanzilme@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
 
pkgname=nvidia-340xx-lqx
pkgver=340.102
_extramodules=extramodules-4.10-lqx
pkgrel=3
_pkgdesc="NVIDIA 340xx drivers for linux-lqx."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lqx>=4.10' 'linux-lqx<4.11' "nvidia-340xx-libgl" "nvidia-340xx-utils=${pkgver}")
makedepends=('linux-lqx-headers>=4.10' 'linux-lqx-headers<4.11')
conflicts=('nvidia-lqx' 'nvidia-304xx-lqx')
license=('custom')
install=nvidia-340xx-lqx.install
options=(!strip)
source=('4.10.0_kernel.patch')
source_i686+=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha512sums=('88a2b448c1e8445dc43820328e86d8f20eb7e3cb5774e704cd44191a9fa26064264510c1adc9ea938fa2c92075496f3a27bd52ae6e6f4ec5fa6d4a829dd961e8')
sha512sums_i686=('bea700c925a6044fcded40324bb389c5fa1aadc40831f685a76e7b0ded11161f492960950c201467e564d157dcbe0c330d13a2014f51d0073002c5a262a6f0ca')
sha512sums_x86_64=('2a29e6418244ea384e4237d74057bd8e56247b1c503cf623dea34a3b1065d8783879aa7e6a802dd31f0a10cf81cfcab2a1b1a8269b97996f15fa1838c0a3a44b')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here

    patch -Np1 < "${srcdir}"/4.10.0_kernel.patch

    cp -a kernel kernel-dkms
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
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-340xx-lqx.conf"
}
