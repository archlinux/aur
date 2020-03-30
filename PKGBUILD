# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Gökberk Yaltıraklı <aur at gkbrk dot com>
# Contributor: Drew DeVault <sir@cmpwn.com>

pkgname=aerc-git
_pkgname=aerc
pkgver=0.3.0.r68.g472c421
pkgrel=1
pkgdesc='Email Client for your Terminal'
arch=('x86_64')
url='https://git.sr.ht/~sircmpwn/aerc'
license=('MIT')
depends=('w3m' 'dante' 'notmuch')
makedepends=('git' 'go-pie' 'scdoc')
provides=('aerc')
conflicts=('aerc')
source=("$_pkgname::git+https://git.sr.ht/~sircmpwn/aerc")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"

    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    make GOFLAGS=-tags=notmuch PREFIX=/usr VERSION="$(pkgver)"
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
