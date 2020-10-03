# Maintainer: dalz <dalz @t disroot d0t org>
pkgname=sil-q
pkgver=1.4.2
pkgrel=4
pkgdesc="A role-playing game with a strong emphasis on discovery and tactical combat"
arch=('i686' 'x86_64')
url="https://github.com/sil-quirk/sil-q"
license=('GPL2' 'custom')
depends=('ncurses' 'libx11' 'xorg-fonts-misc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "sil-q-x11.desktop"
        "sil-q-gcu.desktop")
md5sums=('61ced0d05ca4ef3932e6ce3ba935ec40'
         '506f43b149bed998918ce0171dd9bceb'
         '3e90c16a3ca1fab8e8b4476c5bbc61c7')

prepare() {
    cd "$pkgname-$pkgver/src"
    sed -i -e 's|~/.sil|~/.local/share|' \
        -e "s|./lib|/usr/lib/$pkgname|" \
        -e '/USE_PRIVATE_SAVE_PATH/i #define USE_PRIVATE_SAVE_PATH' \
        config.h

    sed -i -e '/## Standard/,+3s/^/#/' \
        -e '/^CC/aCFLAGS = -I/usr/X11R6/include -I/usr/include/ncurses -O2 -fno-strength-reduce -D"USE_X11" -D"USE_GCU" -D"USE_NCURSES" \
LIBS = -L/usr/X11R6/lib -lX11 -lncurses' \
        Makefile.std

    sed -i '22cchar parsed_dir_user[1024]; \
path_parse(parsed_dir_user, sizeof(parsed_dir_user), ANGBAND_DIR_USER); \
path_build(tmp_Path, sizeof(tmp_Path), parsed_dir_user, "CharOutput.txt");' \
    save.c

    sed -i '56,57s/^/extern /' externs.h
}

build() {
    cd "$pkgname-$pkgver/src"
    make -f Makefile.std
}

package() {
    install -Dm644 sil-q-x11.desktop sil-q-gcu.desktop -t "$pkgdir/usr/share/applications/"

    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "Sil 1.3 Manual.pdf" "Sil-Q 1.4.2 Manual.pdf" -t "$pkgdir/usr/share/doc/$pkgname/"
    install -DTm755 src/sil "$pkgdir/usr/bin/$pkgname"

    lib_path="$pkgdir/usr/lib/$pkgname"
    mkdir -p "$lib_path"
    cp -r lib/. "$lib_path"
    chmod -R 755 "$lib_path"
}
