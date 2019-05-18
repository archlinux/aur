# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=d9vk-winelib-git
pkgver=r2924.58669173
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
    "setup_dxvk.patch"
    "dxvk-async.patch"
)
sha256sums=(
    "SKIP"
    "7147644664ef33d04f7b18683c47be95b5664c57cf6d63fdc019d915deebd37a"
    "4e74b2d921c38ca0f9c5a6069501e9d15c7c076dcd6d41ae243830375115b8f9"
    "32780432c2159d57ca0fb1863309cdb141fbfc506c6b9003acfa05896af90140"
)

pkgver() {
    cd d9vk
    #printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/m//g')"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd d9vk
    patch -p1 -i ../setup_dxvk.patch

    # Uncomment to enable dxvk async patch.
    # Enable at your own risk, if you don't know what it is,
    # leave it as is. You have been warned.
    #patch -p1 -i ../dxvk-async.patch
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
