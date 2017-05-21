# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Lawliet <yanzilme@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
 
pkgname=nvidia-bfq-340xx
pkgver=340.102
_extramodules=extramodules-4.11-bfq
pkgrel=4
_pkgdesc="NVIDIA 340xx drivers for linux-bfq."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-bfq>=4.11' 'linux-bfq<4.12' "nvidia-340xx-libgl" "nvidia-340xx-utils=${pkgver}")
makedepends=('linux-bfq-headers>=4.11' 'linux-bfq-headers<4.12')
conflicts=('nvidia-bfq' 'nvidia-bfq-304xx')
license=('custom')
install=nvidia-bfq-340xx.install
options=(!strip)
source=('4.10.0_kernel.patch'
'fs52243.patch'
'unfuck_4.11_for_340xx.patch')
source_i686+=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums=('b47c308d486dd777617d4195fa928091b677e4fca421b487328fab9932bc6222'
            'd1741377218e512063434c52a62a4fe3cfb23ab0a0ebc9fc817567692541e73e'
            '72641410ba81af1dfbc8397434dc68a43a9f6ce9ac1b9dfe2beeacb6cbdc98bb')
sha256sums_i686=('61b13d5dae0f6f5d788a4d8c4c98e8d971d19cb90b606058060d007946248828')
sha256sums_x86_64=('6a36bd9a0033769ecd11ce2aa60aeb41b50b20616c43fd19c55e027c451f585e')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"
  
  # patches here
  patch -Np1 -i "${srcdir}"/unfuck_4.11_for_340xx.patch
  patch -Np0 < "${srcdir}"/fs52243.patch
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
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-bfq-340xx.conf"
}
