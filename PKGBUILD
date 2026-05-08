# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

_gpuarch=gfx120X-all
pkgname="rocm-nightly-${_gpuarch,,}-bin"
pkgver=7.13.0a20260507
pkgrel=1
pkgdesc="AMD ROCm Nightly Release (${_gpuarch}) - Monolithic Install"
arch=('x86_64')
url="https://rocm.nightlies.amd.com"
license=('MIT' 'custom:LicenseRef-ROCm-EULA')
depends=('glibc' 'gcc-libs' 'python-pyelftools' 'python')

# 官方源冲突列表：涵盖了 Core, Compilers, HIP, Math Libs, ML, Tools 等
_rocm_packages=(
    'hip-runtime-amd' 'hip-runtime-nvidia'
    'amdsmi' 'composable-kernel'
    'rocm-core' 'rocm-cmake' 'rocm-llvm' 'rocm-device-libs'
    'hsa-rocr' 'hsakmt-roct' 'hsa-amd-aqlprofile'
    'comgr' 'rocminfo' 'rocwmma' 'rocprofiler-register'
    'rocm-smi-lib' 'rocm-gdb' 'rocm-dbgapi'
    'rocprofiler' 'roctracer' 'rocm-bandwidth-test'
    'opencl-rocm'
    'hipblas' 'hipblas-common' 'hipblaslt' 'rocblas'
    'hipfft' 'rocfft'
    'hiprand' 'rocrand'
    'hipsolver' 'rocsolver'
    'hipsparse' 'hipsparselt' 'rocsparse'
    'rccl' 'rocalution' 'rocprim' 'rocthrust' 'hipcub'
    'miopen-hip' 'migraphx' 'mivisionx' 'rpp'
    'hipfort' 'hipify-clang'
    'rocm-hip-sdk' 'rocm-hip-libraries' 'rocm-hip-runtime' 'rocm-opencl-sdk' 'rocm-ml-sdk' # Meta packages
)

provides=("${_rocm_packages[@]}" "rocm=${pkgver}")
conflicts=("${_rocm_packages[@]}" "rocm")
options=('!strip' '!debug')
source=("${url}/tarball/therock-dist-linux-${_gpuarch}-${pkgver}.tar.gz")
sha256sums=('SKIP')

noextract=("${source[@]##*/}")

package() {
    install -d "${pkgdir}/opt/rocm"

    # 1. 复制所有内容
    # 源码是 tarbomb 结构（直接解压在 srcdir），因此复制当前目录下所有可见文件
    tar xzf "${source[0]##*/}" -C ${pkgdir}/opt/rocm
    # 2 修复 amdgcn 目录结构
    if [ -d "${pkgdir}/opt/rocm/lib/llvm/amdgcn" ]; then
        msg2 "Symlinking amdgcn directory..."
        ln -s "lib/llvm/amdgcn" "${pkgdir}/opt/rocm/amdgcn"
    fi

    # 3. 配置动态链接库路径 /etc/ld.so.conf.d/
    install -Dm644 /dev/null "${pkgdir}/etc/ld.so.conf.d/rocm-nightly-${_gpuarch}.conf"
    echo "/opt/rocm/lib" > "${pkgdir}/etc/ld.so.conf.d/rocm-nightly-${_gpuarch}.conf"
    echo "/opt/rocm/lib64" >> "${pkgdir}/etc/ld.so.conf.d/rocm-nightly-${_gpuarch}.conf"

    # 4. 配置环境变量 /etc/profile.d/
    install -Dm755 /dev/null "${pkgdir}/etc/profile.d/rocm-nightly-${_gpuarch}.sh"
    cat <<EOF > "${pkgdir}/etc/profile.d/rocm-nightly-${_gpuarch}.sh"
export ROCM_PATH=/opt/rocm
export ROCM_HOME=/opt/rocm
export HIP_PATH=/opt/rocm
export HIP_PLATFORM=amd
export PATH=\$ROCM_PATH/bin:\$PATH
export LD_LIBRARY_PATH=\$ROCM_PATH/lib:\$LD_LIBRARY_PATH
EOF

    # 5. 处理许可证
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    if [ -f "${pkgdir}/opt/rocm/share/doc/NOTICES.txt" ]; then
        ln -s "/opt/rocm/share/doc/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICES.txt"
    fi
}
