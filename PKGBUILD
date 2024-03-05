# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=dxvk-nvapi-mingw-git
pkgver=0.6.4.r57.gb54c9fe
pkgrel=1
pkgdesc='Alternative NVAPI implementation on top of DXVK'
arch=('x86_64')
url="https://github.com/jp7677/dxvk-nvapi"
license=('MIT')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git' 'mingw-w64-gcc')
provides=('dxvk-nvapi-mingw')
conflicts=('dxvk-nvapi-mingw')
options=(!lto !staticlibs)
source=(
    "git+https://github.com/jp7677/dxvk-nvapi.git"
    "dxvk-nvapi-extraopts.patch"
    "setup_dxvk_nvapi.sh"
    "setup_dxvk_nvapi"
)

pkgver() {
    cd dxvk-nvapi
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g')"
}

prepare() {
    cd dxvk-nvapi

    # Explicitly set origin URL for submodules using relative paths
    git remote set-url origin https://github.com/jp7677/dxvk-nvapi.git
    git submodule update --init --filter=tree:0 --recursive

    # Uncomment to enable extra optimizations
    # Patch crossfiles with extra optimizations from makepkg.conf
    patch -p1 -i "$srcdir"/dxvk-nvapi-extraopts.patch

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
    meson setup dxvk-nvapi "build/x64" \
        --cross-file dxvk-nvapi/build-win64.txt \
        --prefix "/usr/share/dxvk-nvapi/x64" \
        --bindir "" --libdir "" \
        --buildtype "plain" \
        -Denable_tests=false \
        --strip
    ninja -C "build/x64" -v

    meson setup dxvk-nvapi "build/x32" \
        --cross-file dxvk-nvapi/build-win32.txt \
        --prefix "/usr/share/dxvk-nvapi/x32" \
        --bindir "" --libdir "" \
        --buildtype "plain" \
        --strip \
        -Denable_tests=false
    ninja -C "build/x32" -v
}

package() {
    depends=('vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'wine' 'dxvk' 'bash')

    DESTDIR="$pkgdir" ninja -C "build/x32" install
    DESTDIR="$pkgdir" ninja -C "build/x64" install
    install -Dm 755 -t "$pkgdir/usr/share/dxvk-nvapi" setup_dxvk_nvapi.sh
    install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" dxvk-nvapi/README.md
    install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" dxvk-nvapi/LICENSE
    install -Dm 755 -t "$pkgdir/usr/bin" setup_dxvk_nvapi
}

sha256sums=('SKIP'
            'dff5ecd1a35a94a4dc1fa5fd08c10b5c88703797520d6b315207124ff1adeef8'
            'b03eb366daaf893ac633405b81516d4d16d0a5735c72729c293bb036886c0587'
            '1f4934c5bfcf208e288a0eda2f385f82acc9e78a4b0ac2a77b5af14c64c8e21e')
