# Maintainer: envolution
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=hyperrogue-git
_pkgname=hyperrogue
pkgver=13.0v+r11110+g0137175d4
pkgrel=1
pkgdesc="You are a lone outsider in a strange, non-Euclidean hyperbolic world"
arch=('i686' 'x86_64')
url="http://www.roguetemple.com/z/hyper.php"
license=('GPL-2.0-or-later')
options=(!strip !debug)
provides=(hyperrogue)
conflicts=(hyperrogue)
depends=('sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'mesa' 'ttf-dejavu')
makedepends=('glu' 'glew')
source=(
  "git+https://github.com/zenorogue/hyperrogue.git"
  "hyperrogue.sh"
  "starts_with.patch"
)
sha256sums=('SKIP'
            'd8b6b3d6d8bfe7d7ce97e2fd2a35d148505890dc9c6ea972a7ecb2453245b032'
            '7fed0a2763738156828e103df441522ba2a7ee5a18605b0b72e7b95e6426534f')

prepare() {
  cd "$_pkgname"
  patch -Np2 -i ../starts_with.patch || true #sent a pull request so this patch should be obsolete soon
}
build() {
    cd "$_pkgname"
    export HYPERROGUE_USE_GLEW=1
    export HYPERROGUE_USE_PNG=1
    make
}

pkgver() {
  cd ${_pkgname}

  _version=$(git tag --sort=-v:refname --list | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

package() {
    install -Dm755 hyperrogue.sh "${pkgdir}/usr/bin/hyperrogue"
    cd "${_pkgname}"
    install -d "${pkgdir}"/usr/bin "${pkgdir}"/usr/share/hyperrogue/{sounds,music,honeycombs} "${pkgdir}"/usr/share/applications
    install -Dm755 ./hyperrogue "${pkgdir}/usr/share/${_pkgname}/app"
    install -Dm644 ./*ttf "${pkgdir}/usr/share/${_pkgname}"
    install -Dm644 ./honeycombs/* "${pkgdir}/usr/share/${_pkgname}/honeycombs"
    install -Dm644 ./sounds/* "${pkgdir}/usr/share/${_pkgname}/sounds"
    install -Dm644 ./music/* "${pkgdir}/usr/share/${_pkgname}/music"
    install -Dm644 ./{hyperrogue-music.txt,*.dat} "${pkgdir}/usr/share/${_pkgname}"
    install -Dm755 ./contrib/hyperrogue.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm755 ./hyperroid/app/src/main/res/drawable-hdpi/icon.png "${pkgdir}/usr/share/pixmaps/hyperrogue.png"
}

# vim: ts=2 sw=2 et:
