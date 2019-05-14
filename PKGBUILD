# Maintainer: Ckat <ckat@teknik.io>
pkgname=chatterino2-git
pkgver=r1973.cbd93f95
pkgrel=1
pkgdesc='Second installment of the Twitch chat client series "Chatterino", dev/git version'
arch=('any')
url=https://chatterino.com
license=('MIT')
depends=('qt5-multimedia' 'qt5-base' 'boost-libs')
makedepends=('git' 'qt5-svg' 'boost')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output'
            'gst-plugins-good: For audio output')
provides=('chatterino')
conflicts=('chatterino')
install=$pkgname.install
source=('chatterino.png' 'chatterino.desktop' "git://github.com/fourtf/chatterino2#branch=nightly")
md5sums=('b8de2f4e09b13025f92e12bb292dccb1' '6dc7280e81653e9a1f35e150fbebd8a0' 'SKIP')

pkgver() {
    cd "$srcdir/chatterino2"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
    cd "$srcdir/chatterino2"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/chatterino2"
    mkdir build
    cd build
    qmake ..
    make
}

package() {
    cd "$srcdir/chatterino2/build/bin"
    install -Dm755 chatterino "$pkgdir/usr/bin/chatterino"
    install -Dm644 "$srcdir/chatterino.desktop" "$pkgdir/usr/share/applications/chatterino.desktop"
    install -Dm644 "$srcdir/chatterino.png" "$pkgdir/usr/share/pixmaps/chatterino.png"
}
