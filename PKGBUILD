# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com
# Contributor: Sławomir Kowalski <suawekk+aur@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
# Contributor: Dave Pretty <david dot pretty at gmail dot com>

pkgname=anki-git
pkgver=r1122.6df5ce7
pkgrel=1
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) efficiently"
url="http://ankisrs.net/"
license=('AGPL3')
arch=('any')
provides=('anki')
conflicts=('anki' 'anki20')
depends=('python-pyqt5' 'python-beautifulsoup4' 'python-httplib2' 'python-pyaudio' 'python-requests' 'python-send2trash' 'qt5-webengine')
optdepends=('mplayer: sound playing')
source=("${pkgname}::git+https://github.com/dae/anki.git")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"

    msg2 "Building UI"
    ./tools/build_ui.sh
}

package() {
    cd "$srcdir/$pkgname"

    mkdir -p "$pkgdir"/usr/{bin,share/{anki,pixmaps,applications,man/man1}}
    cp -av * "$pkgdir"/usr/share/anki/
    cd "$pkgdir"/usr/share/anki && (
        mv tools/runanki.system ../../bin/anki
        mv anki.xpm anki.png ../pixmaps/
        mv anki.desktop ../applications/
        mv anki.1 ../man/man1/
    )
    rm -rf "$pkgdir"/usr/share/anki/{tests,thirdparty/[!s]*,tools,anki.bat,runanki}

    msg2 "Precompiling python files"
    python -m compileall -q "${pkgdir}/usr/share/anki"
}
