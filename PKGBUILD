# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Lawliet <yanzilme@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
 
pkgname=nvidia-uksm-ck
pkgver=352.21
_extramodules=extramodules-4.0-uksm-ck
pkgrel=2
_pkgdesc="NVIDIA drivers for linux-uksm-ck."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-uksm-ck>=4.0' 'linux-uksm-ck<4.1' "nvidia-libgl" "nvidia-utils=${pkgver}")
makedepends=('linux-uksm-ck-headers>=4.0' 'linux-uksm-ck-headers<4.1')
conflicts=('nvidia-uksm-ck-304xx' 'nvidia-uksm-ck-340xx')
license=('custom')
install=nvidia-uksm-ck.install
options=(!strip)
source_i686+=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums_i686=('c91760a04f658845722380f6c7fd4709')
md5sums_x86_64=('4eea308a1b04553f720f82fd2fac79d3')

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
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-uksm-ck.conf"
}
