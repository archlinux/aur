# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>

pkgname=vkd3d-proton-mingw
pkgver=3.0a
pkgrel=1
pkgdesc='Fork of VKD3D. Development branches for Protons Direct3D 12 implementation'
arch=('x86_64')
url="https://github.com/HansKristian-Work/vkd3d-proton"
license=('LGPL-2.1')
makedepends=('ninja' 'meson>=0.43' 'glslang' 'git' 'mingw-w64-gcc' 'mingw-w64-tools')
provides=('vkd3d-proton' "vkd3d-proton=$pkgver")
conflicts=('vkd3d-proton')
options=(!lto !staticlibs)
source=(
    "git+https://github.com/HansKristian-Work/vkd3d-proton.git#tag=v$pkgver"
    "vkd3d-proton-extraopts.patch"
    "setup_vkd3d_proton.sh"
    "setup_vkd3d_proton"
)

prepare() {
    cd vkd3d-proton

    # Explicitly set origin URL for submodules using relative paths
    git remote set-url origin https://github.com/HansKristian-Work/vkd3d-proton.git
    git submodule update --init --filter=tree:0 --recursive

    # Uncomment to enable extra optimizations
    # Patch crossfiles with extra optimizations from makepkg.conf
    patch -p1 -i "$srcdir"/vkd3d-proton-extraopts.patch

    # By default export FLAGS used by proton and ignore makepkg
    # This overrides FLAGS from makepkg.conf, if you comment these you are on your own

    local -a split=($CFLAGS)
    local -A flags
    for opt in "${split[@]}"; do flags["${opt%%=*}"]="${opt##*=}"; done
    local march="${flags["-march"]:-nocona}"
    local mtune="${flags["-mtune"]:-core-avx2}"

    CFLAGS="-O3 -march=$march -mtune=$mtune -pipe"
    CXXFLAGS="-O3 -march=$march -mtune=$mtune -pipe"
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
    meson setup vkd3d-proton "build/x64" \
        --prefix "/usr/share/vkd3d-proton/x64" \
        --cross-file vkd3d-proton/build-win64.txt \
        --bindir "" --libdir "" \
        --buildtype "plain" \
        -Denable_tests=false \
        -Denable_extended_emulation=true \
        -Db_ndebug=false \
        --strip
    ninja -C "build/x64" -v

    meson setup vkd3d-proton "build/x86" \
        --cross-file vkd3d-proton/build-win32.txt \
        --prefix "/usr/share/vkd3d-proton/x86" \
        --bindir "" --libdir "" \
        --buildtype "plain" \
        -Denable_tests=false \
        -Denable_extended_emulation=true \
        -Db_ndebug=false \
        --strip
    ninja -C "build/x86" -v
}

package() {
    depends=('vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'wine' 'bash')

    DESTDIR="$pkgdir" ninja -C "build/x86" install
    DESTDIR="$pkgdir" ninja -C "build/x64" install
    install -Dm 755 -t "$pkgdir/usr/share/vkd3d-proton" setup_vkd3d_proton.sh
    install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" vkd3d-proton/README.md
    install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" vkd3d-proton/LICENSE
    install -Dm 755 -t "$pkgdir/usr/bin" setup_vkd3d_proton
}

sha256sums=('fca421fa308c3f39262053a7df452a4e2a988c9fcb2bdc3ef9d6a1dfe971828a'
            'bcc15521e4c7f966a0192a1dabb7fb4935b33db39344ab5b861f9d81486f1362'
            '3ae59cc84ef70fa54df9809bba789382909d87c4d0b8d1fd278c3b25f75e69d8'
            '67815eed9d47bbf610e23c6a1e4954c11371886c2ca73555dd9f1d6fbebb1323')
