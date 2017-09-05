# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-ck
pkgver=384.69
pkgrel=4
epoch=1
_extramodules=extramodules-4.12-ck
_pkgdesc="NVIDIA drivers for linux-ck."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=4.12' 'linux-ck<4.13' 'libgl' "nvidia-utils=${pkgver}")
makedepends=('linux-ck-headers>=4.12' 'linux-ck-headers<4.13' 'nvidia-libgl')
conflicts=('nvidia-340xx-ck' 'nvidia-304xx-ck')
#groups=('ck-generic')
#replaces=()
license=('custom')
install=readme.install
options=(!strip)
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums_i686=('3b70587582220ab1102bcb8386f206f89e6b146856af41f16eaa5910e54ef8fd')
sha256sums_x86_64=('1011b9a9db903d243ff722fc7982da7b91dc91f4b82c60227d89b812aa67257f')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
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

# vim:set ts=2 sw=2 et:
