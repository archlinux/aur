# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Julien Savard <juju@juju2143.ca>
pkgname=x16-emulator
pkgver=r42
pkgrel=2
pkgdesc="An emulator for The 8-Bit Guy's Commander X16"
arch=('x86_64')
url="http://commanderx16.com/"
license=('BSD')
groups=('commander-x16')
depends=('sdl2' "x16-rom=${pkgver}")
makedepends=('clang' 'pandoc' 'gendesk')

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/X16Community/$pkgname/archive/$pkgver.tar.gz"
    "modify-base-path.patch"
)

md5sums=(
    '3cc24b8783c2c11890dc284d9d55219e'
    '5cd0550d2af1b4267c9b9f30eed9691e'
)

prepare() {
    cd "$pkgname-$pkgver"
    patch -uN src/main.c ../modify-base-path.patch
    sed -i -e 's/^\(LDFLAGS=.*\)/\1 '"${LDFLAGS}/" Makefile
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "X16 Emulator" --icon "$pkgname" --exec "x16emu" --categories "Game;Emulator"
}

build() {
    cd "$pkgname-$pkgver"
    # https://aur.archlinux.org/packages/x16-emulator#comment-827725
    CC="clang ${CFLAGS} -Wno-macro-redefined" make
    pandoc --from gfm --to html -c github-pandoc.css --standalone --metadata pagetitle="X16 Emulator" README.md --output README.html
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 x16emu "$pkgdir/usr/bin/x16emu"
    install -Dm755 makecart "$pkgdir/usr/bin/makecart"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 github-pandoc.css "$pkgdir/usr/share/doc/$pkgname/github-pandoc.css"
    install -Dm644 README.html "$pkgdir/usr/share/doc/$pkgname/README.html"
    install -Dm644 RELEASES.md "$pkgdir/usr/share/doc/$pkgname/RELEASES.md"
    install -Dm644 quickstart-linux.md "$pkgdir/usr/share/doc/$pkgname/quickstart-linux.md"
    install -Dm644 .gh/logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
