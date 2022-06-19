# Maintainer: Justin Wong <jusw85 at hotmail dot com>
# Contributor: Eldred Habert <me@eldred.fr>
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

# Reference: https://bbs.archlinux.org/viewtopic.php?pid=1853334#p1853334

pkgname=aseprite-git
_pkgname=aseprite
pkgver=1.2.33.r0.g845ff1778
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64' 'i686')
url='http://www.aseprite.org/'
license=('BSD' 'custom')
depends=('libxcursor' 'fontconfig' 'hicolor-icon-theme' 'libglvnd')
makedepends=('git' 'ninja' 'python' 'clang' 'cmake' 'libxi')
# makedepends=('git' 'ninja' 'python2' 'clang' 'cmake' 'libxi' 'libc++')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin" "${_pkgname}-skia-bin")
source=("git+https://github.com/${_pkgname}/${_pkgname}.git#branch=main"
        'desktop.patch'

        # Aseprite submodules
        "git+https://github.com/${_pkgname}/pixman.git"
        "git+https://github.com/${_pkgname}/simpleini.git"
        "git+https://github.com/${_pkgname}/gtest.git"
        "git+https://github.com/${_pkgname}/libwebp.git"
        "git+https://github.com/${_pkgname}/flic.git"
        "git+https://github.com/${_pkgname}/freetype2.git"
        "git+https://github.com/${_pkgname}/zlib.git"
        "git+https://github.com/${_pkgname}/libpng.git"
        "git+https://github.com/${_pkgname}/clip.git"
        "git+https://github.com/${_pkgname}/observable.git"
        "git+https://github.com/${_pkgname}/undo.git"
        "git+https://github.com/${_pkgname}/laf.git"
        "git+https://github.com/${_pkgname}/cmark.git"
        "git+https://github.com/${_pkgname}/harfbuzz.git"
        "git+https://github.com/${_pkgname}/libarchive.git"
        "git+https://github.com/${_pkgname}/json11.git"
        "git+https://github.com/${_pkgname}/benchmark.git"
        "git+https://github.com/${_pkgname}/giflib.git"
        "git+https://github.com/${_pkgname}/fmt.git"
        "git+https://github.com/${_pkgname}/tinyexpr.git"
        "git+https://github.com/${_pkgname}/lua"
        "git+https://github.com/${_pkgname}/tga.git"
        "git+https://github.com/${_pkgname}/curl.git"
        "git+https://github.com/${_pkgname}/IXWebSocket"

        # LAF submodules
        "git+https://github.com/${_pkgname}/stringencoders"
        "git+https://github.com/${_pkgname}/googletest"

        # Skia
        "git+https://github.com/${_pkgname}/skia.git#branch=aseprite-m102")
sha256sums=('SKIP'
            '8b14e36939e930de581e95abf0591645aa0fcfd47161cf88b062917dbaaef7f9'
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
            'SKIP'
            'SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    local -A submodule_paths=(
        [third_party/pixman]=pixman
        [third_party/simpleini]=simpleini
        [third_party/gtest]=gtest
        [third_party/libwebp]=libwebp
        [src/flic]=flic
        [third_party/freetype2]=freetype2
        [third_party/zlib]=zlib
        [third_party/libpng]=libpng
        [src/clip]=clip
        [src/observable]=observable
        [src/undo]=undo
        [laf]=laf
        [third_party/cmark]=cmark
        [third_party/harfbuzz]=harfbuzz
        [third_party/libarchive]=libarchive
        [third_party/json11]=json11
        [third_party/benchmark]=benchmark
        [third_party/giflib]=giflib
        [third_party/fmt]=fmt
        [third_party/tinyexpr]=tinyexpr
        [third_party/lua]=lua
        [src/tga]=tga
        [third_party/curl]=curl
        [third_party/IXWebSocket]=IXWebSocket)

    cd "${srcdir}/${_pkgname}"

    git submodule init
    local submodule
    for submodule in "${!submodule_paths[@]}"; do
        git config submodule.${submodule}.url "${srcdir}/${submodule_paths[$submodule]}"
    done
    git submodule update

    cd laf
    git submodule init
    git config submodule.third_party/stringencoders.url "${srcdir}/stringencoders"
    git config submodule.third_party/googletest.url "${srcdir}/googletest" # not required if LAF_WITH_TESTS=OFF
    git submodule update

    cd "${srcdir}/${_pkgname}"
    patch --strip=1 --input="${srcdir}/desktop.patch"
    mkdir -p build

    cd "${srcdir}/skia"
    python tools/git-sync-deps
}

