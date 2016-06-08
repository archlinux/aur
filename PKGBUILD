# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com> PGP-Key: 78695CFD
# Contributor: shivik <> PGP-Key: 761E4.6C
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-304xx-lqx
pkgver=304.131
_extramodules=extramodules-4.6-lqx
pkgrel=5
pkgdesc="NVIDIA drivers for linux-lqx kernel, 304xx legacy branch"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lqx>=4.6' 'linux-lqx<4.7' "nvidia-304xx-utils=${pkgver}" "nvidia-304xx-libgl")
makedepends=('linux-lqx-headers>=4.6' 'linux-lqx-headers<4.7')
conflicts=('nvidia-lqx' 'nvidia-340xx-lqx')
license=('custom')
install=nvidia-304xx-lqx.install
options=(!strip)
source=('disable-mtrr.patch' 'linux-4.6.patch')
source_i686+=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha512sums=('54e8825e523f11706890e09e476498f3a30f75ce4e350ff2ff8a1e1c3af574d9ccfb8903543766b6863d94cdfbf46e68cd3d33380867dd976cafc8dd2dd78774'
            'a240e354fcc8ad69982206b4291dfe0fa3660b410d0ffa7903c4fcdb2397254293bfa3160874f89327cfca85d78385260072008091990bc6640ea047e55c53ab')
sha512sums_i686=('3e67c40648554dc49472081eee88ae982c3b235b3346e4d9e7fb5ae33ec5f10ed088da804ac7d8bd1565995df3861f12b3560030cd3a19339a2d35768b0a943e')
sha512sums_x86_64=('07e529e4e81c42b43861475029aa0f223f8f3d299be9ddfe820c583e26aae49223a9b0dfee6d66ab09c526554bb581e5f8cf755eda600cb9e0bdac7d5f4acb93')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    cd "${srcdir}"
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here

    # FS#47092
    (cd kernel; patch -p1 --no-backup-if-mismatch -i "$srcdir"/disable-mtrr.patch)

    patch -p1 --no-backup-if-mismatch -i ../linux-4.6.patch
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
