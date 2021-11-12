# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-21-40-1'
major='21.40.1'
minor='1337803'
amdgpu_repo='https://repo.radeon.com/amdgpu/21.40.1/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/4.5.1'
rocm_opencl='opt/rocm-4.5.1/opencl/lib'
rocm_lib='opt/rocm-4.5.1/lib'
hip_dir='opt/rocm-4.5.1/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd
pkgdesc="OpenCL userspace driver as provided in the amdgpu-pro driver stack. This package is intended to work along with the free amdgpu stack."
pkgver=${major}.${minor}
pkgrel=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl' 'ncurses5-compat-libs')
conflicts=('rocm-opencl-runtime')
provides=('opencl-driver')
optdepends=('clinfo')

source=(
"https://repo.radeon.com/amdgpu/21.40.1/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.107.40501-1337803_amd64.deb"
"https://repo.radeon.com/amdgpu/21.40.1/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_21.40.1-1337803_amd64.deb"
"https://repo.radeon.com/amdgpu/21.40.1/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_21.40.1-1337803_amd64.deb"
"https://repo.radeon.com/amdgpu/21.40.1/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_21.40.1-1337803_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.1/pool/main/c/comgr/comgr_2.1.0.40501-84_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.1/pool/main/h/hip-runtime-amd/hip-runtime-amd_4.4.21432.40501-84_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.1/pool/main/h/hsa-rocr/hsa-rocr_1.4.0.40501-84_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.1/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20210902.7.5.40501-84_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.1/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.40501-84_amd64.deb"
)

sha256sums=(
'01ef82f12be4b853e0aab08fa9fc4b26bfca25a583c820b6c6d790c5e1102660'
'1c67035a1f5865f099d8aac44b2e20b7ebed2bb0e6db03f94acc5d37f68a6ed5'
'815a44c3cad30bff7355a4dcddecd3fe24ef02243866d21dec5cd4bebc734956'
'881da19cc97fdc13226a9da5817a73e320fd50df84cd680be1e162924bdd58fa'
'0440aa35f2dcadb047cfc31a866669c1b653a168d28156ca1fc138af11c9c280'
'ed47ae915c981a51918f080e4e1555b25c2aa069ff79428935455460f7b05f4f'
'110072723e3a7207e9093a1b33c0e3f462a2bf15c3d154ffb75b21c6e460daba'
'1d36b905378947062a43c16570b60f3e4575c03bd17c2d64c50a5cee849c8f3e'
'114964ead7f7de9b745d37440ca40bb968d14db8075eaf4a5dbfd517799c907b'
)

package() {

	ar x "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.107.40501-1337803_amd64.deb"
	tar xJf data.tar.xz
	ar x "${srcdir}/opencl-legacy-amdgpu-pro-icd_21.40.1-1337803_amd64.deb"
	tar xJf data.tar.xz
	ar x "${srcdir}/comgr_2.1.0.40501-84_amd64.deb"
	tar zfx data.tar.gz
	ar x "${srcdir}/hip-runtime-amd_4.4.21432.40501-84_amd64.deb"
	tar zfx data.tar.gz
	ar x "${srcdir}/hsa-rocr_1.4.0.40501-84_amd64.deb"
	tar zfx data.tar.gz
	ar x "${srcdir}/hsakmt-roct-dev_20210902.7.5.40501-84_amd64.deb"
	tar zfx data.tar.gz
	ar x "${srcdir}/rocm-opencl_2.0.0.40501-84_amd64.deb"
	tar zfx data.tar.gz

	
	cd ${amdgpu}
	rm "libdrm_amdgpu.so.1"
	mv "libdrm_amdgpu.so.1.0.0" "libdrm_amdgpo.so.1.0.0"
	ln -s "libdrm_amdgpo.so.1.0.0" "libdrm_amdgpo.so.1"


	mkdir -p ${pkgdir}/usr/lib
	mv "${srcdir}/${rocm_opencl}/libamdocl64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${hip_dir}/libamdhip64.so.4.4.40501" "${pkgdir}/usr/lib"
	mv "${srcdir}/${hip_dir}/libamdhip64.so" "${pkgdir}/usr/lib"
	mv "${srcdir}/${hip_dir}/libamdhip64.so.4" "${pkgdir}/usr/lib"	

	mv "${srcdir}/${rocm_lib}/libhsa-runtime64.so.1.4.40501" "${pkgdir}/usr/lib"
	mv "${srcdir}/${rocm_lib}/libhsa-runtime64.so" "${pkgdir}/usr/lib"
	mv "${srcdir}/${rocm_lib}/libhsa-runtime64.so.1" "${pkgdir}/usr/lib"

	mv "${srcdir}/${rocm_lib}/libamd_comgr.so.2.1.40501" "${pkgdir}/usr/lib"	
	mv "${srcdir}/${rocm_lib}/libamd_comgr.so" "${pkgdir}/usr/lib/"	
	mv "${srcdir}/${rocm_lib}/libamd_comgr.so.2" "${pkgdir}/usr/lib/libamd_comgr.so"	

	# legacy
	mv "${srcdir}/${amdgpu_pro}/libamdocl-orca64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${amdgpu}/libdrm_amdgpo.so.1.0.0" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${amdgpu}/libdrm_amdgpo.so.1" "${pkgdir}/usr/lib/"

	mkdir -p ${pkgdir}/etc/OpenCL/vendors	
	echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
	echo libamdocl-orca64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl-orca64.icd"
}