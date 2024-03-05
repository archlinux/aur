# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=dxvk-mingw
pkgver=2.3
pkgrel=5
pkgdesc='Vulkan-based implementation of D3D9, D3D10 and D3D11 for Linux / Wine, MingW version'
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git' 'mingw-w64-gcc')
provides=('dxvk' 'd9vk' "dxvk=$pkgver")
conflicts=('dxvk' 'd9vk')
options=(!lto !staticlibs)
source=(
    "git+https://github.com/doitsujin/dxvk.git#tag=v$pkgver"
    "dxvk-extraopts.patch"
    "setup_dxvk.sh"
    "setup_dxvk"
)

prepare() {
    cd dxvk

    # Explicitly set origin URL for submodules using relative paths
    git remote set-url origin https://github.com/doitsujin/dxvk.git
    git submodule update --init --filter=tree:0 --recursive

    # Uncomment to enable extra optimizations
    # Patch crossfiles with extra optimizations from makepkg.conf
    patch -p1 -i "$srcdir"/dxvk-extraopts.patch

    # By default export FLAGS used by proton and ignore makepkg
    # This overrides FLAGS from makepkg.conf, if you comment these you are on your own
    # If you want the "best" possible optimizations for your system you can use
    # `-march=native` and remove the `-mtune=core-avx2` option.

    local -a split=($CFLAGS)
    local -A flags
    for opt in "${split[@]}"; do flags["${opt%%=*}"]="${opt##*=}"; done
    local march="${flags["-march"]:-nocona}"
    local mtune="generic" #"${flags["-mtune"]:-core-avx2}"

    CFLAGS="-O3 -march=$march -mtune=$mtune -pipe"
    CXXFLAGS="-O3 -march=$march -mtune=$mtune -pipe"
    LDFLAGS="-Wl,-O1,--sort-common,--as-needed"

    # These flags are taken from Proton
    CFLAGS+=" -mfpmath=sse -fwrapv -fno-strict-aliasing"
    CXXFLAGS+=" -mfpmath=sse -fwrapv -fno-strict-aliasing -std=c++17"
    LDFLAGS+=" -Wl,--file-alignment,4096"

    # AVX is "hard" disabled for 32bit in any case.
    # AVX/AVX2 for 64bit is disabled below.
    # Seems unnecessery for 64bit if -mtune=generic is used
    #CFLAGS+=" -mno-avx2 -mno-avx"
    #CXXFLAGS+=" -mno-avx2 -mno-avx"

    export CFLAGS CXXFLAGS LDFLAGS

    local cross_ldflags="$LDFLAGS"

    local cross_cflags="$CFLAGS -mcmodel=small"
    local cross_cxxflags="$CXXFLAGS -mcmodel=small"
    sed -i build-win64.txt \
        -e "s|@CARGS@|\'${cross_cflags// /\',\'}\'|g" \
        -e "s|@CXXARGS@|\'${cross_cxxflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${cross_ldflags// /\',\'}\'|g"

    local cross_cflags="$CFLAGS -mstackrealign -mno-avx"
    local cross_cxxflags="$CXXFLAGS -mstackrealign -mno-avx"
    sed -i build-win32.txt \
        -e "s|@CARGS@|\'${cross_cflags// /\',\'}\'|g" \
        -e "s|@CXXARGS@|\'${cross_cxxflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${cross_ldflags// /\',\'}\'|g"
}

build() {
    meson setup dxvk "build/x64" \
        --cross-file dxvk/build-win64.txt \
        --prefix "/usr/share/dxvk/x64" \
        --bindir "" --libdir "" \
        --buildtype "plain" \
        --force-fallback-for=libdisplay-info \
        --strip
    ninja -C "build/x64" -v

    meson setup dxvk "build/x32" \
        --cross-file dxvk/build-win32.txt \
        --prefix "/usr/share/dxvk/x32" \
        --bindir "" --libdir "" \
        --buildtype "plain" \
        --force-fallback-for=libdisplay-info \
        --strip
    ninja -C "build/x32" -v
}

package() {
    depends=('vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'wine' 'bash')

    DESTDIR="$pkgdir" ninja -C "build/x32" install
    DESTDIR="$pkgdir" ninja -C "build/x64" install
    install -Dm 755 -t "$pkgdir/usr/share/dxvk" setup_dxvk.sh
    install -Dm 644 -t "$pkgdir/usr/share/dxvk" dxvk/dxvk.conf
    install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" dxvk/README.md
    install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" dxvk/LICENSE
    install -Dm 755 -t "$pkgdir/usr/bin" setup_dxvk
}

sha256sums=('SKIP'
            'bcc15521e4c7f966a0192a1dabb7fb4935b33db39344ab5b861f9d81486f1362'
            'c3daf448a0460f36ac471d2d4982874207888148ac3f03fbc2f003eccc2c2a45'
            'c1f6a18b03d1612b60f8081428f00cfac5e66315fe9d42719f01cf5564deeeff')
