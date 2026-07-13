# Maintainer: taotieren <admin@taotieren.com>

pkgname=qucs-rflayout
pkgver=2.1.2
pkgrel=4
epoch=
pkgdesc="Export Qucs RF schematics to KiCad layouts & OpenEMS scripts"
arch=($CARCH)
url="https://github.com/thomaslepoix/Qucs-RFlayout"
license=('GPL-3.0-only')
_qt=qt6
groups=()
depends=(
    gcc-libs
    glibc
    $_qt-base
)
makedepends=(
    git
    cmake
    man-db
    mesa
    $_qt-tools
    texlive-meta
    ttf-lato
    gzip
)
checkdepends=(
    catch2
    lcov
)
optdepends=(
    'kicad: Electronic schematic and printed circuit board (PCB) design tools'
    'qucs: An integrated circuit simulator with a graphicaluser interface'
    'qucs-s: Qucs-S provides GUI for different circuit simulation kernels.'
    'openems: free and open electromagnetic field solver using the FDTD method'
    'pcb-rnd: free/open source, flexible, modular Printed Circuit Board editor'
    'inkscape: Professional vector graphics editor'
)
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
noextract=()
sha256sums=('3e35e0a3bdf9a2513948cf9929fd805b30bc77185b3edf61c34bf33c3e1c5a98')
validpgpkeys=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -Wno-dev

    cmake --build build
    cmake --build build --target doc
    cmake --build build --target package
}

# check() {
#     cd "${srcdir}/${pkgname}"
#     ctest --test-dir build --output-on-failure
# }

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="$pkgdir" cmake --install build
}
