# Maintainer: envolution
# Contributor: Kyle Keen <keenerd@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=hyperrogue
# vercmp does not support upstream's versioning, so we prepend letters with '.'
# example upstream vercmp(v13.1 > v13.1a) vercmp(v13.1 < v13.1.a)
pkgver=13.1.b
_pkgver=$(sed 's/\.\([a-zA-Z]\)/\1/' <<< "$pkgver")
pkgrel=1
pkgdesc="You are a lone outsider in a strange, non-Euclidean hyperbolic world"
arch=('i686' 'x86_64')
url="http://www.roguetemple.com/z/hyper.php"
license=('GPL-2.0-only')
options=(!strip !debug)
depends=('sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'mesa' 'ttf-dejavu')
makedepends=('glu' 'glew')
source=(
  "hyperrogue-$_pkgver.tgz::https://github.com/zenorogue/hyperrogue/archive/refs/tags/v${_pkgver}.tar.gz"
  "hyperrogue.sh"
)
sha256sums=('f9f8f1750a4f6b7de0b89367bcfbafd632f7f855be9d2b1869d610efb14c31e7'
            'd8b6b3d6d8bfe7d7ce97e2fd2a35d148505890dc9c6ea972a7ecb2453245b032')

build() {
    cd "$srcdir/$pkgname-${_pkgver}"
    export HYPERROGUE_USE_GLEW=1
    export HYPERROGUE_USE_PNG=1
    make
}

package() {
    install -Dm755 hyperrogue.sh "${pkgdir}/usr/bin/hyperrogue"
    cd "${srcdir}/${pkgname}-${_pkgver}"
    install -d "${pkgdir}"/usr/bin "${pkgdir}"/usr/share/hyperrogue/{sounds,music,honeycombs} "${pkgdir}"/usr/share/applications
    install -Dm755 ./hyperrogue "${pkgdir}/usr/share/${pkgname}/app"
    install -Dm644 ./*ttf "${pkgdir}/usr/share/${pkgname}"
    install -Dm644 ./honeycombs/* "${pkgdir}/usr/share/${pkgname}/honeycombs"
    install -Dm644 ./sounds/* "${pkgdir}/usr/share/${pkgname}/sounds"
    install -Dm644 ./music/* "${pkgdir}/usr/share/${pkgname}/music"
    install -Dm644 ./{hyperrogue-music.txt,*.dat} "${pkgdir}/usr/share/${pkgname}"
    install -Dm755 ./contrib/hyperrogue.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 ./hyperroid/app/src/main/res/drawable-hdpi/icon.png "${pkgdir}/usr/share/pixmaps/hyperrogue.png"
}

# vim:set ts=2 sw=2 et:
