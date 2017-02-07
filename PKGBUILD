# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=sipcmd-git
pkgver=r31.ea2f66b
pkgrel=2
pkgdesc="Command line soft phone"
url="https://github.com/tmakkonen/sipcmd"
arch=('i686' 'x86_64')
license=('GPL')
depends=("gcc-libs" "opal")
makedepends=("ruby-ronn")
source=("sipcmd::git+https://github.com/tmakkonen/sipcmd.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/sipcmd"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd sipcmd
    # compile program
    make

    # compile man-page from README
    ronn --manual="sipcmd" "$srcdir/sipcmd/doc/README"
    tail -n+3 "$srcdir/sipcmd/doc/README" > "$srcdir/sipcmd.8"
    gzip "$srcdir/sipcmd.8"
}

package() {
    install -Dm755 "$srcdir/sipcmd/sipcmd" "$pkgdir/usr/bin/sipcmd"
    install -Dm644 "$srcdir/sipcmd.8.gz" "$pkgdir/usr/share/man8/sipcmd.8.gz"
}
