# Maintainer: LightDot <lightdot -a-t- server.si>
# Contributor: Brian Thompson <brianrobt at pm dot me>

pkgname=stable-diffusion.cpp-vulkan-git
_pkgname=stable-diffusion.cpp
pkgver=r827.97d2990
pkgrel=1
pkgdesc="Diffusion model (Flux, Ideogram, Krea, Lens, LTX, MiniMax, Qwen Image, SD, Wan, Z-Image...) inference in pure C/C++ (Vulkan version)"
license=('MIT')
depends=(
    'libgcc'
    'libstdc++'
    'glibc'
    'libwebp'
    'vulkan-icd-loader'
    'vulkan-validation-layers')
makedepends=(
    'cmake'
    'git'
    'pnpm'
    'shaderc'
    'spirv-headers'
    'vulkan-headers')
arch=('x86_64')
url="https://github.com/leejet/stable-diffusion.cpp"
provides=($_pkgname)
conflicts=($_pkgname)
options=(
    lto
    !debug)
source=("git+https://github.com/leejet/stable-diffusion.cpp.git"
        "git+https://github.com/leejet/ggml.git#branch=int8_convrot"
        "git+https://github.com/leejet/sdcpp-webui.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    git submodule init
    git config submodule.ggml.url "$srcdir/ggml"
    git config submodule.examples/server/frontend.url "$srcdir/sdcpp-webui"
    git -c protocol.file.allow=always submodule update --init
}

build() {
    # Embedded web UI
    pushd "$srcdir/$_pkgname/examples/server/frontend"
    pnpm install
    popd
    cmake -B build-vulkan -S $_pkgname \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_FLAGS="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DSD_BUILD_SHARED_LIBS=ON \
        -DSD_BUILD_SHARED_GGML_LIB=OFF \
        -DSD_BUILD_EXAMPLES=ON \
        -DSD_SERVER_BUILD_FRONTEND=ON \
        -DSD_WEBP=ON \
        -DSD_USE_SYSTEM_WEBP=ON \
        -DSD_WEBM=OFF \
        -DSD_HIPBLAS=OFF \
        -DSD_METAL=OFF \
        -DSD_SYCL=OFF \
        -DSD_VULKAN=ON \
        -Wno-dev
    cmake --build build-vulkan -- -j $(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build-vulkan
    install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # Remove ggml content
    rm -r "$pkgdir/usr/include/"gg* \
          "$pkgdir/usr/lib/cmake" \
          "$pkgdir/usr/lib/"libgg*
}