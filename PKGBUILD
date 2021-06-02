# Maintainer: lottieratworld <lottieratworld at proton mail dot com>
_pkgname=hyperrogue
pkgname=${_pkgname}-git
pkgver='120.r0.g805f33d8'
pkgrel=1
pkgdesc="A puzzle-roguelike taking place on a hyperbolic plane. Latest git version."
arch=('i686' 'x86_64')
url="https://www.roguetemple.com/z/hyper/"
license=('GPL2')
provides=("${_pkgname}")
depends=('sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'mesa')
makedepends=('glu' 'git')

source=("git+https://github.com/zenorogue/hyperrogue.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    sed -i 's/CXXFLAGS_EARLY += -W -Wall -Wextra -Werror/CXXFLAGS_EARLY += -W -Wall -Wextra/' Makefile
}

build() {
    cd "${srcdir}/${_pkgname}"
    EXTRA_CXXFLAGS="-DFHS -I/usr/include/SDL -DHYPERPATH='\"/usr/share/${_pkgname}/\"' -DRESOURCEDESTDIR='\"/usr/share/${_pkgname}/\"'" make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -d "${pkgdir}"/usr/{bin,share/${_pkgname}/sounds}

    install -Dm755 hyperrogue "${pkgdir}/usr/bin/hyperrogue"
    install -Dm644 sounds/* "${pkgdir}/usr/share/${_pkgname}/sounds"
    install -Dm644 {DejaVuSans-Bold.ttf,hyperrogue-music.txt,music/*,hr-*.ogg,*.dat} "${pkgdir}/usr/share/${_pkgname}"
}
