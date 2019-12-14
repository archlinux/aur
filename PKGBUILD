# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=d9vk-winelib
_tag=0.40-rc-p
pkgver=${_tag//-/.}
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
    "git+https://github.com/Joshua-Ashton/d9vk.git#tag=$_tag"
    "setup_d9vk"
    "dxvk-async.patch"
)
sha256sums=(
    "SKIP"
    "7147644664ef33d04f7b18683c47be95b5664c57cf6d63fdc019d915deebd37a"
    "757fd5ca3faf476730891541de408593450fe4b490cc87bd90b342826d66c564"
)

prepare() {
    cd d9vk
    # Uncomment to enable dxvk async patch.
    # Enable at your own risk. If you don't know what it is,
    # and its implications, leave it as is. You have been warned.
    # I am not liable if anything happens to you by using it.
    #patch -p1 -i ../dxvk-async.patch
}

build() {
    meson d9vk "build/x64" \
        --cross-file d9vk/build-wine64.txt \
        --prefix "/usr/share/d9vk/x64" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
        -Denable_d3d10=false \
        -Denable_d3d11=false \
        -Denable_dxgi=false \
        -Denable_tests=false
    ninja -C "build/x64" -v

    meson d9vk "build/x32" \
        --cross-file d9vk/build-wine32.txt \
        --prefix "/usr/share/d9vk/x32" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
        -Denable_d3d10=false \
        -Denable_d3d11=false \
        -Denable_dxgi=false \
        -Denable_tests=false
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
