# Maintainer: Justin Wong <jusw85 at hotmail dot com>
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

# Discussion: https://bbs.archlinux.org/viewtopic.php?pid=1853334#p1853334

pkgname=aseprite-git
_pkgname=aseprite
pkgver=1.2.17.r64.gf689c2c48
pkgrel=2
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64' 'i686')
url='http://www.aseprite.org/'
license=('BSD' 'custom')
depends=('cmark' 'curl' 'libjpeg-turbo' 'giflib' 'tinyxml' 'libxcursor' 'fontconfig' 'hicolor-icon-theme')
makedepends=('git' 'ninja' 'python2' 'clang' 'cmake' 'libglvnd' 'harfbuzz-icu' 'pixman' 'libxi')
conflicts=("${_pkgname}" "${_pkgname}-gpl" "${_pkgname}-skia-bin")
source=(
        "git+https://github.com/${_pkgname}/laf.git"
        "git+https://github.com/${_pkgname}/clip.git"
        "git+https://github.com/${_pkgname}/flic.git"
        "git+https://github.com/${_pkgname}/observable.git"
        "git+https://github.com/${_pkgname}/tga.git"
        "git+https://github.com/${_pkgname}/undo.git"
        "git+https://github.com/${_pkgname}/benchmark.git"
        "git+https://github.com/${_pkgname}/cmark.git"
        "git+https://github.com/${_pkgname}/fmt.git"
        "git+https://github.com/${_pkgname}/freetype2.git"
        "git+https://github.com/${_pkgname}/giflib.git"
        "git+https://github.com/${_pkgname}/harfbuzz.git"
        "git+https://github.com/${_pkgname}/json11.git"
        "git+https://github.com/${_pkgname}/libarchive.git"
        "git+https://github.com/${_pkgname}/libpng.git"
        "git+https://github.com/${_pkgname}/libwebp.git"
        "git+https://github.com/${_pkgname}/lua"
        "git+https://github.com/${_pkgname}/pixman.git"
        "git+https://github.com/${_pkgname}/simpleini.git"
        "git+https://github.com/${_pkgname}/tinyexpr.git"
        "git+https://github.com/${_pkgname}/zlib.git"
        "git+https://github.com/${_pkgname}/stringencoders"
        "git+https://github.com/${_pkgname}/googletest"
        "git+https://github.com/${_pkgname}/skia.git#branch=aseprite-m81"
        "git+https://github.com/${_pkgname}/${_pkgname}.git"
        'desktop.patch')
sha256sums=(
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '8b14e36939e930de581e95abf0591645aa0fcfd47161cf88b062917dbaaef7f9')
_submodules=(
    'laf'
    'clip'
    'flic'
    'observable'
    'tga'
    'undo'
    'benchmark'
    'cmark'
    'fmt'
    'freetype2'
    'giflib'
    'harfbuzz'
    'json11'
    'libarchive'
    'libpng'
    'libwebp'
    'lua'
    'pixman'
    'simpleini'
    'tinyexpr'
    'zlib')
