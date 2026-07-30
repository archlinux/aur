# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=lichtfeld-studio-git
pkgver=0.5.3.r163.g32ded4bd8
pkgrel=1
pkgdesc="Real-time 3D Gaussian Splatting studio for point cloud visualization and editing"
arch=('x86_64')
url="https://github.com/MrNeRF/LichtFeld-Studio"
license=('GPL-3.0-only')
depends=(
    'assimp'
    'cuda'
    'ffmpeg'
    'gcc-libs'
    'glibc'
    'glslang'
    'gtk3'  # NFD file dialogs, linked into the main binary
    'hicolor-icon-theme'
    'libarchive'
    'libwebp'
    'nvidia-utils'  # driver >= 570 required at runtime
    'openimageio'
    'openssl'
    'python312'
    'python312-packaging'
    'sdl3'
    'spdlog'
    'vulkan-icd-loader'
    'zeromq'  # cppzmq is header-only; libzmq is linked into the main binary
)
optdepends=(
    'cudnn: GPU-accelerated MoGe-2 depth/normal inference (CPU fallback without it)'
    'uv: install Python dependencies for third-party plugins'
    'xdg-utils: open the containing folder when the file manager has no D-Bus interface'
)
makedepends=(
    'autoconf'
    'autoconf-archive'
    'automake'
    'boost'      # find_package(Boost) — headers only, nothing links libboost
    'cmake>=3.30'
    'curl'
    'freetype2'  # find_package(Freetype); RmlUi links it statically
    'git'
    'glm'
    'libtool'
    'nanobind'
    'nasm'
    'ninja'
    'nlohmann-json'
    'onetbb'     # find_package(TBB); no shipped ELF links libtbb
    'patchelf'
    'pkgconf'
    'python312'
    'robin-map'
    'shader-slang'  # slangc; shader-slang-bin also provides it
    'tar'
    'unzip'
    'volk'
    'vulkan-headers'
    'zip'
)
provides=('lichtfeld-studio')
conflicts=('lichtfeld-studio')
options=(!lto !debug)  # !lto: CUDA gcc-14 can't link GCC 15 LTO; !debug: mixed vcpkg debug info unusable

# Archives upstream's cmake fetches itself. Declaring them here gets makepkg's
# checksum and source cache; prepare() asserts each pin still matches upstream.
# This does not make the build offline: vcpkg still fetches its own ports.
_nfd_ver=1.3.0
_onnx_ver=1.23.2
_uv_ver=0.10.2
_nvjpeg2k_ver=0.9.0.43
_nvjpeg2k_archive="libnvjpeg_2k-linux-x86_64-${_nvjpeg2k_ver}-archive"

source=("${pkgname}::git+https://github.com/MrNeRF/LichtFeld-Studio.git"
        'vcpkg::git+https://github.com/microsoft/vcpkg.git'
        'libvterm::git+https://github.com/neovim/libvterm.git'
        'lichtfeld-studio.desktop'
        "nativefiledialog-extended-${_nfd_ver}.tar.gz::https://github.com/btzy/nativefiledialog-extended/archive/v${_nfd_ver}.tar.gz"
        "${_nvjpeg2k_archive}.tar.xz::https://developer.download.nvidia.com/compute/nvjpeg2000/redist/libnvjpeg_2k/linux-x86_64/${_nvjpeg2k_archive}.tar.xz"
        "onnxruntime-linux-x64-gpu-${_onnx_ver}.tgz::https://github.com/microsoft/onnxruntime/releases/download/v${_onnx_ver}/onnxruntime-linux-x64-gpu-${_onnx_ver}.tgz"
        "uv-${_uv_ver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/astral-sh/uv/releases/download/${_uv_ver}/uv-x86_64-unknown-linux-gnu.tar.gz")
# The last two are consumed as archives from LFS_DOWNLOAD_CACHE_DIR, not as trees.
noextract=("onnxruntime-linux-x64-gpu-${_onnx_ver}.tgz"
           "uv-${_uv_ver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'a07642f575ad454ef6783e0a49d03afc96cc7df14d82db7a9de2ccad045fde65'
            '2fea19102cf4d5283a80fb87a784792166988e85bb92baa962d34f72b22dcc1a'
            '1d26f62a7141e81c604342a610deb8ad8d10e1c08cb59598881dc201e59f21a3'
            '2083e361072a79ce16a90dcd5f5cb3ab92574a82a3ce0ac01e5cfa3158176f53'
            '6aa4576c31f791c0b9d4739e256d07358d45e7535695287fec03cf6839e25512')

