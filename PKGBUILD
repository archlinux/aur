# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_rocm_repo='https://repo.amd.com/rocm/packages-multi-arch/ubuntu2604'

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, OpenCL runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=10.0.0
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
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-sysdeps10.0_10.0.0-4_amd64.deb"
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-llvm10.0_10.0.0-4_amd64.deb"
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-runtime10.0_10.0.0-4_amd64.deb"
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-base10.0_10.0.0-4_amd64.deb"
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-opencl10.0_10.0.0-4_amd64.deb"
#dev - todo
)

sha256sums=(
"6e99e9d4a9bce350d86624b723586e5e81153aab00ebe989b2ef0e0758c23189"
"24a33e37d845f1e6809c34f2eebfe4686a4bd76befaf1e1b23605e3978f224ef"
"531aa7b229a6e42f2048fa4b539e15623a9df679db4cdd0b4bf7e582be0e276d"
"9f179ac2d9298b07bd7153f780f5cf210e0558281835e2b34753d32e3e3a6e1e"
"06983f91cd417015411013044a32608784d340cb6104ba1e8b8dbf0fdbd394fa"
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
    mv "${pkgdir}/opt/rocm/core-10.0" "${pkgdir}/opt/rocm/core"

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
