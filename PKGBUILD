# Maintainer: LightDot <lightdot -a-t- server.si>
# Contributor: Brian Thompson <brianrobt at pm dot me>

pkgname=stable-diffusion.cpp-vulkan-git
pkgver=r660.d2797b8
pkgrel=1
pkgdesc="Stable Diffusion and Flux in pure C/C++ (Vulkan version)"
license=('MIT')
depends=(
    'gcc-libs'
    'glibc'
    'vulkan-icd-loader'
    'vulkan-validation-layers'
)
makedepends=(
    'cmake'
    'git'
    'shaderc'
    'spirv-headers'
    'vulkan-headers'
)
arch=('x86_64')
url="https://github.com/leejet/stable-diffusion.cpp"
provides=('stable-diffusion.cpp')
conflicts=('stable-diffusion.cpp')
source=("git+https://github.com/leejet/stable-diffusion.cpp.git"
        "git+https://github.com/ggerganov/ggml.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/stable-diffusion.cpp"
    git submodule init
    git config submodule.ggml.url "$srcdir/ggml"
    git -c protocol.file.allow=always submodule update --remote
}

pkgver() {
    cd "$srcdir/stable-diffusion.cpp"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)"
}

build() {
    # https://archlinux.org/todo/lto-fat-objects/
    CFLAGS+=" -DNDEBUG -ffat-lto-objects"
    CXXFLAGS+=" -DNDEBUG -ffat-lto-objects"
    cmake -B build-vulkan -S stable-diffusion.cpp \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSD_HIPBLAS=OFF \
        -DSD_METAL=OFF \
        -DSD_VULKAN=ON \
        -DSD_SYCL=OFF \
        -DSD_BUILD_SHARED_LIBS=ON
    cmake --build build-vulkan -- -j $(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build-vulkan
    install -Dm644 stable-diffusion.cpp/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 build-vulkan/bin/libstable-diffusion.so "$pkgdir/usr/lib"

    # Remove ggml content
    rm -r "$pkgdir/usr/include/"gg* \
          "$pkgdir/usr/lib/cmake" \
          "$pkgdir/usr/lib/"libgg*
}