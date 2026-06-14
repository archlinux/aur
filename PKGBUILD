# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=lichtfeld-studio-git
pkgver=0.5.2.r2.g85efbd07
pkgrel=2
pkgdesc="Real-time 3D Gaussian Splatting studio for point cloud visualization and editing"
arch=('x86_64')
url="https://github.com/MrNeRF/LichtFeld-Studio"
license=('GPL-3.0-only')
depends=(
    'assimp'
    'boost'
    'cuda'
    'ffmpeg'
    'freetype2'
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'libarchive'
    'libglvnd'
    'libwebp'
    'dbus'
    'nvidia-utils'  # driver >= 570 required at runtime
    'openimageio'
    'onetbb'
    'openssl'
    'python312'
    'python312-packaging'
    'sdl3'
    'spdlog'
)
makedepends=(
    'autoconf'
    'autoconf-archive'
    'automake'
    'cmake>=3.30'
    'curl'
    'git'
    'glm'
    'libtool'
    'nanobind'
    'nasm'
    'ninja'
    'nlohmann-json'
    'patchelf'
    'pkgconf'
    'python312'
    'robin-map'
    'tar'
    'unzip'
    'zip'
)
provides=('lichtfeld-studio')
conflicts=('lichtfeld-studio')
options=(!lto !debug)  # !lto: CUDA gcc-14 can't link GCC 15 LTO; !debug: mixed vcpkg debug info unusable
source=("${pkgname}::git+https://github.com/MrNeRF/LichtFeld-Studio.git"
        'vcpkg::git+https://github.com/microsoft/vcpkg.git'
        'lichtfeld-studio.desktop')
sha256sums=('SKIP'
            'SKIP'
            'a07642f575ad454ef6783e0a49d03afc96cc7df14d82db7a9de2ccad045fde65')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
    cd "$pkgname"

    git submodule update --init --recursive

    # Bootstrap vcpkg (makepkg manages clone/fetch via source array).
    # Copy instead of symlink: bootstrap downloads binary to vcpkg/vcpkg
    # which collides with the symlink target path.
    rm -rf vcpkg
    cp -a "$srcdir/vcpkg" vcpkg
    rm -f vcpkg/vcpkg  # remove stale binary/symlink so bootstrap can write fresh
    rm -f vcpkg/.git/refs/remotes/origin/patch-2026-04-02  # remove stale remote-tracking ref (deleted upstream)
    ./vcpkg/bootstrap-vcpkg.sh -disableMetrics

    # Skip vcpkg debug builds (we only use release libs);
    # strip $srcdir from __FILE__ macros in vcpkg-built libs
    cat >> vcpkg/triplets/x64-linux.cmake <<EOF
set(VCPKG_BUILD_TYPE release)
set(VCPKG_C_FLAGS "-ffile-prefix-map=${srcdir}/=")
set(VCPKG_CXX_FLAGS "-ffile-prefix-map=${srcdir}/=")
EOF

    # Remove $srcdir reference from binary (PROJECT_ROOT_PATH is a dev fallback;
    # production path resolution uses exe/../share/LichtFeld-Studio/ which works with FHS)
    sed -i 's|get_filename_component(PROJ_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}" ABSOLUTE)|set(PROJ_ROOT_DIR "/usr/share/LichtFeld-Studio")|' CMakeLists.txt

    # Remove dev-only fallback paths that leak $srcdir into binaries
    # (runtime uses FHS paths from getAssetsDir()/getShadersDir(); these are #ifdef guards)
    sed -i '/PROJECT_ROOT_PATH="\${PROJECT_SOURCE_DIR}"/d;
            /VISUALIZER_.*_PATH="\${VISUALIZER_BUILD_RESOURCE_DIR}/d;
            /VISUALIZER_SOURCE_.*_PATH="\${VISUALIZER_SOURCE_RESOURCE_DIR}/d' \
        src/visualizer/CMakeLists.txt
    sed -i '/SHADER_PATH="\${RENDERING_BUILD_RESOURCE_DIR}/d;
            /RENDERING_SOURCE_SHADER_PATH="\${RENDERING_SOURCE_RESOURCE_DIR}/d' \
        src/rendering/CMakeLists.txt
    # Use the packaged interpreter path instead of whatever build-local Python
    # path CMake resolved.
    sed -i 's|LFS_PYTHON_EXECUTABLE="\${Python_EXECUTABLE}"|LFS_PYTHON_EXECUTABLE="/usr/bin/python3.12"|' \
        src/python/CMakeLists.txt

    # Trim vcpkg.json to only deps without system equivalents.
    # Everything else comes from Arch packages (faster build, smaller footprint).
    python3.12 -c "
import json
with open('vcpkg.json') as f:
    cfg = json.load(f)

# Keep only deps that have no system equivalent or feature gaps
keep = {
    'imgui',              # needs docking-experimental branch
    'implot',             # must match vcpkg imgui
    'glad',               # Arch package is generator only
    'rmlui',              # AUR package lacks SVG feature
    'args',               # tiny, no Arch package
    'nativefiledialog-extended',  # no Arch package
    'usd',                # OpenUSD, no Arch package
}

