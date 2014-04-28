# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net> awagner on irc.freenode.net
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>
# Contributor: BKLive <bkunixos@gmail.com>
# Contributor: Holden Cox <segrived@gmail.com>

pkgname=dzen2-xft-xpm-xinerama-git
pkgver=r14.488ab66
pkgrel=1
pkgdesc="X notification utility with Xinerama and XMP support, git version."
arch=('i686' 'x86_64')
url=('https://github.com/robm/dzen')
license=('MIT/X')
depends=(libxft libxpm libxinerama)
makedepends=(git)
source=('dzen::git+https://github.com/robm/dzen')
md5sums=('SKIP')
conflicts=(dzen2-svn dzen2)
provides=('dzen2')

pkgver() {
    cd "$srcdir/dzen"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/dzen"
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 \
        CFLAGS=" -Wall -Os ${INCS} -DVERSION=\"${VERSION}\" -DDZEN_XINERAMA -DDZEN_XPM -DDZEN_XFT `pkg-config --cflags xft`" \
        LIBS=" -L/usr/lib -lc -L${X11LIB} -lXss -lX11 -lXinerama -lXpm `pkg-config --libs xft`"

    cd "$srcdir/dzen/gadgets"
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd "$srcdir/dzen"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -Dm644 README.dzen "${pkgdir}/usr/share/doc/${pkgname}/README.dzen"
    install -Dm644 CREDITS "${pkgdir}/usr/share/doc/${pkgname}/CREDITS"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "$srcdir/dzen/gadgets"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
