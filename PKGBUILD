# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=d9vk-mingw
pkgver=0.11
pkgrel=1
pkgdesc="A d3d9 to vk layer based off DXVK's codebase, mingw version"
arch=('x86_64')
url="https://github.com/Joshua-Ashton/d9vk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader' 'bash')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git' 'wine' 'mingw-w64-gcc')
provides=("d9vk")
conflicts=("d9vk")
source=(
    "git+https://github.com/Joshua-Ashton/d9vk.git#tag=$pkgver"
    "setup_d9vk"
    "extraopts.patch"
    "dxvk-async.patch"
)
sha256sums=(
    "SKIP"
    "7147644664ef33d04f7b18683c47be95b5664c57cf6d63fdc019d915deebd37a"
    "d73f948fd39da218141cc72c7373f59e6fc289630e155b6e51d18597455d0040"
    "6c6936b753903ba59ee9e2b6c8fc533bf60cba894cf4288ec0239c35b86796cd"
)

prepare() {
    cd d9vk
    # Patch crossfiles with extra optimizations from makepkg.conf
    # If building fails, comment the line below to disable them.
    patch -p1 -i ../extraopts.patch
    CFLAGS="$CPPFLAGS $CFLAGS"
    LDFLAGS="${LDFLAGS/,-z,relro,-z,now/}"
    sed -i build-win64.txt \
        -e "s|@CARGS@|\'${CFLAGS// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${LDFLAGS// /\',\'}\'|g"
    sed -i build-win32.txt \
        -e "s|@CARGS@|\'${CFLAGS// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${LDFLAGS// /\',\'}\'|g"
    # Uncomment to enable dxvk async patch.
    # Enable at your own risk, if you don't know what it is,
    # leave it as is. You have been warned.
    #patch -p1 -i ../dxvk-async.patch
}

build() {
    meson d9vk "build/x64" \
        --cross-file d9vk/build-win64.txt \
        --prefix "/usr/share/d9vk/x64" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
        -Denable_tests=false
    ninja -C "build/x64" -v

    meson d9vk "build/x32" \
        --cross-file d9vk/build-win32.txt \
        --prefix "/usr/share/d9vk/x32" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
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
