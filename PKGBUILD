# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=d9vk-mingw-git
_tag=0.40
pkgver=0.40.r0.654329864
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
    "git+https://github.com/Joshua-Ashton/d9vk.git"
    "setup_d9vk"
    "dxvk-async.patch"
    "dxvk-mangohud.patch"
    "extraopts.patch"
)
sha256sums=(
    "SKIP"
    "7147644664ef33d04f7b18683c47be95b5664c57cf6d63fdc019d915deebd37a"
    "6ff286091c20327e67252e1e6812830a42c990d1ee56541023eb217712209f3c"
    "2e335237623aaf006f8814fc9712f3a4be0d678cd0714879a3a4545f3bbf41ce"
    "acde3a23166f79fa87ab090200be2aabaf16e5876ce19b8270ad1179bb0bc7a5"
)

pkgver() {
    cd d9vk
    printf "%s.r%s.%s" "${_tag//-/_}" "$(git rev-list $_tag..HEAD --count)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd d9vk
    # If using -march=native and the CPU supports AVX, launching a d3d9
    # game can cause an Unhandled exception. The cause seems to be the
    # combination of AVX instructions and tree vectorization (implied by O3),
    # all tested archictures from sandybridge to haswell are affected.
    # Disabling either AVX (and AVX2 as a side-effect) or tree
    # vectorization fixes the issue. I am not sure which one is better
    # to disable so below you can choose. Append either of these flags.
    # Relevant Wine issues
    # https://bugs.winehq.org/show_bug.cgi?id=45289
    # https://bugs.winehq.org/show_bug.cgi?id=43516
    CFLAGS+=" -mno-avx"
    # CFLAGS+=" -fno-tree-vectorize"
    # Patch crossfiles with extra optimizations from makepkg.conf
    # If building fails, comment the line below to disable them.
    patch -p1 -i ../extraopts.patch
    # Adjust optimization level in meson arguments. This is ignored
    # anyways because meson sets its own optimization level.
    CFLAGS="${CFLAGS/ -O*([0-3])/}"
    # Doesn't compile with these flags in MingW so remove them.
    # They are also filtered in Wine PKGBUILDs so remove them
    # for winelib versions too.
    CFLAGS="${CFLAGS/ -fno-plt/}"
    LDFLAGS="${LDFLAGS/,-z,relro,-z,now/}"
    sed -i build-win64.txt \
        -e "s|@CARGS@|\'${CFLAGS// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${LDFLAGS// /\',\'}\'|g"
    sed -i build-win32.txt \
        -e "s|@CARGS@|\'${CFLAGS// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${LDFLAGS// /\',\'}\'|g"
    # Uncomment to enable dxvk async patch.
    # Enable at your own risk. If you don't know what it is,
    # and its implications, leave it as is. You have been warned.
    # I am not liable if anything happens to you by using it.
    # Patch enables async by default. YOU HAVE BEEN WARNED.
    #patch -p1 -i ../dxvk-async.patch
    # Uncomment to enable Mango HUD for dxvk
    #patch -p1 -i ../dxvk-mangohud.patch
}

build() {
    meson d9vk "build/x64" \
        --cross-file d9vk/build-win64.txt \
        --prefix "/usr/share/d9vk/x64" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --optimization=3 \
        --strip \
        -Denable_d3d10=false \
        -Denable_d3d11=false \
        -Denable_dxgi=false \
        -Denable_tests=false
    ninja -C "build/x64" -v

    meson d9vk "build/x32" \
        --cross-file d9vk/build-win32.txt \
        --prefix "/usr/share/d9vk/x32" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --optimization=3 \
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
