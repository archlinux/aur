# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Lawliet <yanzilme@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
 
pkgname=nvidia-lqx
pkgver=367.35
_extramodules=extramodules-4.7-lqx
pkgrel=2
_pkgdesc="NVIDIA drivers for linux-lqx."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lqx>=4.7' 'linux-lqx<4.8' "nvidia-libgl" "nvidia-utils=${pkgver}")
makedepends=('linux-lqx-headers>=4.7' 'linux-lqx-headers<4.8')
conflicts=('nvidia-304xx-lqx' 'nvidia-340xx-lqx')
license=('custom')
install=nvidia-lqx.install
options=(!strip)
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
"0001-linux-4.7-i686.patch")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
"0001-linux-4.7-x86_64.patch")
sha256sums_i686=('38cb22fa85ef74ea960d3e5d644838cd961984ffc32bb0d052414cc7fa32e315'
                 'ca820f1cb77b377ca92f0298873ba04819fa9d33215392870ce159b39e639b37')
sha256sums_x86_64=('8a6c554e9315e31e09d73fd60223ee4fbbe5507cd04c2e041c868a2080439354'
                   '786dc522c4fe626acb30fac262bc7c2bc6580fd086d9985aa169399db4c6dfc1')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
		patch -Np1 -d kernel < ../0001-linux-4.7-${CARCH}.patch
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
