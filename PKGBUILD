# Maintainer: Teteros <teteros at teknik dot io>

_pkgname=sonic-visualiser
pkgname=sonic-visualiser-hg
pkgver=r1755.c866f9a77b23
pkgrel=1
pkgdesc="A viewer and analyser of music audio files. (hg version)"
arch=('x86_64')
url="https://code.soundsoftware.ac.uk/projects/sonic-visualiser"
license=('GPL2')
depends=('capnproto-git' 'libfishsound' 'libid3tag' 'liblo'
'liblrdf' 'libmad' 'liboggz' 'libpulse' 'portaudio' 'qt5-svg'
'rubberband' 'sord' 'hicolor-icon-theme')
makedepends=('mercurial' 'git' 'mlton' 'vamp-plugin-sdk')
provides=("${pkgname%-hg}")
conflicts=("${pkgname%-hg}" "${pkgname%-hg}3")
source=("hg+https://code.soundsoftware.ac.uk/hg/$_pkgname")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd "$_pkgname"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$_pkgname"
    INSTALL_ROOT="$pkgdir" make install

    # vamp binaries
    install -Dm755 vamp-plugin-load-checker "$pkgdir/usr/bin/vamp-plugin-load-checker"
    install -Dm755 piper-vamp-simple-server "$pkgdir/usr/bin/piper-vamp-simple-server"

    # desktop files
    install -t "$pkgdir/usr/share/applications" -Dm644 *.desktop

    # icons
    for _s in 16 22 24 32 48 64 128; do
        install -Dm644 icons/sv-${_s}x${_s}.png \
            "$pkgdir/usr/share/icons/hicolor/${_s}x${_s}/apps/sv-icon.png"
    done
    install -Dm644 icons/sv-icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/sv-icon.svg"

    # samples
    install -t "$pkgdir/usr/share/$pkgname/samples" -Dm644 samples/*

    # templates
    install -t "$pkgdir/usr/share/$pkgname/templates" -Dm644 templates/*

    # docs
    install -Dm644 CHANGELOG "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
    install -Dm644 CITATION "$pkgdir/usr/share/doc/$pkgname/CITATION"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 README.OSC "$pkgdir/usr/share/doc/$pkgname/README.osc"
}
