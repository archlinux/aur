# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>
# shellcheck disable=2034,2154,2164

pkgname=tablecruncher
_fltkver=1.4.3 ## ...according to the BUILD.md file
pkgver=1.8
pkgrel=2
pkgdesc='Lightweight, powerful CSV editor with built-in JavaScript macros'
arch=('x86_64')
url='https://tablecruncher.com'
license=('GPL-3.0-or-later')
depends=('glu' 'hicolor-icon-theme' 'libjpeg-turbo' 'libpng'
    'libxft' 'libxcursor' 'libxfixes' 'libxinerama')
makedepends=('alsa-lib' 'cmake' 'doxygen')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tablecruncher/tablecruncher/archive/refs/tags/v${pkgver}.tar.gz"
    "fltk-${_fltkver}-source.tar.gz::https://github.com/fltk/fltk/releases/download/release-${_fltkver}/fltk-${_fltkver}-source.tar.gz")
sha256sums=('3fba78ad71b005b3cb082537fa42ecf003fcb566f60d65b1140d32e9e794dd73'
    '19725f687146610976a1a43ef448feeba212a7eca88ad5897d22f6adaf3af45b')

build() {
    ## Build FLTK statically by following the instructions in the BUILD.md file

    cd "${srcdir}/fltk-${_fltkver}"
    ./configure \
        --enable-localzlib \
        --disable-wayland
    make -j"$(nproc)"

    ## Build Tablecruncher.
    ## FLTK is statically linked, but neither libXfixes, libXcursor nor libXinerama
    ## are declared in CMakeLists.txt; therefore, they will be added via CMAKE_EXE_LINKER_FLAGS

    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DFLTKDIR="${srcdir}/fltk-${_fltkver}" \
        -DCMAKE_EXE_LINKER_FLAGS="-lXfixes -lXcursor -lXinerama"
    cmake --build build -- -j"$(nproc)"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 "build/dist/Tablecruncher" "${pkgdir}/usr/bin/tablecruncher"
    install -Dm644 "assets/linux/tablecruncher.desktop" "${pkgdir}/usr/share/applications/tablecruncher.desktop"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    for size in 64x64 128x128 256x256; do
        install -Dm644 "assets/linux/icons/${size}/tablecruncher.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/tablecruncher.png"
    done
}
