# Maintainer: Viktor Semykin <thesame.ml@gmail.com>
# Packaging authored by Codex (OpenAI), 2026.
pkgname=sbxkb-minimal
pkgver=0.8.0
pkgrel=4
pkgdesc='X11 keyboard layout tray indicator rewritten by Codex (Xlib/libpng)'
arch=('x86_64')
url='https://sourceforge.net/projects/staybox/'
license=('GPL-3.0-or-later')
depends=('glibc' 'libx11' 'libpng')
checkdepends=('xorg-server-xvfb' 'xorg-setxkbmap')
provides=("sbxkb=$pkgver")
conflicts=('sbxkb')
_upstreamver=0.7.6
source=("https://downloads.sourceforge.net/project/staybox/sbxkb-$_upstreamver.tar.gz"
        'main.c'
        'Makefile'
        'sbxkb-README.md'
        'sbxkb.desktop'
        'test_sbxkb.c'
        'run.sh'
        'run_socketpair.py'
        'socket_transport.c')
sha256sums=('55f8844f9c82ed063d26ee34622ec698db3e9338175865e49e34b1e254f4d4f5'
            '14fea997bf6578e4b709712bead8152bede3cd5755bd337162436092c1bddb4a'
            '1a8810534d4523fcdb47631e1123f97408d3d5d679a0132e9cb569db748ec427'
            '34d5cd7465b7c14ef5f41bcd09e0943264053d9e15c1b251ae5a02c44087b3c5'
            '3bb0a8064a75297e072d4e65f2b4b21fff769fde4e6e812155e54d565297456f'
            '3a595d5ac04b79744807879fae909416340b7cb203a7ffd0f0f926b16e8e3c6c'
            '4dcc11fafcd46af956620dc5646bdd6a1346e47f6922f77a1c56ec0e4d5ccddc'
            '8c111c9cbe58f620bc66e378786b8d5c75313ed2272fa32e30aa0dcebc71119f'
            '13d44c68ddb5e539e4080a02bb0aeee052b3cfca6c31c54159d5b37421430bc0')

prepare() {
    cd "sbxkb-$_upstreamver"
    install -m644 "$srcdir/main.c" "$srcdir/Makefile" .
    install -m644 "$srcdir/sbxkb-README.md" README.md
    install -Dm644 "$srcdir/test_sbxkb.c" tests/test_sbxkb.c
    install -m755 "$srcdir/run.sh" tests/run.sh
    install -m644 "$srcdir/run_socketpair.py" "$srcdir/socket_transport.c" tests/
}

build() {
    cd "sbxkb-$_upstreamver"
    make PREFIX=/usr
}

check() {
    cd "sbxkb-$_upstreamver"
    make PREFIX=/usr check
}

package() {
    cd "sbxkb-$_upstreamver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 "$srcdir/sbxkb.desktop" "$pkgdir/etc/xdg/autostart/sbxkb.desktop"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 images/README "$pkgdir/usr/share/licenses/$pkgname/FLAGS-README"
}
