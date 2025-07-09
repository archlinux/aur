# Maintainer: Ali Mohammad Pur <totally@fakegmail.ch>

pkgname=('angle')
pkgver=7258
pkgrel=1
pkgdesc="A conformant OpenGL ES implementation for Windows, Mac, Linux, iOS and Android."
arch=('x86_64')
url="https://github.com/google/angle"
license=('BSD-3-Clause')
depends=('zlib' 'libglvnd' 'freetype2' 'expat' 'libpng' 'libjpeg-turbo' 'fontconfig' 'harfbuzz' 'gcc-libs' 'libwebp' 'glibc')
makedepends=('git' 'rsync' 'python' 'procps-ng' 'ninja' 'depot-tools-git')
provides=(angle)
conflicts=(angle)
source=(
    "angle.pc"
)
sha256sums=(
    'SKIP'
)

prepare() {
    # to make sure depot tools are in path
    cd "$srcdir"
    SRC_DIR="$(readlink -f "$srcdir")"
        rsync -Pa /opt/depot_tools/ "$SRC_DIR/depot_tools/"

    export PATH="$SRC_DIR/depot_tools:$PATH"

    # download/sync angle
    cd "$srcdir"
    gclient config https://chromium.googlesource.com/angle/angle < <(yes)
    gclient sync --with_tags -r chromium/"$pkgver" < <(yes)
    gclient runhooks < <(yes)

    # generate the ninja build files using gn
    cd angle
    gn gen out/Release --args="angle_build_tests=false angle_enable_swiftshader=false angle_enable_vulkan=true angle_enable_wgpu=false angle_expose_non_conformant_extensions_and_versions=true is_official_build=true is_component_build=false is_debug=false use_custom_libcxx=false use_safe_libstdcxx=true chrome_pgo_phase=0 build_with_chromium=false is_cfi=false"
}

build() {
    cd angle
    export PATH="$srcdir/depot_tools:$PATH"
    ninja -C ./out/Release
}

package() {
    cd "$srcdir/angle"

    # License
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Library
    libs=(
	libEGL.so
        libEGL_vulkan_secondaries.so
        libGLESv1_CM.so
        libGLESv2.so
        libGLESv2_vulkan_secondaries.so
        libGLESv2_with_capture.so
        libVkICD_mock_icd.so
        libfeature_support.so
    )
    for lib in "${libs[@]}"; do
        install -D -m644 out/Release/"$lib" "$pkgdir/usr/lib/$(basename -s.so "$lib")-ANGLE.so"
    done

    # Headers
    find include -type f -and -name "*.h" -exec install -v -D -m644 {} "$pkgdir/usr/include/"{} \; -print

    install -D -m644 "$srcdir/angle.pc" "$pkgdir/usr/lib/pkgconfig/angle.pc"

    git reset --hard origin/main
}


