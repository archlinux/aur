# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Julien Savard <juju@juju2143.ca>
pkgname=x16-emulator
pkgver=r45
pkgrel=1
pkgdesc="An emulator for The 8-Bit Guy's Commander X16"
arch=('x86_64')
url="http://commanderx16.com/"
license=('BSD')
groups=('commander-x16')
depends=('sdl2' "x16-rom=${pkgver}")
makedepends=('clang' 'gendesk' 'pandoc')

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/X16Community/$pkgname/archive/$pkgver.tar.gz"
    "fix-git-rev.patch"
    "modify-base-path.patch"
)

md5sums=(
    '4e77ff14a94d067a4d94980e74e6decd'
    '26c41ecd2e2676eaa7237334c8cb4bd7'
    '0e76560b039fb58a85b4448ff6b64eb6'
)

prepare() {
    cd "$pkgname-$pkgver"
    patch -uN -p1 < ../fix-git-rev.patch
    patch -uN -p1 < ../modify-base-path.patch
    sed -i -e 's/^\(LDFLAGS=.*\)/\1 '"${LDFLAGS}/" Makefile
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "X16 Emulator" --icon "$pkgname" --exec "x16emu" --categories "Game;Emulator"
}

build() {
    cd "$pkgname-$pkgver"
    # https://aur.archlinux.org/packages/x16-emulator#comment-827725
    export CC="clang ${CFLAGS} -Wno-macro-redefined"
    export CXX="clang++ ${CXXFLAGS}"
    make
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
