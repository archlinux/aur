# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Co-Maintainer: George Sofianos

# Release notes https://rocmdocs.amd.com/en/latest/Current_Release_Notes/Current-Release-Notes.html
major='21.40.2'
minor='1350682'
rocm_major='40502'
rocm_minor='164'
amdgpu_repo='https://repo.radeon.com/amdgpu/21.40.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/4.5.2'
opencl_lib='opt/rocm-4.5.2/opencl/lib'
rocm_lib='opt/rocm-4.5.2/lib'
hip_lib='opt/rocm-4.5.2/hip/lib/'
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
"https://repo.radeon.com/amdgpu/21.40.2/ubuntu/pool/main/libd/libdrm-amdgpu/libdrm-amdgpu-amdgpu1_2.4.107.40502-1350682_amd64.deb"
#"https://repo.radeon.com/amdgpu/21.40.2/ubuntu/pool/proprietary/c/clinfo-amdgpu-pro/clinfo-amdgpu-pro_21.40.2-1350682_amd64.deb"
#"https://repo.radeon.com/amdgpu/21.40.2/ubuntu/pool/proprietary/o/ocl-icd-amdgpu-pro/ocl-icd-libopencl1-amdgpu-pro_21.40.2-1350682_amd64.deb"
"https://repo.radeon.com/amdgpu/21.40.2/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_21.40.2-1350682_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/c/comgr/comgr_2.1.0.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/h/hip-runtime-amd/hip-runtime-amd_4.4.21432.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/h/hsa-rocr/hsa-rocr_1.4.0.40502-164_amd64.deb"
#"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/h/hsakmt-roct-dev/hsakmt-roct-dev_20210902.12.3277.40502-164_amd64.deb"
"https://repo.radeon.com/rocm/apt/4.5.2/pool/main/r/rocm-opencl/rocm-opencl_2.0.0.40502-164_amd64.deb"
)

sha256sums=(
'7fa1eb5ee2b8f9b50fd9aac29330c6f741d313d1d95d3218e80b5236e24bc508'
#'505a1a8da73869dd1f04a18fce3fe3297b43eb22ca5d71148a3e502d28d7f8e9'
#'f58d4d0a43e02c5a0043845b7ad2659f728d61541ec45aae8fb0989150480d9e'
'e3df0cc14bcc7ab529694cd0d61258b9fb6cad93319d7a12dbd8b6d87fd94c02'
'78fcfbfd1ece7e71a5c23f2fd6b48c117468fa86fe1b7ee5425fd1de788e9dd3'
'e288edcb472b46453ddbcf3615be5c553f8aea2a81bfc79f2517e16cb86f2226'
'3a9c92bb3a286fbabdaf6104f1ca3bd01ebc818b7efbbf2c7bc2fda3dff0ef30'
#'c24b1816144d227c3d6252e925a73c39645fb64fe1f08100608bfcd5ba86dc8d'
'82b86940d8a93ba91430c48dbfa057ec28db94fcbbc12d1fe58bf11950163d4d'
)

package() {

	ar x "${srcdir}/libdrm-amdgpu-amdgpu1_2.4.107.40502-1350682_amd64.deb"
	tar xJf data.tar.xz
	ar x "${srcdir}/opencl-legacy-amdgpu-pro-icd_21.40.2-1350682_amd64.deb"
	tar xJf data.tar.xz
	ar x "${srcdir}/comgr_2.1.0.40502-164_amd64.deb"
	tar zfx data.tar.gz
	ar x "${srcdir}/hip-runtime-amd_4.4.21432.40502-164_amd64.deb"
	tar zfx data.tar.gz
	ar x "${srcdir}/hsa-rocr_1.4.0.40502-164_amd64.deb"
	tar zfx data.tar.gz
	#ar x "${srcdir}/hsakmt-roct-dev_20210902.12.3277.40502-164_amd64.deb"
	#tar zfx data.tar.gz
	ar x "${srcdir}/rocm-opencl_2.0.0.40502-164_amd64.deb"
	tar zfx data.tar.gz

	cd ${srcdir}/${amdgpu_pro}
	sed -i "s|libdrm_amdgpu|libdrm_amdgpo|g" libamdocl-orca64.so

	cd ${srcdir}/${amdgpu}
	rm "libdrm_amdgpu.so.1"
	mv "libdrm_amdgpu.so.1.0.0" "libdrm_amdgpo.so.1.0.0"
	ln -s "libdrm_amdgpo.so.1.0.0" "libdrm_amdgpo.so.1"


	mkdir -p ${pkgdir}/usr/lib
	mv "${srcdir}/${opencl_lib}/libamdocl64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/${hip_lib}/libamdhip64.so.4.4.40502" "${pkgdir}/usr/lib"
	mv "${srcdir}/${hip_lib}/libamdhip64.so" "${pkgdir}/usr/lib"
	mv "${srcdir}/${hip_lib}/libamdhip64.so.4" "${pkgdir}/usr/lib"	

	mv "${srcdir}/${rocm_lib}/libhsa-runtime64.so.1.4.40502" "${pkgdir}/usr/lib"
	mv "${srcdir}/${rocm_lib}/libhsa-runtime64.so" "${pkgdir}/usr/lib"
	mv "${srcdir}/${rocm_lib}/libhsa-runtime64.so.1" "${pkgdir}/usr/lib"

	mv "${srcdir}/${rocm_lib}/libamd_comgr.so.2.1.40502" "${pkgdir}/usr/lib"	
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