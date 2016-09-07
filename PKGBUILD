# Maintainer: graysky <graysky AT archlnux.us>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-340xx-ck
pkgver=340.96
_extramodules=extramodules-4.7-ck
pkgrel=14
pkgdesc="NVIDIA drivers for linux-ck, 340xx legacy branch."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=4.7' 'linux-ck<4.8' 'libgl' "nvidia-340xx-utils=${pkgver}")
makedepends=('linux-ck-headers>=4.7' 'linux-ck-headers<4.8' 'nvidia-340xx-libgl')
conflicts=('nvidia-ck' 'nvidia-304xx-ck' 'nvidia-275xx-ck' 'nvidia-319-ck' 'nvidia-96xx-ck' 'nvidia-beta-ck' 'nvidia-ck-atom' 'nvidia-ck-barcelona' 'nvidia-ck-bulldozer' 'nvidia-ck-corex' 'nvidia-ck-core2' 'nvidia-ck-haswell' 'nvidia-ck-broadwell' 'nvidia-ck-skylake' 'nvidia-ck-ivybridge' 'nvidia-ck-kx' 'nvidia-ck-k10' 'nvidia-ck-nehalem' 'nvidia-ck-p4' 'nvidia-ck-piledriver' 'nvidia-ck-pentm' 'nvidia-ck-sandybridge' 'nvidia-304xx-ck-atom' 'nvidia-304xx-ck-barcelona' 'nvidia-304xx-ck-corex' 'nvidia-304xx-ck-core2' 'nvidia-304xx-ck-haswell' 'nvidia-304xx-ck-broadwell' 'nvidia-304xx-ck-skylake' 'nvidia-304xx-ck-ivybridge' 'nvidia-304xx-ck-kx' 'nvidia-304xx-ck-k10' 'nvidia-304xx-ck-nehalem' 'nvidia-304xx-ck-p4' 'nvidia-304xx-ck-piledriver' 'nvidia-304xx-ck-pentm' 'nvidia-304xx-ck-sandybridge' 'nvidia-340xx-ck-atom' 'nvidia-340xx-ck-barcelona' 'nvidia-340xx-ck-bulldozer' 'nvidia-340xx-ck-core2' 'nvidia-340xx-ck-haswell' 'nvidia-340xx-ck-broadwell' 'nvidia-340xx-ck-skylake' 'nvidia-340xx-ck-ivybridge' 'nvidia-340xx-ck-kx' 'nvidia-340xx-ck-k10' 'nvidia-340xx-ck-nehalem' 'nvidia-340xx-ck-p4' 'nvidia-340xx-ck-piledriver' 'nvidia-340xx-ck-pentm' 'nvidia-340xx-ck-sandybridge')
#groups=('ck-generic')
#replaces=()
license=('custom')
install=nvidia-340xx-ck.install
options=(!strip)
source=('linux-4.6.patch')
source_i686+=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums=('1f2baa65fd351ae7a2fc3dfd71ffcbfe')
md5sums_i686=('cb64b165b638671bcdc75bcf297b8d90')
md5sums_x86_64=('7bdbcee13bade63227933d9217571882')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
		patch -p1 --no-backup-if-mismatch -i ../linux-4.6.patch
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
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-340xx-ck.conf"
}
