# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=dxvk-mingw
pkgver=2.7.1
pkgrel=1
pkgdesc='Vulkan-based implementation of D3D9, D3D10 and D3D11 for Linux / Wine, MingW version'
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git' 'mingw-w64-gcc')
provides=('dxvk' "dxvk=$pkgver")
conflicts=('dxvk')
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

    local -a split=($CFLAGS)
    local -A flags
    for opt in "${split[@]}"; do flags["${opt%%=*}"]="${opt##*=}"; done
    local march="${flags["-march"]:-nocona}"
    local mtune="${flags["-mtune"]:-core-avx2}"

    CFLAGS="-O3 -march=$march -mtune=$mtune -pipe -mno-avx"
    CXXFLAGS="-O3 -march=$march -mtune=$mtune -pipe -mno-avx"
    LDFLAGS="-Wl,-O1,--sort-common,--as-needed"

    # These flags are taken from Proton
    CFLAGS+=" -mfpmath=sse -fwrapv -fno-strict-aliasing"
    CXXFLAGS+=" -mfpmath=sse -fwrapv -fno-strict-aliasing"
    LDFLAGS+=" -Wl,--file-alignment,4096"

    export CFLAGS CXXFLAGS LDFLAGS

    local cross_ldflags="$LDFLAGS"

    local cross_cflags="$CFLAGS -mcmodel=small"
    local cross_cxxflags="$CXXFLAGS -mcmodel=small"
    sed -i build-win64.txt \
        -e "s|@CARGS@|\'${cross_cflags// /\',\'}\'|g" \
        -e "s|@CXXARGS@|\'${cross_cxxflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${cross_ldflags// /\',\'}\'|g"

    local cross_cflags="$CFLAGS -mstackrealign -mpreferred-stack-boundary=2"
    local cross_cxxflags="$CXXFLAGS -mstackrealign -mpreferred-stack-boundary=2"
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
        -Db_ndebug=false \
        --strip
    ninja -C "build/x64" -v

    meson setup dxvk "build/x32" \
        --cross-file dxvk/build-win32.txt \
        --prefix "/usr/share/dxvk/x32" \
        --bindir "" --libdir "" \
        --buildtype "plain" \
        --force-fallback-for=libdisplay-info \
        -Db_ndebug=false \
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

sha256sums=('1a2ec0f93f4ef744b55e3ad084431f3ea6cf44eec9cd6853a4581a1401b41a00'
            'bcc15521e4c7f966a0192a1dabb7fb4935b33db39344ab5b861f9d81486f1362'
            'b562e8dc9539ef3cd1554c6679eef10aacf21103403d7390a141a41ae146b7a6'
            'c1f6a18b03d1612b60f8081428f00cfac5e66315fe9d42719f01cf5564deeeff')
