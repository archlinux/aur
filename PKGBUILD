# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-lts318-ck
pkgver=352.09
_extramodules=extramodules-3.18-lts318-ck
pkgrel=1
_pkgdesc="NVIDIA drivers for linux-ck."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lts318-ck>=3.17.0' 'linux-lts318-ck<3.19.0' "nvidia-libgl" "nvidia-utils=${pkgver}")
makedepends=('linux-lts318-ck-headers>=3.17.0' 'linux-lts318-ck-headers<3.19.0')
#groups=('ck-generic')
#replaces=()
license=('custom')
install=nvidia-lts318-ck.install
options=(!strip)
source_i686+=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums_i686=('0e009686400c522209eaa8ab835ff81f')
md5sums_x86_64=('eb5ad6a07dc03e0a19d5f6fa069c494b')
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

	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-lts318-ck.conf"
}
