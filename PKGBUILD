# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Lawliet <yanzilme@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
 
pkgname=nvidia-340xx-lqx
pkgver=340.102
_extramodules=extramodules-4.12-lqx
pkgrel=4
_pkgdesc="NVIDIA 340xx drivers for linux-lqx."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lqx>=4.12' 'linux-lqx<4.13' "nvidia-340xx-libgl" "nvidia-340xx-utils=${pkgver}")
makedepends=('linux-lqx-headers>=4.12' 'linux-lqx-headers<4.13')
conflicts=('nvidia-lqx' 'nvidia-304xx-lqx')
license=('custom')
install=nvidia-340xx-lqx.install
options=(!strip)
source=('fs52243.patch' '4.10.0_kernel.patch' '4.11.0_kernel.patch' '4.12.0_kernel.patch')
source_i686+=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums=('d1741377218e512063434c52a62a4fe3cfb23ab0a0ebc9fc817567692541e73e'
            'b47c308d486dd777617d4195fa928091b677e4fca421b487328fab9932bc6222'
            '72641410ba81af1dfbc8397434dc68a43a9f6ce9ac1b9dfe2beeacb6cbdc98bb'
            '210b7dc26b4f86933d96ab4da6e73d055dfcaa9e1f80eba8f3feb8f6d5ec7750')
sha256sums_i686=('61b13d5dae0f6f5d788a4d8c4c98e8d971d19cb90b606058060d007946248828')
sha256sums_x86_64=('6a36bd9a0033769ecd11ce2aa60aeb41b50b20616c43fd19c55e027c451f585e')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"
  
  # patches here
  patch -Np0 < "${srcdir}"/fs52243.patch
  patch -Np1 < "${srcdir}"/4.10.0_kernel.patch
  patch -Np1 < "${srcdir}"/4.11.0_kernel.patch
  patch -Np1 < "${srcdir}"/4.12.0_kernel.patch

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
