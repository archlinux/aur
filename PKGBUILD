# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

_gpuarch=gfx1151
pkgname="rocm-nightly-${_gpuarch,,}-bin"
pkgver=7.13.0a20260414
pkgrel=1
pkgdesc="AMD ROCm Nightly Release (${_gpuarch}) - Monolithic Install"
arch=('x86_64')
url="https://rocm.nightlies.amd.com"
license=('MIT' 'custom:LicenseRef-ROCm-EULA')
depends=('glibc' 'gcc-libs' 'python-pyelftools' 'python')

# 官方源冲突列表：涵盖了 Core, Compilers, HIP, Math Libs, ML, Tools 等
_rocm_packages=(
    'amdsmi'
    'rocm-core' 'rocm-cmake' 'rocm-llvm' 'rocm-device-libs'
    'hsa-rocr' 'hsakmt-roct' 'comgr' 'rocminfo' 'rocwmma'
    'hip-runtime-amd' 'hip-runtime-nvidia'
    'rocm-smi-lib' 'rocm-gdb' 'rocm-dbgapi'
    'rocprofiler' 'rocprofiler-register' 'roctracer' 'rocm-bandwidth-test' 'composable-kernel'
    'opencl-rocm'
    'hipblas' 'hipblas-common' 'hipblaslt' 'rocblas'
    'hipfft' 'rocfft'
    'hiprand' 'rocrand'
    'hipsolver' 'rocsolver'
    'hipsparse' 'hipsparselt' 'rocsparse'
    'rccl' 'rocalution' 'rocprim' 'rocthrust' 'hipcub'
    'miopen-hip' 'migraphx' 'mivisionx' 'rpp'
    'hipfort' 'hipify-clang'
    'rocm-hip-sdk' 'rocm-hip-libraries' 'rocm-hip-runtime' 'rocm-opencl-sdk' 'rocm-opencl-runtime' 'rocm-ml-sdk' # Meta packages
)

provides=("${_rocm_packages[@]}" "rocm=${pkgver}" "opencl-driver")
conflicts=("${_rocm_packages[@]}" "rocm")
options=('!strip' '!debug')
source=("${url}/tarball/therock-dist-linux-${_gpuarch}-${pkgver}.tar.gz")
sha256sums=('73fe436b8816a25077c996118a20c432a7fb475a93eb1abb836549f378d0d2fd')

package() {
    local _tarball_name=$(basename "${source[0]}")

    # 1. 创建安装目录 /opt/rocm
    mkdir -p "${pkgdir}/opt/rocm"

    # 2. 复制所有内容
    # 源码是 tarbomb 结构（直接解压在 srcdir），因此复制当前目录下所有可见文件
    # 使用 -d (preserve links) -r (recursive)
    msg2 "Copying files to /opt/rocm..."
    cp -dr --no-preserve=ownership * "${pkgdir}/opt/rocm/"
    # 2.1 修复 amdgcn 目录结构
    local _amdgcn_dir="${pkgdir}/opt/rocm/lib/llvm/amdgcn"
    if [ -d "${_amdgcn_dir}" ]; then
        msg2 "Symlinking amdgcn directory..."
        ln -s "lib/llvm/amdgcn" "${pkgdir}/opt/rocm/amdgcn"
    fi

    # 删除可能误复制的 tarball 和 PKGBUILD 相关文件 (如果 source 在当前目录)
    rm -f "${pkgdir}/opt/rocm/${_tarball_name}"
    rm -f "${pkgdir}/opt/rocm/PKGBUILD"

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

    # 5. 配置 OpenCL ICD
    install -Dm644 /dev/null "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"
    echo "/opt/rocm/lib/opencl/libamdocl64.so" > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"

    # 6. 处理许可证
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    if [ -f "${pkgdir}/opt/rocm/LICENSE" ]; then
        ln -s "/opt/rocm/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    elif [ -f "${pkgdir}/opt/rocm/LICENSE.txt" ]; then
        ln -s "/opt/rocm/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
