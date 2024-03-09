# Maintainer: Henninger Henningstone <henritees at mein-twserver dot de>

pkgname=allthehaxx
pkgver=1.0.0
pkgrel=0
pkgdesc="AllTernative Teeworlds Client"
arch=('x86_64')
url="https://allthehaxx.github.io"
license=('custom')
depends=('sdl2' 'glu' 'freetype2' 'opusfile' 'curl')
makedepends=('bam' 'imagemagick' 'gendesk' 'python')
optdepends=('ddnet-maps-git: have all DDNet maps available offline')
#provides=()
#conflicts=()
backup=('etc/allthehaxx/storage.cfg'
        'etc/allthehaxx/mapdbs.cfg'
        'etc/allthehaxx/skindbs.cfg')
#options=('!strip' 'debug') # uncomment this if you want to gdb AllTheHaxx
install=allthehaxx.install
_archive="$pkgname-$pkgver.tar.gz"
source=("$_archive::https://github.com/AllTheHaxx/AllTheHaxx/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('926d04ebd163c400742976e4024d68bb2224cc53097ce7041e09ae355a2a6a3d')


prepare() {
    # Client
    cd "$srcdir/AllTheHaxx-$pkgver/"
    convert "other/icons/AllTheHaxx.ico" AllTheHaxx.png
}

build() {
    cd "$srcdir/AllTheHaxx-$pkgver/"
    bam config installation_root="/"
    bam client_release
}

package() {
    cd "$srcdir/AllTheHaxx-$pkgver/"
    # Install AllTheHaxx client binaries
    install -d -m755                   "$pkgdir/usr/bin/"
    install -m755 AllTheHaxx           "$pkgdir/usr/bin/"

    # Install data files
    install -d -m755 "$pkgdir/usr/share/allthehaxx/data/"
    cp -r data/* "$pkgdir/usr/share/allthehaxx/data/"
    rm -rf "$pkgdir/usr/share/allthehaxx/data/languages/scripts/"

    # Install editable text configuration files
    install -d -m755                    "$pkgdir/etc/allthehaxx/"
    install -m755 data/edtc/storage.cfg "$pkgdir/etc/allthehaxx/"
    install -m755 data/edtc/skindbs.cfg "$pkgdir/etc/allthehaxx/"
    install -m755 data/edtc/mapdbs.cfg  "$pkgdir/etc/allthehaxx/"

    # Install desktop and license files
    install -Dm644 other/AllTheHaxx.desktop "$pkgdir/usr/share/applications/allthehaxx.desktop"
    install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

    # Install icon files
    install -Dm644 AllTheHaxx-4.png     "$pkgdir/usr/share/pixmaps/AllTheHaxx.png"
}
