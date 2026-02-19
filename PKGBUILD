# Maintainer: rainy351 @ https://github.com/rainy351
pkgname=lsfg-manager-git
pkgver=r2.0.0.dev
pkgrel=1
pkgdesc="Safe manager for LSFG-VK (Explicit mode with CLI flags)"
arch=('x86_64')
url="https://github.com/rainy351/lsfg-manager"
license=('GPL3')
depends=('vulkan-icd-loader' 'qt6-base')
makedepends=('cmake' 'ninja' 'git' 'rust' 'vulkan-headers')
conflicts=('lsfg-vk-git' 'lsfg-vk')
provides=('lsfg-vk')

source=(
    'lsfg-vk::git+https://github.com/PancakeTAS/lsfg-vk#branch=develop'
    'lsfg_layer.json'
    'main.rs'
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/lsfg-vk"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/lsfg-vk"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DLSFGVK_BUILD_VK_LAYER=ON \
        -DLSFGVK_BUILD_UI=ON \
        -DLSFGVK_BUILD_CLI=ON
    cmake --build build || { echo "Сборка lsfg-vk провалилась"; exit 1; }

    rustc "$srcdir/main.rs" -O -o "$srcdir/lsfg"
}

package() {
    cd "$srcdir/lsfg-vk"

    local _so_file=$(find build -type f -name "liblsfg-vk-layer.so" | head -n1)
    if [ -z "$_so_file" ]; then
        echo "Ошибка: liblsfg-vk-layer.so не найдена!"
        exit 1
    fi
    install -Dm755 "$_so_file" "$pkgdir/usr/lib/liblsfg-vk-layer.so"

    local _ui_bin=$(find build -type f -name "lsfg-vk-ui" | head -n1)
    if [ -z "$_ui_bin" ]; then
        echo "Ошибка: lsfg-vk-ui не найден!"
        exit 1
    fi
    install -Dm755 "$_ui_bin" "$pkgdir/usr/bin/lsfg-vk-ui"

    local _cli_bin=$(find build -type f -name "lsfg-vk-cli" | head -n1)
    if [ -n "$_cli_bin" ]; then
        install -Dm755 "$_cli_bin" "$pkgdir/usr/bin/lsfg-vk-cli"
    fi

    install -Dm755 "$srcdir/lsfg" "$pkgdir/usr/bin/lsfg"

    install -Dm644 "$srcdir/lsfg_layer.json" \
        "$pkgdir/usr/share/lsfg-manager/vulkan/VkLayer_LSFGVK_frame_generation.json"
}