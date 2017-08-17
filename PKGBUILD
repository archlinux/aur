# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Lawliet <yanzilme@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
 
pkgname=nvidia-304xx-lqx
pkgver=304.135
_extramodules=extramodules-4.12-lqx
pkgrel=4
_pkgdesc="NVIDIA 304xx drivers for linux-lqx."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lqx>=4.12' 'linux-lqx<4.13' "nvidia-304xx-libgl" "nvidia-304xx-utils=${pkgver}")
makedepends=('linux-lqx-headers>=4.12' 'linux-lqx-headers<4.13')
conflicts=('nvidia-lqx' 'nvidia-340xx-lqx')
license=('custom')
install=nvidia-304xx-lqx.install
options=(!strip)
source=('drm-driver-legacy.patch'
'kernel_4.10.patch'
'kernel_4.11.patch'
'kernel_4.12.patch')
source_i686+=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums=('f52406b17d2e0dc1c20a61b62bb734ee7f2a3b8f71d0608cbef35aa301654729'
            '7d35792528cade28232a2a0f582d36975c271de6fe99a6f3a4046b9637b9739a'
            '125995702eb2fd4ed43bc53e1f385ef4d47f14dc2da23a52061fb7b875ea9eaa'
            'c8256018c14b8e6e9287e426a0f6befddf75941c2bce0ff96823a3b314b5ccb0')
sha256sums_i686=('5cb0a191ddca7b4c72b3c26cd57b7d719878ce628d24b5b026a0e5c8d3a00d93')
sha256sums_x86_64=('352f4a4d5ef692b26383e2cf9ec866f6973f905d53eb6bc9f2161b6ba2afae5a')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
	sh "${_pkg}.run" --extract-only
	cd "${_pkg}"

  # patches here
  patch -Np1 --no-backup-if-mismatch -i ../kernel_4.10.patch
  patch -Np1 --no-backup-if-mismatch -i ../kernel_4.11.patch
  patch -Np1 --no-backup-if-mismatch -i ../kernel_4.12.patch

  # FS#47092
  (cd kernel; patch -p1 --no-backup-if-mismatch -i "$srcdir"/drm-driver-legacy.patch)
}

build() {
	_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
	cd ${_pkg}/kernel
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
	install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
		"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
	install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-304xx-lqx.conf"
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia-304xx-lqx.install"
	gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

	# the license file is part of nvidia-304xx-utils - the module depends on it, so we don't ship it another time.
}
