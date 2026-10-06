# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
_rocm_repo='https://repo.amd.com/rocm/packages-multi-arch/ubuntu2604'

pkgname=opencl-amd
pkgdesc="ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, OpenCL runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack."
pkgver=10.1.0
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
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-sysdeps10.1_10.1.0-3_amd64.deb"
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-llvm10.1_10.1.0-3_amd64.deb"
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-runtime10.1_10.1.0-3_amd64.deb"
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-base10.1_10.1.0-3_amd64.deb"
"https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/pool/main/amdrocm-opencl10.1_10.1.0-3_amd64.deb"
#dev - todo
)

sha256sums=(
"a2493d98144a586df49489c4b4b7a7449c9eb123597515929699b1b5fccfd916"
"6a4727102d830f6c97b911351192b15623189278afad9b4558514a6fe51ca58a"
"2cf4fa3b82f9b37be9fc18ca6886e1791585c1b8041758ccba9e3c5dadb7c6b1"
"a3d48032edee53c51016b28884a1fe81e2d2f84e087c2546dd20753402ad53c9"
"d4c195a9c99bd61f9269fb61a9c396bfdbbe1db5ebea21cc3bc5657f75ca1304"
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
    mv "${pkgdir}/opt/rocm/core-10.1" "${pkgdir}/opt/rocm/core"

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
