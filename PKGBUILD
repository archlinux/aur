# Maintainer: Popolon <popolon@popolon.org>
# Contributor: MaryJaneInChain <maryjaneinchain@gmail.com>

pkgname=tic-80-lovebyte-git
pkgver=r1532.8da8d42
pkgrel=1
pkgdesc='TIC-80 tiny computer emulator'
arch=('any')
url="https://tic.computer/"
license=('MIT')
depends=('gtk3' 'glu' 'freeglut>=3.0.0' 'libglvnd' 'lua-sdl2')
makedepends=('git' 'cmake')
provides=(tic-80)

_gitname=TIC-80

source=("git+https://github.com/nesbox/TIC-80.git#branch=lovebyte"
	"tic80showdown.desktop"
	"tic80showdown.png")
sha256sums=('SKIP'
            '29c04770b132150c15df080fbc8201a94a1e13f010f30d9f127b8beb90ef5876'
            '471d7e10dc26d08afa90b14e2dbdd4cb123e9b31c1dd73a7503aff71f97252c6')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_gitname"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$_gitname/build"
    cmake ..
    make -j4
}

package() {
    install -Dm644 tic80showdown.png -t "${pkgdir}/usr/share/icons/"
    install -Dm644 tic80showdown.desktop -t "${pkgdir}/usr/share/applications/"
    cd "$_gitname/build"
    install -Dm755 bin/tic80 "${pkgdir}/usr/bin/tic80showdown"
}

