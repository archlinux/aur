# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=dxvk-nvapi-vkreflex-layer
pkgver=0.9.3
pkgrel=1
pkgdesc='Alternative NVAPI implementation on top of DXVK, Vulkan Reflex layer'
arch=('x86_64')
url="https://github.com/jp7677/dxvk-nvapi"
license=('MIT')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git')
source=(
    "git+https://github.com/jp7677/dxvk-nvapi.git#tag=v${pkgver}"
)

prepare() {
    cd dxvk-nvapi

    # Explicitly set origin URL for submodules using relative paths
    git remote set-url origin https://github.com/jp7677/dxvk-nvapi.git
    git submodule update --init --filter=tree:0 --recursive external/{Vulkan-Headers,vkroots}
}

build() {
    arch-meson dxvk-nvapi/layer build \
        --buildtype "release" \
        --strip \
        -Dabsolute_library_path=false

    ninja -C build -v
}

package() {
    depends=('vulkan-icd-loader')

    DESTDIR="$pkgdir" ninja -C build install
}

sha256sums=('126ea036f3bd6b215c469f7dfdb80f7fcf212d5da09eef654a5494e2f504770c')