cfg['dependencies'] = [
    d for d in cfg['dependencies']
    if (d if isinstance(d, str) else d['name']) in keep
]

with open('vcpkg.json', 'w') as f:
    json.dump(cfg, f, indent=2)
"
}

build() {
    cd "$pkgname"

    export VCPKG_ROOT="$srcdir/$pkgname/vcpkg"
    export PATH="/opt/cuda/bin:$PATH"

    local _nanobind_dir
    _nanobind_dir=$(dirname "$(readlink -f /usr/lib/cmake/nanobind/nanobind-config.cmake)")

    # nvcc needs a host compiler within CUDA's supported range. Arch's cuda package
    # strips the gcc-version guard from host_config.h, so on a current system nvcc
    # silently uses the system gcc (16), which CUDA <= 13.3 rejects (host_config.h
    # caps at gcc 15) -> deep, non-obvious compile failures. Pin the CUDA host
    # compiler to the exact gcc the installed cuda depends on (gcc15 for cuda 13.3,
    # gcc14 for cuda-pascal). Non-CUDA C++ is unaffected and keeps the system compiler.
    local _cuda_pkg _cuda_gcc _cuda_host_cxx
    _cuda_pkg=$(pacman -Qoq /opt/cuda/bin/nvcc)
    _cuda_gcc=$(pacman -Qi "$_cuda_pkg" | grep -oP '\bgcc\K[0-9]+' | head -1)
    _cuda_host_cxx="/usr/bin/g++-${_cuda_gcc}"
    [[ -x "$_cuda_host_cxx" ]] || _cuda_host_cxx="/opt/cuda/bin/g++"
    echo "==> CUDA host compiler: $_cuda_host_cxx (from $_cuda_pkg -> gcc$_cuda_gcc)"

    cmake -B build \
        -DCUDAToolkit_ROOT=/opt/cuda \
        -DCMAKE_CUDA_HOST_COMPILER="${_cuda_host_cxx}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_RPATH=/usr/lib \
        -DCMAKE_C_FLAGS="-ffile-prefix-map=${srcdir}/=" \
        -DCMAKE_CXX_FLAGS="-ffile-prefix-map=${srcdir}/=" \
        -DCMAKE_CUDA_FLAGS="-Xcompiler=-ffile-prefix-map=${srcdir}/=" \
        -DBUILD_PYTHON_STUBS=OFF \
        -DBUILD_TESTS=OFF \
        -DPython_EXECUTABLE=/usr/bin/python3.12 \
        -DPython_ROOT_DIR=/usr \
        -DPython_FIND_STRATEGY=LOCATION \
        -Dnanobind_DIR="${_nanobind_dir}" \
        -G Ninja

    cmake --build build
}

package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" cmake --install build

    # License to proper FHS location (upstream installs to prefix root)
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    rm -f "$pkgdir/usr/LICENSE"

    # Upstream resolves embedded Python modules from /usr/lib/python.
    if [[ -d "$pkgdir/python" ]]; then
        install -d "$pkgdir/usr/lib"
        mv "$pkgdir/python" "$pkgdir/usr/lib/python"
    fi

    # liblfs_rmlui.so is built but not installed by cmake
    install -Dm755 build/liblfs_rmlui.so -t "$pkgdir/usr/lib/"

    # OpenUSD shared libs (vcpkg-built, not installed by cmake but needed at runtime
    # by liblfs_mcp.so). Exact transitive closure from readelf NEEDED walk.
    local _vcpkg_lib="build/vcpkg_installed/x64-linux/lib"
    local _usd_libs=(
        libusd_ar libusd_arch libusd_gf libusd_js libusd_kind libusd_pcp
        libusd_plug libusd_sdf libusd_tf libusd_trace libusd_ts libusd_usd
        libusd_usdGeom libusd_usdVol libusd_vt libusd_work
    )
    for _lib in "${_usd_libs[@]}"; do
        install -Dm755 "$_vcpkg_lib/$_lib.so" -t "$pkgdir/usr/lib/"
    done

    # Fix RUNPATH: replace vcpkg build paths with /usr/lib
    for f in $(find "$pkgdir" -type f \( -name '*.so' -o -name '*.so.*' -o -executable \)); do
        if readelf -d "$f" 2>/dev/null | grep -q RUNPATH; then
            local _rpath
            _rpath=$(patchelf --print-rpath "$f" 2>/dev/null) || continue
            # Replace build-tree and unnecessary absolute CUDA paths; ldconfig
            # already exposes CUDA libs from the system package.
            _rpath=$(echo "$_rpath" | tr ':' '\n' | grep -v "$srcdir" | grep -v '^/opt/cuda/' | paste -sd:)
            [[ -z "$_rpath" ]] && _rpath="/usr/lib"
            patchelf --set-rpath "$_rpath" "$f"
        fi
    done

    # Remove bundled uv (users should use system uv)
    rm -f "$pkgdir/usr/bin/uv"

    # Remove development headers (not needed for end users)
    rm -rf "$pkgdir/usr/include"

    # Desktop entry and icon (upstream doesn't ship these)
    install -Dm644 "$srcdir/lichtfeld-studio.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 src/visualizer/gui/assets/icon/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/lichtfeld-studio.svg"
}
