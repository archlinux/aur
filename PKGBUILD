# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=lucebox-git
pkgver=r995.7c27e33
pkgrel=1
pkgdesc='Fast LLM speculative inference server for consumer hardware'
arch=('x86_64')
url='https://lucebox.com'
license=('Apache-2.0')
depends=(
    'cuda'
    'curl'
    'gcc-libs'
    'glibc'
    'libgomp'
)
makedepends=(
    'cmake'
    'git'
    'nlohmann-json'
    'patchelf'
)
options=('!lto' '!debug')
provides=('lucebox')
conflicts=('lucebox')
source=('lucebox::git+https://github.com/Luce-Org/lucebox-hub.git')
sha256sums=('SKIP')

pkgver() {
    cd lucebox
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd lucebox
    git submodule update --init --recursive
}

build() {
    # Detect local GPU SM version; override with CUDA_ARCHITECTURES env var, e.g.:
    #   CUDA_ARCHITECTURES='60;70;75;80;86;89' makepkg -f
    if [[ -z "${CUDA_ARCHITECTURES:-}" ]]; then
        local _sm
        _sm=$(/opt/cuda/extras/demo_suite/deviceQuery 2>/dev/null \
              | grep -oP 'CUDA Capability.*:\s*\K[0-9]+\.[0-9]+' | head -1 \
              | tr -d '.')
        if [[ -z "$_sm" ]]; then
            _sm=$(nvidia-smi --query-gpu=compute_cap --format=csv,noheader 2>/dev/null \
                  | head -1 | tr -d '.')
        fi
        : "${_sm:=86}"
    fi
    local _cuda_arch="${CUDA_ARCHITECTURES:-${_sm}}"

    cmake -B build -S lucebox/server \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CUDA_ARCHITECTURES="${_cuda_arch}" \
        -DCMAKE_C_FLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}/=" \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}/=" \
        -DCMAKE_CUDA_FLAGS="-Xcompiler=-ffile-prefix-map=${srcdir}/=" \
        -Wno-dev

    cmake --build build --target dflash_server backend_ipc_daemon pflash_daemon -j"$(nproc)"
}

package() {
    local _privlib=/usr/lib/lucebox

    # Main server binary
    install -Dm755 build/dflash_server "${pkgdir}/usr/lib/lucebox/dflash_server"
    install -Dm755 build/backend_ipc_daemon "${pkgdir}/usr/lib/lucebox/backend_ipc_daemon"
    install -Dm755 build/pflash_daemon "${pkgdir}/usr/lib/lucebox/pflash_daemon"

    # Fix RPATH: point to private lib dir instead of build-tree paths
    for _bin in "${pkgdir}${_privlib}"/{dflash_server,backend_ipc_daemon,pflash_daemon}; do
        patchelf --set-rpath "${_privlib}" "$_bin"
    done

    # Bundle ggml shared libraries (some backends build in subdirs)
    local _lib
    while IFS= read -r -d '' _lib; do
        local _name=$(basename "$_lib")
        if [ -L "$_lib" ]; then
            cp -a "$_lib" "${pkgdir}${_privlib}/"
        else
            install -Dm755 "$_lib" "${pkgdir}${_privlib}/${_name}"
        fi
    done < <(find build/deps/llama.cpp/ggml/src -name 'libggml*.so*' -print0)

    # Fix RUNPATH on bundled .so files too
    for _lib in "${pkgdir}${_privlib}"/libggml*.so*; do
        [[ -L "$_lib" ]] && continue
        patchelf --set-rpath "${_privlib}" "$_lib"
    done

    # Runtime asset
    install -Dm644 lucebox/server/share/status.html "${pkgdir}/usr/share/lucebox/status.html"

    # Wrapper scripts in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    for _bin in dflash_server backend_ipc_daemon pflash_daemon; do
        cat > "${pkgdir}/usr/bin/lucebox-${_bin//_/-}" <<WRAP
#!/bin/sh
export DFLASH_SHARE_DIR=/usr/share/lucebox
exec ${_privlib}/${_bin} "\$@"
WRAP
        chmod 755 "${pkgdir}/usr/bin/lucebox-${_bin//_/-}"
    done
}
