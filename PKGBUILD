# Maintainer: Brian Thompson <brianrobt at pm dot me>

pkgname=stable-diffusion.cpp-vulkan-git
pkgver=r279.49d6570
pkgrel=1
pkgdesc="Stable Diffusion and Flux in pure C/C++ (Vulkan version)"
license=("MIT")
depends=(
    "gcc-libs"
    "glibc"
    "vulkan-icd-loader"
    "vulkan-validation-layers"
)
makedepends=(
    "cmake"
    "git"
    "vulkan-headers"
    "shaderc"
)
arch=("x86_64")
url="https://github.com/leejet/stable-diffusion.cpp"
provides=("stable-diffusion.cpp")
conflicts=("stable-diffusion.cpp")
source=("git+https://github.com/leejet/stable-diffusion.cpp.git"
        "git+https://github.com/ggerganov/ggml.git")
        # "001-fix-shared-lib-install.diff")
sha256sums=('SKIP'
            'SKIP')
            # '24954814b385350ca52e7ee5b29f89e66ade873aadb27cd302bfa6ce50ef11a3')

prepare() {
    cd "$srcdir/stable-diffusion.cpp"
    git submodule init
    git config submodule.ggml.url "$srcdir/ggml"
    git -c protocol.file.allow=always submodule update
    # git apply ../001-fix-shared-lib-install.diff
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
        -DSD_CUBLAS=OFF \
        -DSD_HIPBLAS=OFF \
        -DSD_METAL=OFF \
        -DSD_VULKAN=ON \
        -DSD_SYCL=OFF \
        -DSD_FLASH_ATTN=ON \
        -DSD_FAST_SOFTMAX=OFF \
        -DSD_BUILD_SHARED_LIBS=ON
    cmake --build build-vulkan
}

package() {
    DESTDIR="$pkgdir" cmake --install build-vulkan
    install -Dm644 stable-diffusion.cpp/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 build-vulkan/bin/libstable-diffusion.so \
	    "$pkgdir/usr/lib"

    # Changing package name since it conflicts with an existing tool: https://github.com/leejet/stable-diffusion.cpp/issues/750
    mv "$pkgdir/usr/bin/sd" "$pkgdir/usr/bin/stable-diffusion"

    # Remove ggml contents
    rm -r "$pkgdir/usr/include" \
          "$pkgdir/usr/lib/libggml.a"
}