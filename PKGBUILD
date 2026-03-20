# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=lichtfeld-studio-git
pkgver=0.5.0.r13.g79bba426
pkgrel=1
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
    'glm'
    'hicolor-icon-theme'
    'libarchive'
    'libglvnd'
    'libwebp'
    'nlohmann-json'
    'nvidia-utils'  # driver >= 570 required at runtime
    'openimageio'
    'onetbb'
    'python'
    'sdl3'
    'spdlog'
)
makedepends=(
    'autoconf'
    'autoconf-archive'
    'automake'
    'cmake>=3.30'
    'cuda'
    'curl'
    'git'
    'libtool'
    'nasm'
    'ninja'
    'pkgconf'
    'python'
    'tar'
    'unzip'
    'zip'
)
provides=('lichtfeld-studio')
conflicts=('lichtfeld-studio')
options=(!lto !debug)  # !lto: CUDA gcc-14 can't link GCC 15 LTO; !debug: mixed vcpkg debug info unusable
source=("${pkgname}::git+https://github.com/MrNeRF/LichtFeld-Studio.git"
        'lichtfeld-studio.desktop')
sha256sums=('SKIP'
            'a07642f575ad454ef6783e0a49d03afc96cc7df14d82db7a9de2ccad045fde65')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive

    # Bootstrap vcpkg for deps without system equivalents
    if [[ ! -d vcpkg ]]; then
        git clone https://github.com/microsoft/vcpkg.git
    fi
    ./vcpkg/bootstrap-vcpkg.sh -disableMetrics

    # Fix vendored zep missing <cstdint> for GCC 15
    sed -i '5i #include <cstdint>' external/zep/include/zep/glyph_iterator.h

    # Remove $srcdir reference from binary (PROJECT_ROOT_PATH is a dev fallback;
    # production path resolution uses exe/../share/LichtFeld-Studio/ which works with FHS)
    sed -i 's|get_filename_component(PROJ_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}" ABSOLUTE)|set(PROJ_ROOT_DIR "/usr/share/LichtFeld-Studio")|' CMakeLists.txt

    # Trim vcpkg.json to only deps without system equivalents.
    # Everything else comes from Arch packages (faster build, smaller footprint).
    python3 -c "
import json
with open('vcpkg.json') as f:
    cfg = json.load(f)

# Keep only deps that have no system equivalent or feature gaps
keep = {
    'imgui',              # needs docking-experimental branch
    'implot',             # must match vcpkg imgui
    'glad',               # Arch package is generator only
    'rmlui',              # AUR package lacks SVG feature
    'python3',            # embedded interpreter, version-sensitive
    'nanobind',           # must match vcpkg python version
    'args',               # tiny, no Arch package
    'nativefiledialog-extended',  # no Arch package
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

    cmake -B build \
        -DCUDAToolkit_ROOT=/opt/cuda \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_RPATH=/usr/lib \
        -DBUILD_CUDA_PTX_ONLY=ON \
        -DBUILD_CUDA_MIN_SM=75 \
        -DBUILD_TESTS=OFF \
        -G Ninja

    cmake --build build
}

package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" cmake --install build

    # License to proper FHS location (upstream installs to prefix root)
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    rm -f "$pkgdir/usr/LICENSE"

    # Python modules installed to prefix root instead of /usr/lib/python/
    if [[ -d "$pkgdir/python" ]]; then
        mkdir -p "$pkgdir/usr/lib/lichtfeld-studio"
        mv "$pkgdir/python" "$pkgdir/usr/lib/lichtfeld-studio/python"
    fi

    # liblfs_rmlui.so is built but not installed by cmake
    install -Dm755 build/liblfs_rmlui.so -t "$pkgdir/usr/lib/"

    # Remove bundled uv (users should use system uv)
    rm -f "$pkgdir/usr/bin/uv"

    # Remove development headers (not needed for end users)
    rm -rf "$pkgdir/usr/include"

    # Desktop entry and icon (upstream doesn't ship these)
    install -Dm644 "$srcdir/lichtfeld-studio.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 src/visualizer/gui/assets/icon/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/lichtfeld-studio.svg"
}
