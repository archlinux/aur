# Maintainer: cantosun99 <privat at cantosun dot de>
pkgname=llama.cpp-sycl
pkgver=r1.803627f
pkgrel=1
pkgdesc="llama.cpp with Intel Arc GPU acceleration via SYCL/oneAPI (bundled runtime, no separate oneAPI install required). Please read the README on GitHub before use."
arch=('x86_64')
url="https://github.com/cantosun99/llama.cpp-sycl"
license=('MIT')

# Dynamically fetch the latest llama.cpp commit hash so pacman detects updates
pkgver() {
    local commit
    commit=$(git ls-remote https://github.com/ggml-org/llama.cpp HEAD | cut -c1-7)
    printf "r1.%s\n" "$commit"
}
conflicts=(
    'llama.cpp'
    'llama.cpp-vulkan'
    'llama.cpp-cuda'
    'llama.cpp-hip'
    'llama.cpp-sycl-fp16'
    'llama.cpp-sycl-fp32'
)
depends=(
    'intel-compute-runtime'
    'level-zero-loader'
    'level-zero-headers'
    'gcc-libs'
)
makedepends=(
    'git'
    'cmake'
    'make'
)
options=(!strip)
# URLs of the split tar parts (pinned to release tag for reproducibility)
_source_release="2026.0.0"
source=(
    "https://github.com/cantosun99/llama.cpp-sycl/releases/download/$_source_release/intel.tar.part-aa"
    "https://github.com/cantosun99/llama.cpp-sycl/releases/download/$_source_release/intel.tar.part-ab"
    "https://github.com/cantosun99/llama.cpp-sycl/releases/download/$_source_release/intel.tar.part-ac"
)

# SHA256 checksums for each part
sha256sums=(
    'bfb49f991a14dbb11c69618a332e0c5584e39dbc11bfc48f3cc47eb7f0965bcf'
    '8a9ac72795ea4c64a59c481458dd0248013337b8621698ad1ff704048542b015'
    '2dd7f0159c2f8f9601c3d4d372be3251a6d5c3b5379dba280e2b5249ed185dd4'
)
noextract=(
    'intel.tar.part-aa'
    'intel.tar.part-ab'
    'intel.tar.part-ac'
)

prepare() {
    # Recombine split parts into one tarball
    echo "Recombining split parts into intel.tar.gz..."
    cat "${srcdir}"/intel.tar.part-* > "${srcdir}/intel.tar.gz"

    # Extract the oneAPI toolchain (tar contains intel/oneapi/... → becomes $srcdir/opt/intel/oneapi)
    echo "Extracting oneAPI toolchain..."
    mkdir -p "${srcdir}/opt"
    tar -xzf "${srcdir}/intel.tar.gz" -C "${srcdir}/opt/"

    # Clone llama.cpp source
    git clone --depth=1 https://github.com/ggml-org/llama.cpp "${srcdir}/llama.cpp"
}

build() {
    # Source the oneAPI environment so icx/icpx are available
    # We point it at the extracted toolchain in $srcdir
    local oneapi_root="${srcdir}/opt/intel/oneapi"

    # Source setvars if present (standard oneAPI layout)
    if [[ -f "${oneapi_root}/setvars.sh" ]]; then
        set +u
        source "${oneapi_root}/setvars.sh" --force
        set -u
    else
        # Fallback: manually prepend icx/icpx to PATH
        export PATH="${oneapi_root}/compiler/latest/bin:${PATH}"
        export LD_LIBRARY_PATH="${oneapi_root}/compiler/latest/lib:${LD_LIBRARY_PATH:-}"
    fi

    cd "${srcdir}/llama.cpp"

    # Strip -D_FORTIFY_SOURCE from CFLAGS/CXXFLAGS for IntelLLVM device-side
    # compilation. The SYCL JIT compiler emits __memcpy_chk references when
    # _FORTIFY_SOURCE is set, but the device runtime cannot resolve glibc's
    # fortify symbols. This causes a SYCL build program failure at first
    # kernel warmup ("Unresolved Symbol <__memcpy_chk>" → ggml_sycl_op_mul_mat
    # → SIGABRT). Stripping the macro restores normal device-side codegen.
    # Refs: https://github.com/ggml-org/llama.cpp/issues/11713
    local _cflags="${CFLAGS//-D_FORTIFY_SOURCE=*/} -U_FORTIFY_SOURCE"
    local _cxxflags="${CXXFLAGS//-D_FORTIFY_SOURCE=*/} -U_FORTIFY_SOURCE"

    cmake -B build \
        -DCMAKE_C_FLAGS="$_cflags" \
        -DCMAKE_CXX_FLAGS="$_cxxflags" \
        -DGGML_SYCL=ON \
        -DCMAKE_C_COMPILER=icx \
        -DCMAKE_CXX_COMPILER=icpx \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build --config Release -j$(nproc)
}

package() {
    # Install oneAPI runtime files to /opt/intel/oneapi on the user's system
    echo "Installing oneAPI runtime to /opt/intel/oneapi..."
    mkdir -p "${pkgdir}/opt/intel"
    cp -r "${srcdir}/opt/intel/oneapi" "${pkgdir}/opt/intel/"

    # Install all llama.cpp binaries to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    for bin in "${srcdir}/llama.cpp/build/bin/"*; do
        [[ -f "$bin" && -x "$bin" ]] && install -m755 "$bin" "${pkgdir}/usr/bin/"
    done

    # Install license
    install -Dm644 "${srcdir}/llama.cpp/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
