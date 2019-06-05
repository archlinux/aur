# Maintainer: Shaoyu Tseng<zandimna@autistici.org>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com
# Contributor: Sławomir Kowalski <suawekk+aur@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
# Contributor: Dave Pretty <david dot pretty at gmail dot com>

pkgname=anki-git
pkgver=r1940.9396d74
pkgrel=1
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) efficiently"
url="http://ankisrs.net/"
license=('AGPL3')
arch=('any')
provides=('anki')
conflicts=('anki' 'anki20')
depends=('python-pyqt5' 'python-beautifulsoup4' 'python-httplib2'
    'python-pyaudio' 'python-requests' 'python-send2trash' 'qt5-webengine'
    'python-pyqtwebengine')
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

    mkdir -p "$pkgdir"/usr/share/anki
    cp -av anki aqt web "$pkgdir"/usr/share/anki/
    sed -e 's:@PREFIX@:/usr/:' tools/runanki.system.in > tools/runanki.system
    install -m 0755 -D tools/runanki.system $pkgdir/usr/bin/anki
	install -m 0644 -D -t $pkgdir/usr/share/pixmaps anki.xpm anki.png
	install -m 0644 -D -t $pkgdir/usr/share/applications anki.desktop
	install -m 0644 -D -t $pkgdir/usr/share/man/man1 anki.1
	install -m 0644 -D -t $pkgdir/usr/share/doc/anki README.contributing README.development README.md LICENSE LICENSE.logo
	echo "Install complete."
}
