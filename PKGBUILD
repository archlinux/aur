# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=dxvk-nvapi-mingw
pkgver=0.6.4
pkgrel=1
pkgdesc='Alternative NVAPI implementation on top of DXVK'
arch=('x86_64')
url="https://github.com/jp7677/dxvk-nvapi"
license=('MIT')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git' 'mingw-w64-gcc')
options=(!lto !staticlibs)
source=(
    "git+https://github.com/jp7677/dxvk-nvapi.git#tag=v${pkgver}"
    "git+https://github.com/KhronosGroup/Vulkan-Headers.git"
    "dxvk-nvapi-extraopts.patch"
    "setup_dxvk_nvapi.sh"
    "setup_dxvk_nvapi"
)

prepare() {
    cd dxvk-nvapi

    git submodule init "external/Vulkan-Headers"
    git submodule set-url "external/Vulkan-Headers" "$srcdir"/Vulkan-Headers
    git -c protocol.file.allow=always submodule update "external/Vulkan-Headers"

    # By default export FLAGS used by proton and ignore makepkg
    # This overrides FLAGS from makepkg.conf, if you comment these you are on your own
    # If you want the "best" possible optimizations for your system you can use
    # `-march=native` and remove the `-mtune=core-avx2` option.
    export CFLAGS="-O2 -march=nocona -mtune=core-avx2 -pipe"
    export CXXFLAGS="-O2 -march=nocona -mtune=core-avx2 -pipe"
    export LDFLAGS="-Wl,-O1,--sort-common,--as-needed"

    # These flags are taken from Proton
    CFLAGS+=" -mfpmath=sse -fwrapv -fno-strict-aliasing"
    CXXFLAGS+=" -mfpmath=sse -fwrapv -fno-strict-aliasing -std=c++17"
    LDFLAGS+=" -Wl,--file-alignment,4096"

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
    CFLAGS+=" -mno-avx2"
    CXXFLAGS+=" -mno-avx2"

    # Uncomment to enable extra optimizations
    # Patch crossfiles with extra optimizations from makepkg.conf
    patch -p1 -i "$srcdir"/dxvk-nvapi-extraopts.patch

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
        --buildtype "release" \
        --strip \
        -Denable_tests=false
    ninja -C "build/x64" -v

    meson setup dxvk-nvapi "build/x32" \
        --cross-file dxvk-nvapi/build-win32.txt \
        --prefix "/usr/share/dxvk-nvapi/x32" \
        --bindir "" --libdir "" \
        --buildtype "release" \
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
            'SKIP'
            'dff5ecd1a35a94a4dc1fa5fd08c10b5c88703797520d6b315207124ff1adeef8'
            '62a14512ab32ff534d8b07f2cdefae17ee679c73465edeb11bfac1e88f0a7109'
            '1f4934c5bfcf208e288a0eda2f385f82acc9e78a4b0ac2a77b5af14c64c8e21e')
