# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=dxvk-mingw
pkgver=1.6
pkgrel=1
pkgdesc='Vulkan-based implementation of D3D9, D3D10 and D3D11 for Linux / Wine, MingW version'
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader' 'bash')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git' 'mingw-w64-gcc')
provides=('dxvk' 'd9vk' "dxvk=$pkgver")
conflicts=('dxvk' 'd9vk')
source=(
    "git+https://github.com/doitsujin/dxvk.git#commit=3104192af717f309068d2c20fd51b339511f6552"  #tag=v$pkgver"
    "setup_dxvk"
    "dxvk-async.patch"
    "extraopts.patch"
)
sha256sums=(
    "SKIP"
    "b2413cabd8cca56e2d308ef5513edf1c7f909036ed2ccfeae17536a0e864dc96"
    "6ff286091c20327e67252e1e6812830a42c990d1ee56541023eb217712209f3c"
    "acde3a23166f79fa87ab090200be2aabaf16e5876ce19b8270ad1179bb0bc7a5"
)

prepare() {
    cd dxvk

    # Uncomment to enable extra optimizations
    # Patch crossfiles with extra optimizations from makepkg.conf
    #patch -p1 -i ../extraopts.patch
    # Filter known bad flags before applying optimizations
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
    #CFLAGS+=" -fno-tree-vectorize"
    # Filter fstack-protector flag for MingW.
    # https://github.com/Joshua-Ashton/d9vk/issues/476
    CFLAGS+=" -fno-stack-protector"
    #CFLAGS="${CFLAGS// -fstack-protector+(-all|-strong)/}"
    #CFLAGS="${CFLAGS// -fstack-protector+(?=[ ])/}"
    # Adjust optimization level in meson arguments. This is ignored
    # anyway because meson sets its own optimization level.
    CFLAGS="${CFLAGS// -O+([0-3s]|fast)/}"
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
}

build() {
    meson dxvk "build/x64" \
        --cross-file dxvk/build-win64.txt \
        --prefix "/usr/share/dxvk/x64" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --optimization=3 \
        --strip \
        -Denable_tests=false
    ninja -C "build/x64" -v

    meson dxvk "build/x32" \
        --cross-file dxvk/build-win32.txt \
        --prefix "/usr/share/dxvk/x32" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --optimization=3 \
        --strip \
        -Denable_tests=false
    ninja -C "build/x32" -v
}

package() {
    DESTDIR="$pkgdir" ninja -C "build/x32" install
    DESTDIR="$pkgdir" ninja -C "build/x64" install
    install -Dm 755 -t "$pkgdir/usr/share/dxvk" dxvk/setup_dxvk.sh
    install -Dm 644 -t "$pkgdir/usr/share/doc/dxvk" dxvk/dxvk.conf
    install -Dm 644 -t "$pkgdir/usr/share/$pkgname" dxvk/LICENSE
    install -Dm 755 -t "$pkgdir/usr/bin" setup_dxvk
}
