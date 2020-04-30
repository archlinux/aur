# Maintainer: Christopher Snowhill <kode54 at gmail dot com>
# Contributor: ipha <ipha00 at gmail dot com>
# Contributor: johnnybash <georgpfahler at wachenzell dot org>
# Contributor: grmat <grmat at sub dot red>

pkgname=opencl-amd
pkgdesc="OpenCL userspace driver as provided in the amdgpu-pro driver stack. This package is intended to work along with the free amdgpu stack."
pkgver=20.10.1048554
pkgrel=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs')
conflicts=('amdgpocl' 'opencl-amdgpu-pro-orca' 'opencl-amdgpu-pro-comgr' 'opencl-amdgpu-pro-pal' 'rocm-opencl-runtime')
provides=('opencl-driver' "opencl-amdgpu-pro-orca=${pkgver}" "opencl-amdgpu-pro-pal=${pkgver}" "opencl-amdgpu-pro-comgr=${pkgver}") # this package provides both drivers, and installs them in a different location

DLAGENTS='https::/usr/bin/wget --referer https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-20-10 -N %u'

prefix='amdgpu-pro-'
postfix='-ubuntu-18.04'
major='20.10'
minor='1048554'
amdver='2.4.100'
shared="opt/amdgpu-pro/lib/x86_64-linux-gnu"

source=("https://drivers.amd.com/drivers/linux/${prefix}${major}-${minor}${postfix}.tar.xz")
sha256sums=('7cbd666f9dd3e25a7bd8332a2693cabae2c9b05afe00d286ef7120f38d0335f4')

pkgver() {
	echo "${major}.${minor}"
}

package() {
	mkdir -p "${srcdir}/opencl"
	cd "${srcdir}/opencl"
	# pal
	ar x "${srcdir}/${prefix}${major}-${minor}${postfix}/opencl-amdgpu-pro-icd_${major}-${minor}_amd64.deb"
	tar xJf data.tar.xz
	ar x "${srcdir}/${prefix}${major}-${minor}${postfix}/opencl-amdgpu-pro-comgr_${major}-${minor}_amd64.deb"
	tar xJf data.tar.xz
	# orca
	ar x "${srcdir}/${prefix}${major}-${minor}${postfix}/opencl-orca-amdgpu-pro-icd_${major}-${minor}_amd64.deb"
	tar xJf data.tar.xz
	cd ${shared}
	sed -i "s|libdrm_amdgpu|libdrm_amdgpo|g" libamdocl-orca64.so

	mkdir -p "${srcdir}/libdrm"
	cd "${srcdir}/libdrm"
	ar x "${srcdir}/${prefix}${major}-${minor}${postfix}/libdrm-amdgpu-amdgpu1_${amdver}-${minor}_amd64.deb"
	tar xJf data.tar.xz
	cd ${shared/amdgpu-pro/amdgpu}
	rm "libdrm_amdgpu.so.1"
	mv "libdrm_amdgpu.so.1.0.0" "libdrm_amdgpo.so.1.0.0"
	ln -s "libdrm_amdgpo.so.1.0.0" "libdrm_amdgpo.so.1"

	mv "${srcdir}/opencl/etc" "${pkgdir}/"
	mkdir -p ${pkgdir}/usr/lib
	# pal
	mv "${srcdir}/opencl/${shared}/libamdocl64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/opencl/${shared}/libamd_comgr.so" "${pkgdir}/usr/lib/"
	# orca
	mv "${srcdir}/opencl/${shared}/libamdocl-orca64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/opencl/${shared}/libamdocl12cl64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/libdrm/${shared/amdgpu-pro/amdgpu}/libdrm_amdgpo.so.1.0.0" "${pkgdir}/usr/lib/"
	mv "${srcdir}/libdrm/${shared/amdgpu-pro/amdgpu}/libdrm_amdgpo.so.1" "${pkgdir}/usr/lib/"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids

	rm -r "${srcdir}/opencl"
	rm -r "${srcdir}/libdrm"
}
