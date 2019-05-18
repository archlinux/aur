# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=d9vk-winelib-git
pkgver=r2920.4c337dc3
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
    "extraopts.patch"
    "dxvk-async.patch"
)
sha256sums=(
    "SKIP"
    "7147644664ef33d04f7b18683c47be95b5664c57cf6d63fdc019d915deebd37a"
    "8ebed41bc54f795c4b5f4d2548475dffd28b2d5fe85c82a4753a983638376823"
    "2042ed0d7365c41aee2107baf394c26cb05a2e2a80a49daa050ba62425b81bbb"
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
    # Patch crossfiles with extra optimizations from makepkg.conf
    # If building fails, comment the line below to disable them.
    patch -p1 -i ../extraopts.patch
    CFLAGS="$CPPFLAGS $CFLAGS"
    sed -i build-wine64.txt \
        -e "s|@CARGS@|\'${CFLAGS// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${LDFLAGS// /\',\'}\'|g"
    sed -i build-wine32.txt \
        -e "s|@CARGS@|\'${CFLAGS// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${LDFLAGS// /\',\'}\'|g"
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