_submodules_path=(
    "laf"
    "src/clip"
    "src/flic"
    "src/observable"
    "src/tga"
    "src/undo"
    "third_party/benchmark"
    "third_party/cmark"
    "third_party/fmt"
    "third_party/freetype2"
    "third_party/giflib"
    "third_party/harfbuzz"
    "third_party/json11"
    "third_party/libarchive"
    "third_party/libpng"
    "third_party/libwebp"
    "third_party/lua"
    "third_party/pixman"
    "third_party/simpleini"
    "third_party/tinyexpr"
    "third_party/zlib")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule init
    for (( i=0; i<${#_submodules[@]}; i++ )); do
        git config submodule.${_submodules_path[$i]}.url "${srcdir}/${_submodules[$i]}"
    done
    git submodule update

    cd laf
    git submodule init
    git config submodule.third_party/stringencoders.url "${srcdir}/stringencoders"
    git config submodule.third_party/googletest.url "${srcdir}/googletest" #
    git submodule update

    cd "${srcdir}/${_pkgname}"
    patch --strip=1 --input="${srcdir}/desktop.patch"
    mkdir -p build

    cd "${srcdir}/skia"
    python2 tools/git-sync-deps

    mkdir -p "${srcdir}/.pkgbuild-bin"
    ln -sf "$(which python2)" "${srcdir}/.pkgbuild-bin/python"
}

build() {
    export PATH="${srcdir}/.pkgbuild-bin":$PATH
    cd "${srcdir}/skia"
    # bin/gn gen out/Clang --args='is_debug=false is_official_build=true cc="clang" cxx="clang++" skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false'
    bin/gn gen out/Clang --args='is_debug=false is_official_build=true skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false'
    ninja -C out/Clang skia modules

    cd "${srcdir}/${_pkgname}/build"
    cmake \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DLAF_BACKEND=skia \
        -DSKIA_DIR="$srcdir/skia" \
        -DSKIA_LIBRARY_DIR="$srcdir/skia/out/Clang" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_SHARED_CURL=ON \
        -DUSE_SHARED_JPEGLIB=ON \
        -DUSE_SHARED_GIFLIB=ON \
        -DUSE_SHARED_ZLIB=ON \
        -DUSE_SHARED_LIBPNG=ON \
        -DUSE_SHARED_TINYXML=ON \
        -DUSE_SHARED_PIXMAN=ON \
        -DUSE_SHARED_FREETYPE=ON \
        -DUSE_SHARED_HARFBUZZ=ON \
        -DWITH_WEBP_SUPPORT=ON \
        -DENABLE_TESTS=OFF \
        -DENABLE_BENCHMARKS=OFF \
        -DLAF_WITH_TESTS=OFF \
        -DLAF_WITH_EXAMPLES=OFF \
        -G Ninja \
        ..
    ninja ${_pkgname}
}

package() {
    cd "${srcdir}/${_pkgname}/build"
    DESTDIR="${pkgdir}" ninja install

    # Remove extraneous files
    # https://github.com/aseprite/aseprite/issues/1574
    # https://github.com/aseprite/aseprite/issues/1602

    rm -f "${pkgdir}"/usr/bin/bsd*
    rm -f "${pkgdir}"/usr/lib/pkgconfig/libarchive.pc
    rm -f "${pkgdir}"/usr/share/man/man1/bsd*

    rm -f "${pkgdir}"/usr/bin/img2webp
    rm -fr "${pkgdir}"/usr/include/webp/
    rm -f "${pkgdir}"/usr/lib/libwebp*
    rm -fr "${pkgdir}"/usr/share/WebP/
    rm -f "${pkgdir}"/usr/share/man/man1/img2webp.1

    rm -f "${pkgdir}"/usr/include/json11.hpp
    rm -f "${pkgdir}"/usr/lib/libjson11.a
    rm -f "${pkgdir}"/usr/lib/pkgconfig/json11.pc

    rm -f "${pkgdir}"/usr/bin/get_disto
    rm -f "${pkgdir}"/usr/bin/cwebp
    rm -f "${pkgdir}"/usr/bin/dwebp
    rm -f "${pkgdir}"/usr/bin/gif2webp
    rm -f "${pkgdir}"/usr/bin/vwebp
    rm -f "${pkgdir}"/usr/bin/vwebp_sdl
    rm -f "${pkgdir}"/usr/bin/webpinfo
    rm -f "${pkgdir}"/usr/bin/webpmux
    rm -f "${pkgdir}"/usr/bin/webp_quality
    rm -f "${pkgdir}"/usr/lib/pkgconfig/libwebp*
    rm -f "${pkgdir}"/usr/share/man/man1/cwebp.1
    rm -f "${pkgdir}"/usr/share/man/man1/dwebp.1
    rm -f "${pkgdir}"/usr/share/man/man1/gif2webp.1
    rm -f "${pkgdir}"/usr/share/man/man1/vwebp.1
    rm -f "${pkgdir}"/usr/share/man/man1/webpinfo.1
    rm -f "${pkgdir}"/usr/share/man/man1/webpmux.1

    find "${pkgdir}" -type d -empty -delete

    cd "${srcdir}/${_pkgname}"

    install -Dm644 "src/desktop/linux/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "src/desktop/linux/mime/${_pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml"
    for i in {16,32,48,64,128,256}; do
        install -Dm644 "data/icons/ase${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
        install -Dm644 "data/icons/doc${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/image-x-${_pkgname}.png"
    done
    install -Dm644 "EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
    install -Dm644 "${srcdir}/${_pkgname}/docs/LICENSES.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES"
}
