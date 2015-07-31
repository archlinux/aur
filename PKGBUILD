# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>

pkgname=nvidia-bridge-pl
pkgver=352.30
_extramodules=extramodules-4.0-bridge-pl
pkgrel=1
_pkgdesc="NVIDIA drivers for linux-bridge-pl."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-bridge-pl>=4.0' 'linux-bridge-pl<4.1' "nvidia-libgl" "nvidia-utils=${pkgver}")
makedepends=('linux-bridge-pl-headers>=4.0' 'linux-bridge-pl-headers<4.1')
conflicts=('nvidia-bridge-pl-304xx' 'nvidia-bridge-pl-340xx')
license=('custom')
install=nvidia-bridge-pl.install
options=(!strip)
source_i686+=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums_i686=('7e59d84eafe2482b2f02df692b9168d5')
md5sums_x86_64=('135dd90db609cecad8e74bde0054cf6f')

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

	if [[ "$CARCH" = "x86_64" ]]; then
		cd uvm
		make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
	fi
}

package() {
	install -Dm644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
		"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
	
    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "${srcdir}/${_pkg}/kernel/uvm/nvidia-uvm.ko" \
            "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

	gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
	install -dm755 "${pkgdir}/usr/lib/modprobe.d"
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-bridge-pl.conf"
}
