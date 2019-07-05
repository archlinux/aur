# Maintainer: Justin Wong <jusw85 at hotmail dot com>
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite-git
_pkgname=aseprite
pkgver=1.2.13.r0.gaf4fd54c2
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64' 'i686')
url='http://www.aseprite.org/'
license=('BSD' 'custom')
depends=('cmark' 'curl' 'libjpeg-turbo' 'giflib' 'tinyxml' 'pixman' 'libxcursor' 'fontconfig')
makedepends=('git' 'ninja' 'python2' 'clang')
conflicts=("${_pkgname}" "${_pkgname}-gpl"  )
source=("skia::git+https://github.com/${_pkgname}/skia.git#branch=aseprite-m71"
        "${_pkgname}::git+https://github.com/${_pkgname}/${_pkgname}.git"
        'desktop.patch')
sha256sums=('SKIP'
            'SKIP'
            'bcb6229e42cef16a8a0273c2fce67ce81d243a085c90bd52ac15183e757ff875')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    git submodule update --init --recursive
    patch --strip=1 --input="${srcdir}/desktop.patch"
    mkdir -p build

    cd "${srcdir}/skia"
    python2 tools/git-sync-deps

    mkdir -p "${srcdir}/.pkgbuild-bin"
    ln -sf /usr/bin/python2 "${srcdir}/.pkgbuild-bin/python"
}

build() {
    cd "${srcdir}/skia"
    bin/gn gen out/Clang --args='is_debug=false is_official_build=true cc="clang" cxx="clang++" skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false'
    ninja -C out/Clang skia

    cd "${srcdir}/${_pkgname}/build"
    cmake \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DLAF_OS_BACKEND=skia \
        -DSKIA_DIR="$srcdir/skia" \
        -DSKIA_OUT_DIR="$srcdir/skia/out/Clang" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_SHARED_CMARK=ON \
        -DUSE_SHARED_CURL=ON \
        -DUSE_SHARED_JPEGLIB=ON \
        -DUSE_SHARED_GIFLIB=ON \
        -DUSE_SHARED_ZLIB=ON \
        -DUSE_SHARED_LIBPNG=ON \
        -DUSE_SHARED_TINYXML=ON \
        -DUSE_SHARED_PIXMAN=ON \
        -DUSE_SHARED_FREETYPE=ON \
        -DUSE_SHARED_HARFBUZZ=ON \
        -G Ninja \
        ..
    export PATH="${srcdir}/.pkgbuild-bin":$PATH
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

    find "${pkgdir}" -type d -empty -delete

    cd "${srcdir}/${_pkgname}"

    install -Dm644 "src/desktop/linux/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "src/desktop/linux/mime/${_pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml"
    for i in {16,32,48,64,128,256}; do
        install -Dm644 "data/icons/ase${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
        install -Dm644 "data/icons/doc${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/image-x-${_pkgname}.png"
    done
    install -Dm644 "EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
    install -Dm644 "$srcdir/skia/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