pkgver() {
    cd "$pkgname"
    # --match: upstream also pushes non-release tags (model-moge2-v1), and an
    # unfiltered describe picks those up, producing a pkgver that vercmp sorts
    # BELOW the previous release -> pacman sees a downgrade and offers no update.
    git describe --long --tags --match 'v[0-9]*' | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
    cd "$pkgname"

    # Resolve submodules to the makepkg-declared local clones instead of the
    # network. The rewrites must be passed with -c: written via `git config`
    # they land in this repository's local config, which the separate
    # `git clone` process fetching each submodule never reads.
    local _source _source_name _source_url
    local -a _local_urls=()
    for _source in "${source[@]}"; do
        [[ $_source == *::git+* ]] || continue
        _source_name=${_source%%::*}
        _source_url=${_source#*::}
        _source_url=${_source_url#git+}
        _source_url=${_source_url%%#*}
        _local_urls+=(-c "url.${srcdir}/${_source_name}.insteadOf=${_source_url}")
    done

    if ! git "${_local_urls[@]}" -c protocol.allow=never -c protocol.file.allow=always \
        submodule update --init --recursive; then
        msg 'Submodule update failed; add its repository to source=() first.'
        return 1
    fi

    # source=() pins the same versions upstream's cmake pins. Both the download
    # cache and FETCHCONTENT_SOURCE_DIR take precedence over upstream's URL, so a
    # pin that moved here would silently build the declared version instead of
    # the wanted one. Fail with the new value rather than ship the mismatch.
    local _what _want _got
    while read -r _what _want _got; do
        [[ $_want == "$_got" ]] && continue
        error "$_what pin moved: PKGBUILD has '$_want', upstream wants '$_got'"
        return 1
    done <<EOF
nativefiledialog $_nfd_ver $(sed -nE 's|.*nativefiledialog-extended/archive/v([0-9.]+)\.tar\.gz.*|\1|p' cmake/SetupNativeFileDialog.cmake | head -1)
onnxruntime $_onnx_ver $(sed -nE 's|.*LFS_ONNXRUNTIME_VERSION "([^"]+)".*|\1|p' cmake/SetupOnnxRuntime.cmake | head -1)
uv $_uv_ver $(sed -nE 's|.*UV_VERSION "([^"]+)".*|\1|p' cmake/FetchUV.cmake | head -1)
nvjpeg2k $_nvjpeg2k_ver $(sed -nE 's|.*libnvjpeg_2k-linux-x86_64-([0-9.]+)-archive.*|\1|p' external/nvImageCodec/cmake/Dependencies.cmake | head -1)
EOF

    # Upstream defaults its download cache to ~/.cache/lichtfeld, which puts 252M
    # outside the build tree where no clean reaches it. Keep it in $srcdir and
    # seed it with the declared archives so cmake finds them instead of fetching.
    # Symlinks, not copies: cmake only hashes and reads these, and the onnxruntime
    # archive alone is 250M.
    install -d "$srcdir/download-cache"
    ln -sf "$srcdir/onnxruntime-linux-x64-gpu-${_onnx_ver}.tgz" \
           "$srcdir/uv-${_uv_ver}-x86_64-unknown-linux-gnu.tar.gz" \
           "$srcdir/download-cache/"

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

    # Keep dev-only fallback paths from leaking $srcdir into binaries. The
    # VISUALIZER_* ones are #ifdef-guarded and can go, but PROJECT_ROOT_PATH is
    # referenced unconditionally (python_lsp_client.cpp, python_editor.cpp), so
    # it must be repointed at the install prefix rather than deleted.
    sed -i 's|PROJECT_ROOT_PATH="\${PROJECT_SOURCE_DIR}"|PROJECT_ROOT_PATH="/usr/share/LichtFeld-Studio"|;
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

# Deps taken from Arch packages; everything else stays with vcpkg. This is a
# blocklist on purpose: a whitelist silently drops whatever upstream adds next,
# which breaks the build rather than merely making it bigger.
system = {
    'cppzmq', 'curl', 'assimp', 'boost-preprocessor', 'ffmpeg', 'freetype',
    'glm', 'libarchive', 'libdeflate', 'libplacebo', 'libwebp', 'nanobind',
    'nlohmann-json', 'openimageio', 'python3', 'sdl3', 'spdlog', 'tbb',
    'vulkan', 'vulkan-loader', 'volk', 'glslang', 'shader-slang',
}
# usd stays with vcpkg: Arch builds OpenUSD monolithically and its plugin
# configs (MaterialX, Alembic) name targets they never find_dependency, so
# consuming it means carrying a workaround per plugin.

def dep_name(d):
    return d if isinstance(d, str) else d['name']

deps = [d for d in cfg['dependencies'] if dep_name(d) not in system]

# The RmlUi Vulkan backend includes stb_image.h, which upstream's manifest never
# declares: with the full manifest it arrives transitively via a port above.
if not any(dep_name(d) == 'stb' for d in deps):
    deps.append('stb')

cfg['dependencies'] = deps

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

    # upstream's find_program(SLANGC ... REQUIRED) searches PATH, which the
    # shader-slang-bin provider does not use (it installs under /opt), so seed
    # the cache variable instead of relying on either provider's layout.
    local _slangc
    _slangc=$(command -v slangc || true)
    [[ -n "$_slangc" ]] || _slangc=/opt/shader-slang-bin/bin/slangc
    [[ -x "$_slangc" ]] || { error "slangc not found; install shader-slang or shader-slang-bin"; return 1; }
    echo "==> slangc: $_slangc"

    # The nvjpeg2k runtime is looked up at a hardcoded
    # $CMAKE_BINARY_DIR/_deps/nvjpeg2k_headers-src/lib/<cuda major>, ignoring the
    # FetchContent source dir, so point that path at the declared redist as well.
    # Without this the copy is skipped and only a configure-time warning says so.
    install -d build/_deps
    ln -sfn "$srcdir/${_nvjpeg2k_archive}" build/_deps/nvjpeg2k_headers-src

    cmake -B build \
        -DSLANGC="${_slangc}" \
        -DLFS_DOWNLOAD_CACHE_DIR="$srcdir/download-cache" \
        -DFETCHCONTENT_SOURCE_DIR_NATIVEFILEDIALOG_EXTENDED="$srcdir/nativefiledialog-extended-${_nfd_ver}" \
        -DFETCHCONTENT_SOURCE_DIR_NVJPEG2K_HEADERS="$srcdir/${_nvjpeg2k_archive}" \
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

    # OpenMesh is built from external/OpenMesh and likewise not installed;
    # liblfs_core.so and the python module carry NEEDED entries for it.
    install -Dm755 build/Build/lib/libOpenMesh*.so.* -t "$pkgdir/usr/lib/"

    # Vendored USD and ONNX Runtime keep their upstream sonames and plugin
    # layout, so in /usr/lib they collide with the official usd (62 files) and
    # onnxruntime (4 files) packages. Both locate their own resources relative
    # to the library that loads them -- USD derives its plugInfo search path
    # from libusd_plug.so, ONNX Runtime loads its providers from its own
    # directory -- so the payload relocates as a unit and is reached via RUNPATH.
    local _privdir="$pkgdir/usr/lib/lichtfeld-studio"
    install -d "$_privdir"
    mv "$pkgdir/usr/lib/usd" "$_privdir/usd"
    mv "$pkgdir"/usr/lib/libonnxruntime*.so* "$_privdir/"

    # OpenUSD shared libs (vcpkg-built, not installed by cmake but needed at runtime
    # by liblfs_mcp.so). Exact transitive closure from readelf NEEDED walk.
    local _vcpkg_lib="build/vcpkg_installed/x64-linux/lib"
    local _usd_libs=(
        libusd_ar libusd_arch libusd_gf libusd_js libusd_kind libusd_pcp
        libusd_plug libusd_sdf libusd_tf libusd_trace libusd_ts libusd_usd
        libusd_usdGeom libusd_usdVol libusd_vt libusd_work
    )
    for _lib in "${_usd_libs[@]}"; do
        install -Dm755 "$_vcpkg_lib/$_lib.so" -t "$_privdir/"
    done

    # Drop vcpkg build-tree and absolute CUDA paths (ldconfig already exposes the
    # CUDA libs), then point every ELF at the private lib dir. Files with no
    # RUNPATH get one too, since that is where the vendored payload now lives.
    local f _rpath
    while IFS= read -r f; do
        readelf -h "$f" &>/dev/null || continue
        _rpath=$(patchelf --print-rpath "$f" 2>/dev/null) || continue
        _rpath=$(echo "$_rpath" | tr ':' '\n' \
            | grep -v "$srcdir" | grep -v '^/opt/cuda/' | grep -v '^$' | paste -sd:)
        patchelf --set-rpath "${_rpath:+$_rpath:}/usr/lib/lichtfeld-studio" "$f"
    done < <(find "$pkgdir" -type f \( -name '*.so' -o -name '*.so.*' -o -executable \))

    # Drop the uv that cmake downloads and installs to bin/: it would collide
    # with the uv package. PackageManager::uv_path() looks for <exe_dir>/uv,
    # which for /usr/bin/LichtFeld-Studio is exactly where that package puts it,
    # so the optdepend covers the feature without vendoring a second copy.
    rm -f "$pkgdir/usr/bin/uv"

    # Remove development headers (not needed for end users)
    rm -rf "$pkgdir/usr/include"

    # Desktop entry and icon (upstream doesn't ship these)
    install -Dm644 "$srcdir/lichtfeld-studio.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 src/visualizer/gui/assets/icon/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/lichtfeld-studio.svg"
}
