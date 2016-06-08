# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com> PGP-Key: 78695CFD
# Contributor: shivik <> PGP-Key: 761E4.6C
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-lqx
pkgver=364.19
_extramodules=extramodules-4.6-lqx
pkgrel=2
pkgdesc="NVIDIA drivers for linux-lqx"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lqx>=4.6' 'linux-lqx<4.7' "nvidia-libgl" "nvidia-utils=${pkgver}")
makedepends=('linux-lqx-headers>=4.6' 'linux-lqx-headers<4.7')
conflicts=('nvidia-304xx-lqx' 'nvidia-340xx-lqx')
license=('custom')
install=nvidia-lqx.install
options=(!strip)
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
source=('linux-4.6.patch')
md5sums_i686=('8a4015213c4a8f1c80e9520d04a32a7b')
md5sums_x86_64=('ad7a0b1855b3913390fb75b4cc3a26dc')
md5sums=('3064bd437b26adac246f301f54f2814c')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here
    patch -p1 --no-backup-if-mismatch -i ../linux-4.6.patch
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
