# Maintainer: lottieratworld <lottieratworld at proton mail dot com>
_pkgname=hyperrogue
pkgname=${_pkgname}-git
pkgver='12.0m.r0.gd3191731'
pkgrel=1
pkgdesc="A puzzle-roguelike taking place on a hyperbolic plane. Latest git version."
arch=('i686' 'x86_64')
url="https://www.roguetemple.com/z/hyper/"
license=('GPL2')
provides=("${_pkgname}")
depends=('sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'mesa' 'ttf-dejavu' 'glew')
makedepends=('git')

source=("git+https://github.com/zenorogue/hyperrogue.git"
        "${_pkgname}.desktop"
        "96x96.png"
        "256x256.png")
sha256sums=('SKIP'
            'f36c41ab5cb033cdc360afc2163254f7b1ff9774d2dec34b0e57d0bbf7ee1bde'
            'af4fe1e4234024bcc305a31e16de386c40b4e98aad89ca546b2a2d44e1f85d52'
            'b80df03ffe180bc32931efdfabdf7a819b48261e92febb09790455eeddb45164')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    sed -i 's/-Werror//' Makefile
}

build() {
    cd "${srcdir}/${_pkgname}"
    export EXTRA_CXXFLAGS="-DFHS -I/usr/include/SDL -DHYPERPATH='\"/usr/share/${_pkgname}/\"' -DRESOURCEDESTDIR='\"/usr/share/${_pkgname}/\"' -DHYPERFONTPATH='\"/usr/share/fonts/TTF/\"'"
    export HYPERROGUE_USE_GLEW=1
    export HYPERROGUE_USE_PNG=1
    make
}

package() {
    install -d "${pkgdir}"/usr/{bin,share/{${_pkgname}/sounds,${_pkgname}/music,icons/hicolor/{96x96,256x256}/apps,applications}}

    cd "${srcdir}/${_pkgname}"
    install -Dm755 hyperrogue "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 sounds/* "${pkgdir}/usr/share/${_pkgname}/sounds"
    install -Dm644 music/* "${pkgdir}/usr/share/${_pkgname}/music"
    install -Dm644 {hyperrogue-music.txt,*.dat} "${pkgdir}/usr/share/${_pkgname}"

    cd "${srcdir}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 96x96.png "${pkgdir}/usr/share/icons/hicolor/96x96/apps/${_pkgname}.png"
    install -Dm644 256x256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}