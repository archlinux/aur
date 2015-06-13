# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=whitebutterfly
pkgver=1.1
pkgrel=3
pkgdesc="Wreak destruction through three pastel-shaded shmup stages."
arch=('i686' 'x86_64')
url="http://www.allegro.cc/depot/WhiteButterfly"
_watch="none"
license=('GPL3')
depends=('allegro4')
source=(http://downloads.sourceforge.net/project/whitebutterfly/whitebutterfly/version%201.1/Butterfly_v11_src.zip
    http://downloads.sourceforge.net/project/whitebutterfly/whitebutterfly/version%201.1/Butterfly_v11_win.zip
    butterfly_linux.diff
    whitebutterfly)
md5sums=('d253471dd7c6142354f948b0b7939276'
         '2bab11426cc29c11b4b463f0dfb8a990'
         '428981b72350dd6c21cbf87a324368cd'
         '439b5d3a55341960172c8134f789d439')

build() {
    cd "$srcdir"

    # patch from http://www.allegro.cc/forums/thread/599168
    patch -i butterfly_linux.diff -d ./

    # save high scores and progress as ~/.WhiteButterfly
    sed -i 's/APPDATA/HOME/g' main.c
  
    gcc -O2 -Wall *.c -o $pkgname.bin $(allegro-config --cflags --libs) -lm
}

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/$pkgname"
    chmod -x beat/*.wav wavs/*.wav gfx/*.*
    cp -R beat wavs gfx "$pkgdir/usr/share/$pkgname/"
    install -D -m755 $pkgname.bin "$pkgdir/usr/share/$pkgname/"
    install -D -m755 $pkgname     "$pkgdir/usr/bin/"
    install -D -m644 *.txt        "$pkgdir/usr/share/$pkgname/"
}

