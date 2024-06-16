# Maintainer: DigitOtter <digitotter@protonmail.com>
pkgname=texture-share-vk-git
pkgver=v0.2.0.r2.gb0e2994
pkgrel=1
pkgdesc="Library for GPU image sharing for Vulkan and OpenGL"
arch=( 'any' )
url='https://github.com/DigitOtter/texture-share-vk.git'
license=( 'MIT' )
groups=()
depends=( 'vulkan-icd-loader' 'boost' 'libglvnd' )
makedepends=( 'vulkan-headers' 'git' 'cmake' 'gcc' 'cargo-nightly' )
options=( '!lto' )
provides=( 'texture-share-vk' )
conflicts=(  'texture-share-vk' )
source=( "${pkgname}::git+https://github.com/DigitOtter/texture-share-vk.git#branch=master" )
sha256sums=( 'SKIP' )

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname}"
    git submodule update --init --recursive

    export RUSTUP_TOOLCHAIN=nightly
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=nightly
    cmake -B build -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DRust_TOOLCHAIN="nightly" \
        -DINSTALL_VK_BOOTSTRAP=false \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}

