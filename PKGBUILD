# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_rocm_repo='https://repo.amd.com/rocm/packages-multi-arch/ubuntu2604'

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, OpenCL runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=10.2.0
pkgrel=1
epoch=1
arch=('x86_64')
url='https://www.amd.com'
license=('custom:AMD')
depends=('ocl-icd' 'gcc-libs')
provides=('opencl-driver' 'amdrocm-llvm' 'amdrocm-runtime' 'amdrocm-base' 'amdrocm-opencl' 'amdrocm-sysdeps')
conflicts=('rocm-bin' 'rocm-gfx101x-bin' 'rocm-gfx103x-bin' 'rocm-gfx110x-bin' 'rocm-gfx120x-bin' 'rocm-gfx1150-bin' 'rocm-gfx1151-bin' 'rocm-gfx1152-bin' 'rocm-gfx1153-bin' 'rocm-opencl-runtime' 'rocm' 'rocm-core'
 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'rocminfo' 'hip-runtime-amd' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-runtime' 'rocprofiler-register' 'hsa-amd-aqlprofile' 'rocm-cmake' 'rocm-smi-lib')
optdepends=('clinfo')

source=(
#runtime
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-sysdeps10.2_10.2.0-2_amd64.deb"
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-llvm10.2_10.2.0-2_amd64.deb"
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-runtime10.2_10.2.0-2_amd64.deb"
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-base10.2_10.2.0-2_amd64.deb"
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-opencl10.2_10.2.0-2_amd64.deb"
#dev - todo
)

sha256sums=(
"e81ee425b56d3c37b267480530d82a512aaa2fbf1f5b32df01ac1ef9b86a1fac"
"f7aef5f955d375680fb7ebdbb40f245230fbd7ef303593968dec67c7366916e2"
"987610001de42cef3c5325f9a71e26e90d56cac595765e77c1d1a5e97b650593"
"33a4de9d3c59e74131b46bd31f0ce6694fbe62dff5ed2f6dd3fd4bd7f98c41e6"
"30d11e37ef198ed1c79882f303378b9c0b81f1fe54cbf63b4e35ec80e03d945a"
)

package() {
    for p in *.deb; do
        ar x "${p}"
        if [[ -f data.tar.gz ]]; then
            # echo gz: "${srcdir}/${p}"
            tar xfx data.tar.gz
            rm data.tar.gz
        elif [[ -f data.tar.xz ]]; then
            # echo xz: "${srcdir}/${p}"
            tar xJf data.tar.xz
            rm data.tar.xz
        fi
    done

    mv "${srcdir}/opt/" "${pkgdir}/"
    cp -a "${pkgdir}/opt/rocm/core-10.2/." "${pkgdir}/opt/rocm/"

    mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
    cd "${pkgdir}/opt/amdgpu/share/libdrm"
    ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids

    mkdir -p "${pkgdir}/etc/OpenCL/vendors"
    echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"

    mkdir -p "${pkgdir}/etc/ld.so.conf.d"
    echo /opt/rocm/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
    echo /opt/rocm/lib/opencl >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

    mkdir -p "${pkgdir}/etc/profile.d"
    echo export PATH="\${PATH}:/opt/rocm/bin:/opt/rocm/lib/llvm/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
