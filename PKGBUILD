# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=d9vk-winelib-git
pkgver=r2933.d112de83
pkgrel=1
pkgdesc="A d3d9 to vk layer based off DXVK's codebase, winelib version"
arch=('x86_64')
url="https://github.com/Joshua-Ashton/d9vk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader' 'bash')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git' 'wine')
provides=("d9vk")
conflicts=("d9vk")
source=(
    "git+https://github.com/Joshua-Ashton/d9vk.git"
    "setup_d9vk"
)
sha256sums=(
    "SKIP"
    "7147644664ef33d04f7b18683c47be95b5664c57cf6d63fdc019d915deebd37a"
)

pkgver() {
    cd d9vk
    #printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/m//g')"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    meson d9vk "build/x64" \
        --cross-file d9vk/build-wine64.txt \
        --prefix "/usr/share/d9vk/x64" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
        -Denable_tests=false \
        -Denable_d3d10=false \
        -Denable_d3d11=false \
        -Denable_dxgi=false
    ninja -C "build/x64" -v

    meson d9vk "build/x32" \
        --cross-file d9vk/build-wine32.txt \
        --prefix "/usr/share/d9vk/x32" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
        -Denable_tests=false \
        -Denable_d3d10=false \
        -Denable_d3d11=false \
        -Denable_dxgi=false
    ninja -C "build/x32" -v
}

package() {
    DESTDIR="$pkgdir" ninja -C "build/x32" install
    DESTDIR="$pkgdir" ninja -C "build/x64" install
    install -Dm 755 -t "$pkgdir/usr/share/d9vk" d9vk/setup_dxvk.sh
    install -Dm 644 -t "$pkgdir/usr/share/doc/d9vk" d9vk/dxvk.conf
    install -Dm 644 -t "$pkgdir/usr/share/$pkgname" d9vk/LICENSE
    install -Dm 755 -t "$pkgdir/usr/bin" setup_d9vk
}