build() {
    #export CC=clang
    #export CXX=clang++

    cd "${srcdir}/skia"
    #bin/gn gen out/Clang --args='cc="clang" cxx="clang++" is_debug=false is_official_build=true skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_sfntly=false skia_use_freetype=true skia_use_harfbuzz=true skia_pdf_subset_harfbuzz=true skia_use_system_freetype2=false skia_use_system_harfbuzz=false'
    bin/gn gen out/Clang --args='is_debug=false is_official_build=true skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_sfntly=false skia_use_freetype=true skia_use_harfbuzz=true skia_pdf_subset_harfbuzz=true skia_use_system_freetype2=false skia_use_system_harfbuzz=false'
    ninja -C out/Clang skia modules

    cd "${srcdir}/${_pkgname}/build"

    # https://github.com/aseprite/aseprite/issues/2843
    # -DUSE_SHARED_CMARK=ON \
    # -DUSE_SHARED_CURL=ON \
    # -DUSE_SHARED_GIFLIB=ON \
    # -DUSE_SHARED_JPEGLIB=ON \
    # -DUSE_SHARED_ZLIB=ON \
    # -DUSE_SHARED_LIBPNG=ON \
    # -DUSE_SHARED_TINYXML=ON \
    # -DUSE_SHARED_PIXMAN=ON \
    # -DUSE_SHARED_FREETYPE=ON \
    # -DUSE_SHARED_HARFBUZZ=ON \

    # cmake \
    #     -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    #     -DCMAKE_CXX_FLAGS:STRING=-stdlib=libc++ \
    #     -DCMAKE_EXE_LINKER_FLAGS:STRING=-stdlib=libc++ \
    #     -DCMAKE_INSTALL_PREFIX=/usr \
    #     -DLAF_BACKEND=skia \
    #     -DSKIA_DIR="$srcdir/skia" \
    #     -DSKIA_LIBRARY_DIR="$srcdir/skia2/out/Clang" \
    #     -DSKIA_LIBRARY="$srcdir/skia2/out/Clang/libskia.a" \
    #     -DLAF_WITH_TESTS=OFF \
    #     -DLAF_WITH_EXAMPLES=OFF \
    #     -G Ninja \
    #     ..
    cmake \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLAF_BACKEND=skia \
        -DSKIA_DIR="$srcdir/skia" \
        -DSKIA_LIBRARY_DIR="$srcdir/skia/out/Clang" \
        -DSKIA_LIBRARY="$srcdir/skia/out/Clang/libskia.a" \
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

    rm -f "${pkgdir}"/usr/lib/pkgconfig/libarchive.pc

    rm -f "${pkgdir}"/usr/lib/libwebp*
    rm -f "${pkgdir}"/usr/lib/pkgconfig/libwebp*
    rm -fr "${pkgdir}"/usr/include/webp/
    rm -fr "${pkgdir}"/usr/share/WebP/

    rm -f "${pkgdir}"/usr/lib/libjson11.a
    rm -f "${pkgdir}"/usr/lib/pkgconfig/json11.pc
    rm -f "${pkgdir}"/usr/include/json11.hpp

    rm -fr "${pkgdir}"/usr/lib/cmake/cmark
    rm -f "${pkgdir}"/usr/lib/pkgconfig/libcmark.pc
    rm -f "${pkgdir}"/usr/lib/libcmark*
    rm -f "${pkgdir}"/usr/include/cmark*
    rm -f "${pkgdir}"/usr/share/man/man1/cmark.1
    rm -f "${pkgdir}"/usr/share/man/man3/cmark.3

    rm -f "${pkgdir}"/usr/lib/libtga-lib.a
    rm -f "${pkgdir}"/usr/include/tga.h

    rm -f "${pkgdir}"/usr/lib/libcurl.a
    rm -f "${pkgdir}"/usr/lib/pkgconfig/*
    rm -f "${pkgdir}"/usr/lib//cmake/CURL/*
    rm -f "${pkgdir}"/usr/include/curl/*
    rm -f "${pkgdir}"/usr/bin/curl-config


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
