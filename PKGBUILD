# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=escapegoat
pkgver=20131018
pkgrel=1
pkgdesc="Escape Goat is a puzzle platformer about a goat"
arch=(i686 x86_64)
url="http://www.magicaltimebean.com/escape-goat/"
license=(custom:commercial)
makedepends=(unzip)
depends=(sdl2 openal)
source=("$pkgname" "$pkgname.desktop" "$pkgname.png")
md5sums=('d5c6ac99897ac33e23593849c59931d5'
         'db54523ac2b3c29038696d62b9a355f9'
         '0f5dc590a0f437ebccc770ca9f2a16c4')
PKGEXT=.pkg.tar

_archive="$pkgname-10182013-bin"
_archive_md5='8b78d08df9aa3f403ea621c5d084d4ee'

build () {
    echo "$_archive_md5 $startdir/$_archive" | md5sum -c || {
        echo "archive not found or wrong checksum (Escape Goat is a" \
             "commercial game)" 1>&2
        exit 1
    }

    unzip -qqod "$srcdir/$pkgname-archive" "$startdir/$_archive" || {
        # unzip gives exit status 1 if warnings occurred
        if [ "$?" -ne 1 ]; then
            echo "extracting archive failed" 1>&2
            exit 1
        fi
    }
}

package () {
    install -d "$pkgdir/opt/"
    cp -Rl "$srcdir/$pkgname-archive/data/" "$pkgdir/opt/$pkgname"

    if [ "$CARCH" = x86_64 ]; then
        libdir=lib64
        otherlibdir=lib
    else
        libdir=lib
        otherlibdir=lib64
    fi

    # these are in deps
    rm -f "$pkgdir/opt/$pkgname/$libdir"/{libopenal.so.1,libSDL2-2.0.so.0}
    rm -rf "$pkgdir/opt/$pkgname/$otherlibdir"

    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname.png" \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
