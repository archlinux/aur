# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname='monster-mash-git'
pkgver=r21.f61a527
pkgrel=1
pkgdesc="New Sketch-Based Modeling and Animation Tool"
arch=('x86_64')
url="https://github.com/google/monster-mash"
license=('Apache')
depends=('sdl2')
makedepends=('git'
             'cmake'
             'gcc12'
             'sdl2')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/google/monster-mash.git"
        "http://www.netlib.org/voronoi/triangle.zip")
sha256sums=('SKIP'
            '1766327add038495fa3499e9b7cc642179229750f7201b94f8e1b7bee76f8480')
noextract=('triangle.zip')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${pkgname%-git}"

    mkdir -p 'third_party/triangle'
    cd 'third_party/triangle'
    bsdtar -xf "${srcdir}/triangle.zip"
}

build() {
    cmake -B build -S "${pkgname%-git}/src" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_C_COMPILER=gcc-12 -DCMAKE_CXX_COMPILER=g++-12 \
        -Wno-dev
    cmake --build build
}

package() {
    install -D "build/monstermash" "${pkgdir}/usr/bin/${pkgname%-git}"
}
