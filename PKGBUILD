# Maintainer: dalz <aur @t alsd d0t eu>
pkgname=sil-q
pkgver=1.5.0
pkgrel=1
pkgdesc="A role-playing game with a strong emphasis on discovery and tactical combat"
arch=('i686' 'x86_64')
url="https://github.com/sil-quirk/sil-q"
license=('GPL2' 'custom')
depends=('ncurses' 'libx11' 'xorg-fonts-misc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "sil-q-x11.desktop"
        "sil-q-gcu.desktop")
md5sums=('eee88500e35fef3bfc31047cfc2ed49b'
         '506f43b149bed998918ce0171dd9bceb'
         '3e90c16a3ca1fab8e8b4476c5bbc61c7')

prepare() {
    cd "$pkgname-$pkgver/src"

    flags="-I/usr/X11R6/include -I/usr/include/ncurses -O2 -fno-strength-reduce"
    flags="$flags -DUSE_X11 -DUSE_GCU -DUSE_NCURSES"
    flags="$flags -DUSE_PRIVATE_SAVE_PATH -DPRIVATE_USER_PATH=\\\\\"~/.local/share\\\\\""
    flags="$flags -DDEFAULT_PATH=\\\\\"/usr/lib/$pkgname\\\\\""

    sed -i -e '/## Standard/,+3s/^/#/' \
        -e "/^CC/aCFLAGS = $flags" \
        -e "/^CC/aLIBS = -L/usr/X11R6/lib -lX11 -lncurses" \
        Makefile.std
}

build() {
    cd "$pkgname-$pkgver/src"
    make -f Makefile.std
}

package() {
    install -Dm644 sil-q-x11.desktop sil-q-gcu.desktop -t "$pkgdir/usr/share/applications/"

    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "lib/docs/Sil 1.3 Manual.pdf" "lib/docs/Sil-Q 1.4.2 Manual.pdf" -t "$pkgdir/usr/share/doc/$pkgname/"
    install -DTm755 src/sil "$pkgdir/usr/bin/$pkgname"

    lib_path="$pkgdir/usr/lib/$pkgname"
    mkdir -p "$lib_path"
    cp -r lib/. "$lib_path"
    chmod -R 755 "$lib_path"
}
