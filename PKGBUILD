# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
pkgname=csvtools-git
pkgver=r317.0162d828ec
pkgrel=1
pkgdesc="GNU-alike tools for parsing RFC 4180 CSVs at high speed: csvcut, csvgrep, csvawk, csvpipe, csvunpipe"
arch=('any')
url="https://github.com/DavyLandman/csvtools"
license=('MIT')
makedepends=('git' 'pcre')
checkdepends=('openssl' 'sed')
source=("git+$url")
md5sums=('SKIP')

_fixflags() {
    if [[ $CFLAGS = *-Wp,-D_FORTIFY_SOURCE=3* ]]; then
        # upstream is broken with _FORTIFY_SOURCE=3, downgrade to _FORTIFY_SOURCE=2
        # https://github.com/DavyLandman/csvtools/issues/20
        CFLAGS=${CFLAGS/-D_FORTIFY_SOURCE=3/-D_FORTIFY_SOURCE=2}
    fi
}

build() {
    cd "$srcdir/csvtools"
    _fixflags
    make
}

check() {
    cd "$srcdir/csvtools"
    _fixflags
    make test
}

package() {
    cd "$srcdir/csvtools"
    mkdir -p "$pkgdir/usr/bin"
    make prefix="$pkgdir/usr" install
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

pkgver() {
    cd "$srcdir/csvtools"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
