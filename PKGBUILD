# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos
# Contributor: Christopher Snowhill <kode54 at gmail dot com>
# Contributor: ipha <ipha00 at gmail dot com>
# Contributor: johnnybash <georgpfahler at wachenzell dot org>
# Contributor: grmat <grmat at sub dot red>

prefix='amdgpu-pro-'
postfix='-ubuntu-20.04'
major='21.10'
minor='1247438'
amdver='2.4.100'
shared="opt/amdgpu-pro/lib/x86_64-linux-gnu"
shared2="opt/amdgpu/lib/x86_64-linux-gnu"
tarname="${prefix}${major}-${minor}${postfix}"

pkgname=opencl-amd
pkgdesc="OpenCL userspace driver as provided in the amdgpu-pro driver stack. This package is intended to work along with the free amdgpu stack."
pkgver=${major}.${minor}
pkgrel=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl')
conflicts=('rocm-opencl-runtime')
provides=('opencl-driver')
optdepends=('clinfo')

DLAGENTS='https::/usr/bin/wget --referer https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-21-10 -N %u'

source=("https://drivers.amd.com/drivers/linux/$tarname.tar.xz")
sha256sums=('2d63e6709909559b35f0d37504bd194b8a5cba8069b80aa849ec085d05bba1e2')

package() {
	mkdir -p "${srcdir}/opencl"
	cd "${srcdir}/opencl"

	# roc*
	ar x "${srcdir}/$tarname/opencl-rocr-amdgpu-pro_${major}-${minor}_amd64.deb"
	tar xJf data.tar.xz
	ar x "${srcdir}/$tarname/rocm-device-libs-amdgpu-pro_1.0.0-${minor}_amd64.deb"
	tar xJf data.tar.xz
	ar x "${srcdir}/$tarname/hsa-runtime-rocr-amdgpu_1.3.0-${minor}_amd64.deb"
	tar xJf data.tar.xz
	ar x "${srcdir}/$tarname/hsakmt-roct-amdgpu_1.0.9-${minor}_amd64.deb"
	tar xJf data.tar.xz
	ar x "${srcdir}/$tarname/hip-rocr-amdgpu-pro_${major}-${minor}_amd64.deb"
	tar xJf data.tar.xz

	# comgr
	ar x "${srcdir}/$tarname/comgr-amdgpu-pro_2.0.0-${minor}_amd64.deb"
	tar xJf data.tar.xz

	# orca
	ar x "${srcdir}/$tarname/opencl-orca-amdgpu-pro-icd_${major}-${minor}_amd64.deb"
	tar xJf data.tar.xz

	cd ${shared}
	sed -i "s|libdrm_amdgpu|libdrm_amdgpo|g" libamdocl-orca64.so

	mkdir -p "${srcdir}/libdrm"
	cd "${srcdir}/libdrm"
	ar x "${srcdir}/$tarname/libdrm-amdgpu-amdgpu1_${amdver}-${minor}_amd64.deb"
	tar xJf data.tar.xz
	cd ${shared2}
	rm "libdrm_amdgpu.so.1"
	mv "libdrm_amdgpu.so.1.0.0" "libdrm_amdgpo.so.1.0.0"
	ln -s "libdrm_amdgpo.so.1.0.0" "libdrm_amdgpo.so.1"

	mv "${srcdir}/opencl/etc" "${pkgdir}/"
	mkdir -p ${pkgdir}/usr/lib
	# roc*
	mv "${srcdir}/opencl/${shared}/libamdocl64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/opencl/${shared}/libamd_comgr.so.2.0.0" "${pkgdir}/usr/lib"
	mv "${srcdir}/opencl/${shared}/libamdhip64.so.4.0.21154-" "${pkgdir}/usr/lib"
	mv "${srcdir}/opencl/${shared}/libamdhip64.so" "${pkgdir}/usr/lib"
	mv "${srcdir}/opencl/${shared}/libamdhip64.so.4" "${pkgdir}/usr/lib"	
	mv "${srcdir}/opencl/${shared}/libhsa-runtime64.so.1.3.0" "${pkgdir}/usr/lib"
	mv "${srcdir}/opencl/${shared}/libhsa-runtime64.so.1" "${pkgdir}/usr/lib"
	mv "${srcdir}/opencl/${shared2}/libhsakmt.so.1.0.6" "${pkgdir}/usr/lib"
	mv "${srcdir}/opencl/${shared2}/libhsakmt.so.1" "${pkgdir}/usr/lib"
	
	# comgr
	cd ${srcdir}/opencl/${shared}	
	ln -s "libamd_comgr.so.2.0.0" "libamd_comgr.so"
	mv "${srcdir}/opencl/${shared}/libamd_comgr.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/opencl/${shared}/libamd_comgr.so.2" "${pkgdir}/usr/lib/libamd_comgr.so"

	# orca
	mv "${srcdir}/opencl/${shared}/libamdocl-orca64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/opencl/${shared}/libamdocl12cl64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/libdrm/${shared2}/libdrm_amdgpo.so.1.0.0" "${pkgdir}/usr/lib/"
	mv "${srcdir}/libdrm/${shared2}/libdrm_amdgpo.so.1" "${pkgdir}/usr/lib/"

	mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
	cd "${pkgdir}/opt/amdgpu/share/libdrm"
	ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids

	mv "${srcdir}/opencl/opt/amdgpu-pro" "${pkgdir}/opt"

	rm -r "${srcdir}/opencl"
	rm -r "${srcdir}/libdrm"
}
