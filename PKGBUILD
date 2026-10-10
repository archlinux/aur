# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=lichtfeld-studio
pkgver=0.5.4
pkgrel=1
pkgdesc="Real-time 3D Gaussian Splatting studio for point cloud visualization and editing"
arch=('x86_64')
url="https://github.com/MrNeRF/LichtFeld-Studio"
license=('GPL-3.0-only')
depends=(
    'assimp'
    'boost'
    'cuda'
    'dbus'
    'ffmpeg'
    'freetype2'
    'gcc-libs'
    'glibc'
    'gtk3'  # libgtk-3/libgdk-3, linked via nativefiledialog-extended's GTK backend
    'hicolor-icon-theme'
    'libarchive'
    'libdeflate'  # find_package(libdeflate CONFIG); links libdeflate.so
    'libglvnd'
    'libwebp'
    'nvidia-utils'  # driver >= 570 required at runtime
    'openimageio'
    'onetbb'
    'openssl'
    'python'
    'python-packaging'
    'sdl3'
    'spdlog'
    'vulkan-icd-loader'  # libvulkan.so (volk loads it; find_package(Vulkan))
    'zeromq'  # libzmq.so for the TCP/cppzmq layer
)
makedepends=(
    'autoconf'
    'autoconf-archive'
    'automake'
    'cmake>=3.30'
    'cppzmq'  # header-only ZMQ C++ binding, ships cppzmqConfig.cmake
    'curl'
    'git'
    'glm'
    'libtool'
    'nasm'
    'ninja'
    'nlohmann-json'
    'patchelf'
    'pkgconf'
    'python'
    'robin-map'
    'tar'
    'unzip'
    'volk'  # find_package(volk CONFIG); header-only loader
    'vulkan-headers'  # find_package(Vulkan) + VMA/volk compile against these
    'zip'
)
provides=('lichtfeld-studio')
conflicts=('lichtfeld-studio-git')
options=(!lto !debug)  # !lto: CUDA gcc-14 can't link GCC 15 LTO; !debug: mixed vcpkg debug info unusable
_libvtermcommit=934bc2fbf21800ac3458a499df8820ca5fb45fd3
# Upstream pins nanobind 2.12.0 in vcpkg overrides; Arch ships 3.x, whose
# ndarray_traits API the embedded module still specializes. Header-only, so the
# source tree's cmake/nanobind-config.cmake is consumed directly.
_nanobind_ver=2.12.0
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MrNeRF/LichtFeld-Studio/archive/refs/tags/v${pkgver}.tar.gz"
        'vcpkg::git+https://github.com/microsoft/vcpkg.git'
        "libvterm-${_libvtermcommit}.tar.gz::https://github.com/neovim/libvterm/archive/${_libvtermcommit}.tar.gz"
        "nanobind-${_nanobind_ver}.tar.gz::https://github.com/wjakob/nanobind/archive/refs/tags/v${_nanobind_ver}.tar.gz"
        'lichtfeld-studio.desktop')
sha256sums=('83186ff8d85d44284e6c23c9c9333d6c73a94c2e52bbd35134f2d011cf45fb74'
            'SKIP'
            'f09525eb2a02679be0eb50bc1c294569e8cbaa4b59fb867d606236de2830045f'
            '01f1f0cd0398743c18f33d07ae36ad410bd7f4a1e90683b508504de897d6e629'
            'a07642f575ad454ef6783e0a49d03afc96cc7df14d82db7a9de2ccad045fde65')

latestver() {
    curl -fsSL "https://api.github.com/repos/MrNeRF/LichtFeld-Studio/tags" |
        jq -r '.[]?.name | select(startswith("v"))' |
        head -n1 | sed 's/^v//'
}

prepare() {
    cd "LichtFeld-Studio-${pkgver}"

    # Populate libvterm (submodule not included in release tarball)
    rm -rf external/libvterm
    cp -a "$srcdir/libvterm-${_libvtermcommit}" external/libvterm

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

    # Remove dev-only fallback paths that leak $srcdir into binaries
    # (runtime uses FHS paths from getAssetsDir()/getShadersDir(); these are #ifdef guards)
    # PROJECT_ROOT_PATH is used unguarded in shipped sources, so repoint it at
    # the installed prefix instead of dropping the definition.
    sed -i 's|PROJECT_ROOT_PATH="${PROJECT_SOURCE_DIR}"|PROJECT_ROOT_PATH="/usr/share/LichtFeld-Studio"|;
            /VISUALIZER_.*_PATH="\${VISUALIZER_BUILD_RESOURCE_DIR}/d;
            /VISUALIZER_SOURCE_.*_PATH="\${VISUALIZER_SOURCE_RESOURCE_DIR}/d' \
        src/visualizer/CMakeLists.txt
    # Use the packaged interpreter path instead of whatever build-local Python
    # path CMake resolved.
    sed -i 's|LFS_PYTHON_EXECUTABLE="\${Python_EXECUTABLE}"|LFS_PYTHON_EXECUTABLE="/usr/bin/python3"|' \
        src/python/CMakeLists.txt

    # Point the vulkan rasterizer's dev SPV fallback at the installed shaders
    # instead of the build tree (unconditional compile def; runtime primary is
    # already getResourceBaseDir()/shaders/vulkan_rasterizer via FHS).
    sed -i 's|LFS_VULKAN_RASTERIZER_DEV_SPV_DIR="\${LFS_VULKAN_RASTERIZER_SPV_DIR}/"|LFS_VULKAN_RASTERIZER_DEV_SPV_DIR="/usr/share/LichtFeld-Studio/shaders/vulkan_rasterizer/"|' \
        src/rendering/rasterizer/vulkan/CMakeLists.txt

    # Trim vcpkg.json to only deps without system equivalents.
    # Everything else comes from Arch packages (faster build, smaller footprint).
    /usr/bin/python -c "
import json
with open('vcpkg.json') as f:
    cfg = json.load(f)

# Keep only deps that have no system equivalent or feature gaps
keep = {
    'rmlui',              # AUR package lacks SVG feature
    'args',               # tiny, no Arch package
    'nativefiledialog-extended',  # no Arch package
    'vulkan-memory-allocator',  # not in official Arch repos
    'shader-slang',       # not in official Arch (cachyos-only); provides slangc tool
    'glslang',            # visualizer FORCE-pins glslang_DIR to the vcpkg dir
    'xxhash',             # Arch ships only libxxhash.pc, no CMake config for find_package(xxHash CONFIG)
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
    cd "LichtFeld-Studio-${pkgver}"

    export VCPKG_ROOT="$srcdir/LichtFeld-Studio-${pkgver}/vcpkg"
    export PATH="/opt/cuda/bin:$PATH"

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
        -DLFS_DEV_IMPORT_SOURCE_RESOURCES=OFF \
        -DLFS_DEV_IMPORT_SOURCE_PYTHON=OFF \
        -DPython_EXECUTABLE=/usr/bin/python3 \
        -DPython_ROOT_DIR=/usr \
        -DPython_FIND_STRATEGY=LOCATION \
        -Dnanobind_DIR="$srcdir/nanobind-${_nanobind_ver}/cmake" \
        -G Ninja

    cmake --build build
}

package() {
    cd "LichtFeld-Studio-${pkgver}"
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

    # Vendored OpenMesh libs (built under build/Build/lib, not installed by cmake;
    # needed at runtime by the main binary and the python module). No Arch package.
    install -Dm755 build/Build/lib/libOpenMeshCore.so.11.0 \
        build/Build/lib/libOpenMeshTools.so.11.0 -t "$pkgdir/usr/lib/"

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
