# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=dxvk-mingw
_dxvkver=1.9.2
pkgver=$_dxvkver
pkgrel=1
pkgdesc='Vulkan-based implementation of D3D9, D3D10 and D3D11 for Linux / Wine, MingW version'
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader' 'bash')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git' 'mingw-w64-gcc')
provides=('dxvk' 'd9vk' "dxvk=$pkgver")
conflicts=('dxvk' 'd9vk')
options=(!lto !staticlibs)
source=(
    "git+https://github.com/doitsujin/dxvk.git#tag=v$_dxvkver"
    "https://raw.githubusercontent.com/Sporif/dxvk-async/$_dxvkver/dxvk-async.patch"
    "dxvk-async-conf.patch"
    "dxvk-extraopts.patch"
    "setup_dxvk"
)
sha256sums=(
    'SKIP'
    '9212a9c42ac8c9c7b9ba7378685b27e7ea0e7a8a8aaac1f3f4d37590ada3e991'
    'c9c2f02bce1e1e93d511aff73484208456835d4d7601a36ab4524939472fc401'
    '2bf3515ce9a3ee426c2632aa3355b2556ee8fe5dd8d88e088f90803e3d5f10a6'
    'b2413cabd8cca56e2d308ef5513edf1c7f909036ed2ccfeae17536a0e864dc96'
)

prepare() {
    cd dxvk

    # Uncomment to enable dxvk async patch.
    # Enable at your own risk. If you don't know what it is,
    # and its implications, leave it as is. You have been warned.
    # I am not liable if anything happens to you by using it.
    #patch -p1 -i "$srcdir"/dxvk-async.patch
    #patch -p1 -i "$srcdir"/dxvk-async-conf.patch

    # Export CFLAGS used by proton
    # -O2 is adjusted to -O3 since AVX is disabled
    # This overrides CFLAGS from makepkg.conf, if you comment these you are on your own
    # If you want the "best" possbile optimizations for your system you can use
    # `-march=native` and remove the `-mtune=core-avx2` option.
    export CFLAGS="-O3 -march=nocona -mtune=core-avx2 -pipe"
    export CXXFLAGS="-O3 -march=nocona -mtune=core-avx2 -pipe"

    # Uncomment to enable extra optimizations
    # Patch crossfiles with extra optimizations from makepkg.conf
    patch -p1 -i "$srcdir"/dxvk-extraopts.patch
    local dxvk_cflags="$CFLAGS"
    local dxvk_ldflags="$LDFLAGS"
    # Filter known bad flags before applying optimizations
    # Filter fstack-protector{ ,-all,-strong} flag for MingW.
    # https://github.com/Joshua-Ashton/d9vk/issues/476
    dxvk_cflags="${dxvk_cflags// -fstack-protector*([\-all|\-strong])/}"
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
    # AVX2 seems to degrade performance. So disregard the above.
    # Relevant Wine issues
    # https://bugs.winehq.org/show_bug.cgi?id=45289
    # https://bugs.winehq.org/show_bug.cgi?id=43516
    dxvk64_cflags="$dxvk_cflags -mno-avx -mno-avx2"
    dxvk32_cflags="$dxvk_cflags -mno-avx -mno-avx2"
    # These flags are taken from Proton, I don't know if there are issues with Arch wine.
    dxvk64_cflags="$dxvk_cflags -mfpmath=sse -fwrapv -fno-strict-aliasing -gdwarf-2 -gstrict-dwarf"
    dxvk32_cflags="$dxvk_cflags -mfpmath=sse -fwrapv -fno-strict-aliasing -gdwarf-2 -gstrict-dwarf"
    dxvk_ldflags="$dxvk_ldflags -Wl,--file-alignment,4096"

    sed -i build-win64.txt \
        -e "s|@CARGS@|\'${dxvk64_cflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${dxvk_ldflags// /\',\'}\'|g"
    sed -i build-win32.txt \
        -e "s|@CARGS@|\'${dxvk32_cflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${dxvk_ldflags// /\',\'}\'|g"
}

build() {
    meson dxvk "build/x64" \
        --cross-file dxvk/build-win64.txt \
        --prefix "/usr/share/dxvk/x64" \
        --bindir "" --libdir "" \
        --buildtype "release" \
        --strip \
        -Denable_tests=false
    ninja -C "build/x64" -v

    meson dxvk "build/x32" \
        --cross-file dxvk/build-win32.txt \
        --prefix "/usr/share/dxvk/x32" \
        --bindir "" --libdir "" \
        --buildtype "release" \
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
