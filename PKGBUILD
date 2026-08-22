# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
pkgname=rocm-gfx110x-bin
pkgdesc="ROCm Core SDK - RDNA3"
pkgver=7.14.0
pkgrel=2
epoch=0
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
depends=('ocl-icd' 'gcc-libs')
provides=('opencl-driver' 'amdrocm-amdsmi' 'amdrocm-llvm' 'amdrocm-runtime' 'amdrocm-fft' 'amdrocm-blas' 'amdrocm-sparse' 'amdrocm-solver' 'amdrocm-dnn' 'amdrocm-rand' 'amdrocm-ccl' 'amdrocm-profiler' 'amdrocm-profiler-base' 'amdrocm-base' 'amdrocm-ck'
'amdrocm-debugger' 'amdrocm-hipify' 'amdrocm-opencl' 'amdrocm-decode' 'amdrocm-jpeg' 'amdrocm-rccl' 'amdrocm-rocshmem' 'amdrocm-rdc' 'amdrocm-sysdeps' 'rocm' 'rocm-core' 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-plugins' 'rocprofiler-register'
'roctracer' 'hsa-amd-aqlprofile' 'rocm-openmp' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-smi-lib' 'amdsmi' 'amd-smi-lib' 'composable-kernel' 'hipcc' 'rocm-llvm' 'rocblas' 'rocsolver' 'half' 'hipblas' 'hipblas-common' 'hipblaslt' 'hiprand' 'rocdecode' 'rocjpeg' 'rocprim' 'hipcub'
'rocfft' 'hipfft' 'hipfort' 'hipify-clang' 'hipsolver' 'rocsparse' 'hipsparse' 'hipsparselt' 'hiptensor' 'openmp-extras-dev' 'rccl' 'rocrand' 'rocalution' 'rocm-hip-libraries' 'rocthrust' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl'
'rocm-opencl-runtime' 'rocm-opencl-sdk' 'rocwmma' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'rocshmem' 'miopen' 'miopen-hip' 'mivisionx' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp')
conflicts=('opencl-amd' 'opencl-amd-dev' 'rocm-bin' 'rocm-gfx101x-bin' 'rocm-gfx103x-bin' 'rocm-gfx120x-bin' 'rocm-gfx1150-bin' 'rocm-gfx1151-bin' 'rocm-gfx1152-bin' 'rocm-gfx1153-bin' 'rocm-opencl-runtime' 'rocm' 'rocm-core' 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb'
'rocprofiler' 'rocprofiler-plugins' 'rocprofiler-register' 'roctracer' 'hsa-amd-aqlprofile' 'rocm-openmp' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-smi-lib' 'amdsmi' 'amd-smi-lib' 'composable-kernel' 'hipcc' 'rocm-llvm' 'rocblas' 'rocsolver' 'hipblas' 'hipblas-common' 'hipblaslt' 'hiprand' 'rocdecode' 'rocjpeg' 'rocprim' 'hipcub' 'rocfft' 'hipfft' 'hipify-clang' 'hipsolver' 'rocsparse' 'hipsparse' 'hipsparselt' 'hiptensor' 'rccl' 'rocrand' 'rocalution' 'rocm-hip-libraries' 'rocthrust' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl' 'rocm-opencl-runtime' 'rocm-opencl-sdk' 'rocwmma' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'rocshmem' 'miopen' 'miopen-hip' 
'rocm-ml-libraries' 'rocm-ml-sdk')
optdepends=('clinfo')
options=('!strip')

source=(
"https://repo.amd.com/rocm/tarball-multi-arch/therock-dist-linux-gfx110X-all-7.14.0.tar.gz"
)

sha256sums=(
"e78a4445c52d879fbd0765f24e7fa9df1e262a8baf681b118a13e75340120127"
)

prepare() {
    mkdir -p "${srcdir}/opt/rocm/core"
    bsdtar xf therock-dist-linux-gfx110X-all-7.14.0.tar.gz -C ${srcdir}/opt/rocm/core
}

package() {
    mv "${srcdir}/opt/" "${pkgdir}/"

    mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
    cd "${pkgdir}/opt/amdgpu/share/libdrm"
    ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids

    mkdir -p "${pkgdir}/etc/OpenCL/vendors"
    echo /opt/rocm/core/lib/opencl/libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"

    mkdir -p "${pkgdir}/etc/ld.so.conf.d"
    echo /opt/rocm/core/lib >> "$pkgdir/etc/ld.so.conf.d/rocm-bin.conf"

    mkdir -p "${pkgdir}/opt/rocm"
    cd "${pkgdir}/opt/rocm"
    ln -s /opt/rocm/core/lib lib

    mkdir -p "${pkgdir}/etc/profile.d"
    echo export PATH="\${PATH}:/opt/rocm/core/bin:/opt/rocm/core/lib/llvm/bin" > "$pkgdir/etc/profile.d/rocm-bin.sh"
}
