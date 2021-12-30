# Maintainer:  Frank Seifferth <frankseifferth@posteo.net>

pkgname=abricotine-git
_pkgname=abricotine
conflicts=("abricotine")
provides=("abricotine")
pkgver=latest
pkgrel=1
pkgdesc="A markdown editor with inline preview"
arch=('x86_64')
url="http://abricotine.brrd.fr"
license=('GPL3')
depends=('libxss')
makedepends=('npm' 'python2' 'git')
source=("abricotine::git+https://github.com/brrd/abricotine"
        "abricotine.desktop")
sha256sums=('SKIP'
            '164d0042ffe461ca0418709a59be29b433055589b661be4d6555c07df42b383c')

pkgver() {
    cd "$srcdir/abricotine"
    printf "%s" "$(git describe --long --tags |
        sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/abricotine"

  npm install --cache ../cache --devdir="$srcdir/devdir"
  npm run packager
}

package() {
    cd "$srcdir/abricotine"

    install -d "$pkgdir/opt/abricotine"
    cp -r dist/*/* "$pkgdir/opt/abricotine"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/abricotine/abricotine" "$pkgdir/usr/bin/abricotine"

    install -Dm644 "../abricotine.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "icons/abricotine@2x.png" "$pkgdir/usr/share/pixmaps/abricotine.png"
}
