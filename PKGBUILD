_origname='alsa-scarlett-gui'
_gitbr='vocaster'

pkgname="$_origname-$_gitbr-git"
pkgver=0.5.1.93.g6bf9
pkgrel=1
pkgdesc="GUI for the ALSA controls presented by the Scarlett2 driver, Vocaster dev version"
arch=('i686' 'x86_64')
url="https://github.com/geoffreybennett/alsa-scarlett-gui"
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')
depends=(
    'glibc'
    'glib2'
    'alsa-lib'
    'alsa-utils'
    'gtk4'
    'hicolor-icon-theme'
    'cairo'
    'pango'
    'openssl'
)
makedepends=('gcc' 'make' 'git' 'pkgconf' 'sed')
provides=("$_origname")
conflicts=("$_origname")
source=("git+${url}.git#branch=$_gitbr")
sha256sums=('SKIP')

pkgver() {
    cd "$_origname"
    git describe --abbrev=4 --always --tags | sed 's/-/./g'
}

build() {
    cd "$srcdir/$_origname"

    make \
        -C src \
        PREFIX=/usr \
        VERSION="$pkgver-$_gitbr-git"
}

package() {
    cd "$srcdir/$_origname"

    make \
        -C src \
        PREFIX="$pkgdir/usr" \
        VERSION="$pkgver-$_gitbr-git" \
        install

    # documentation
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md ./docs/*.md
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname/img" img/*
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname/demo" demo/*
}
