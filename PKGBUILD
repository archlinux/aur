# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>
# Contributor: nikos fytilis n - fit [at] live [dot] com
# Contributor: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=dxvk-winelib
pkgver=1.6.1
pkgrel=6
pkgdesc='Vulkan-based implementation of D3D9, D3D10 and D3D11 for Linux / Wine, Winelib version'
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader' 'bash')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git' 'wine')
provides=('dxvk' 'd9vk' "dxvk=$pkgver")
conflicts=('dxvk' 'd9vk')
source=(
    "git+https://github.com/doitsujin/dxvk.git#tag=v$pkgver"
    "setup_dxvk"
    "dxvk-async.patch"
    "extraopts.patch"
)
sha256sums=(
    "SKIP"
    "b2413cabd8cca56e2d308ef5513edf1c7f909036ed2ccfeae17536a0e864dc96"
    "198ec50d709b26d492efc399257423315c1530fcdf1ee52595af6eab8e7e9f7c"
    "acde3a23166f79fa87ab090200be2aabaf16e5876ce19b8270ad1179bb0bc7a5"
)

prepare() {
    cd dxvk

    # Uncomment to enable extra optimizations
    # Patch crossfiles with extra optimizations from makepkg.conf
    patch -p1 -i "$srcdir"/extraopts.patch
    local dxvk_cflags="$CFLAGS"
    local dxvk_ldflags="$LDFLAGS"
    # Filter known bad flags before applying optimizations
    # Filter fstack-protector{ ,-all,-strong} flag for MingW.
    # https://github.com/Joshua-Ashton/d9vk/issues/476
    dxvk_cflags="${dxvk_cflags// -fstack-protector*([\-all|\-strong])/}"
    # Adjust optimization level in meson arguments. This is ignored
    # anyway because meson sets its own optimization level.
    dxvk_cflags="${dxvk_cflags// -O+([0-3s]|fast)/}"
    # Doesn't compile with these flags in MingW so remove them.
    # They are also filtered in Wine PKGBUILDs so remove them
    # for winelib versions too.
    dxvk_cflags="${dxvk_cflags/ -fno-plt/}"
    dxvk_ldflags="${dxvk_ldflags/,-z,now/}"
    dxvk_ldflags="${dxvk_ldflags/,-z,relro/}"
    # If using -march=native and the CPU supports AVX, launching a d3d9
    # game can cause an Unhandled exception. The cause seems to be the
    # combination of AVX instructions and tree vectorization (implied by O3),
    # all tested archictures from sandybridge to haswell are affected.
    # Disabling AVX (and AVX2 as a side-effect).
    # Since Wine 5.16 AVX is supported. Testing showed 32bit applications
    # crashing with AVX regardless, but 64bit applications worked just fine.
    # So disable AVX only for the 32bit binaries and AVX2 for the 64bit.
    # Relevant Wine issues
    # https://bugs.winehq.org/show_bug.cgi?id=45289
    # https://bugs.winehq.org/show_bug.cgi?id=43516
    dxvk64_cflags="$dxvk_cflags -mno-avx2"
    dxvk32_cflags="$dxvk_cflags -mno-avx"

    sed -i build-wine64.txt \
        -e "s|@CARGS@|\'${dxvk64_cflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${dxvk_ldflags// /\',\'}\'|g"
    sed -i build-wine32.txt \
        -e "s|@CARGS@|\'${dxvk32_cflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${dxvk_ldflags// /\',\'}\'|g"

    # Uncomment to enable dxvk async patch.
    # Enable at your own risk. If you don't know what it is,
    # and its implications, leave it as is. You have been warned.
    # I am not liable if anything happens to you by using it.
    # Patch enables async by default. YOU HAVE BEEN WARNED.
    #patch -p1 -i "$srcdir"/dxvk-async.patch
}

build() {
    meson dxvk "build/x64" \
        --cross-file dxvk/build-wine64.txt \
        --prefix "/usr/share/dxvk/x64" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
        -Denable_tests=false
    sed -i 's/-pthread/-lpthread/g' build/x64/build.ninja
    ninja -C "build/x64" -v

    meson dxvk "build/x32" \
        --cross-file dxvk/build-wine32.txt \
        --prefix "/usr/share/dxvk/x32" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
        -Denable_tests=false
    sed -i 's/-pthread/-lpthread/g' build/x32/build.ninja
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
