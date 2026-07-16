# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_rocm_repo='https://repo.amd.com/rocm/packages-multi-arch/ubuntu2604'

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, OpenCL runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=7.14.0
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
depends=('ocl-icd' 'gcc-libs')
provides=('opencl-driver' 'amdrocm-llvm' 'amdrocm-runtime' 'amdrocm-base' 'amdrocm-opencl' 'amdrocm-sysdeps')
conflicts=('rocm-bin' 'rocm-gfx101x-bin' 'rocm-gfx103x-bin' 'rocm-gfx110x-bin' 'rocm-gfx120x-bin' 'rocm-gfx1150-bin' 'rocm-gfx1151-bin' 'rocm-gfx1152-bin' 'rocm-gfx1153-bin' 'rocm-opencl-runtime' 'rocm' 'rocm-core'
 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'rocminfo' 'hip-runtime-amd' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-opencl' 'rocm-opencl-runtime' 'rocprofiler-register' 'hsa-amd-aqlprofile' 'rocm-cmake' 'rocm-smi-lib')
optdepends=('clinfo')

source=(
#runtime
"https://repo.amd.com/rocm/packages-multi-arch/ubuntu2604/pool/main/amdrocm-sysdeps7.14_7.14.0-3_amd64.deb"
"https://repo.amd.com/rocm/packages-multi-arch/ubuntu2604/pool/main/amdrocm-llvm7.14_7.14.0-3_amd64.deb"
"https://repo.amd.com/rocm/packages-multi-arch/ubuntu2604/pool/main/amdrocm-runtime7.14_7.14.0-3_amd64.deb"
"https://repo.amd.com/rocm/packages-multi-arch/ubuntu2604/pool/main/amdrocm-base7.14_7.14.0-3_amd64.deb"
"https://repo.amd.com/rocm/packages-multi-arch/ubuntu2604/pool/main/amdrocm-opencl7.14_7.14.0-3_amd64.deb"
#dev - todo
)

sha256sums=(
"c28c1863f3f5006fb60976e5dde098fa8ae8fe8e4b65f02116586d68fc261a00"
"e1f1e278f87e35d6d52b2fceb01e083a1ef6e2ed808eb30701f6e7cf0a332d98"
"19d6547f447dcfab9890d3608c5aa9b35647ab293bfb5ffbc829402e6fcc7233"
"23a5667f15b45fcc1b06197eed8800d8d6757e7fd7f8806557eb7e9d80715358"
"5bc27da187b44592ed04e674a00668dbe8b73bb9a87d820c31a366905dcac772"
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
    mv "${pkgdir}/opt/rocm/core-7.14" "${pkgdir}/opt/rocm/core"

    mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
    cd "${pkgdir}/opt/amdgpu/share/libdrm"
    ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids

    mkdir -p "${pkgdir}/etc/OpenCL/vendors"
    echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"

    mkdir -p "${pkgdir}/etc/ld.so.conf.d"
    echo /opt/rocm/core/lib >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"
    echo /opt/rocm/core/lib/opencl >> "$pkgdir/etc/ld.so.conf.d/opencl-amd.conf"

    mkdir -p "${pkgdir}/etc/profile.d"
    echo export PATH="\${PATH}:/opt/rocm/core/bin:/opt/rocm/core/lib/llvm/bin" > "$pkgdir/etc/profile.d/opencl-amd.sh"
}
