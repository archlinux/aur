# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Gökberk Yaltıraklı <aur at gkbrk dot com>
# Contributor: Drew DeVault <sir@cmpwn.com>

pkgname=aerc-rjarry-git
_pkgname=aerc
pkgver=0.6.0.r8.gf776fb8
pkgrel=1
pkgdesc='Email Client for your Terminal (new fork maintained by ~rjarry)'
arch=('x86_64')
url='https://git.sr.ht/~rjarry/aerc'
license=('MIT')
depends=('w3m' 'dante' 'notmuch')
makedepends=('git' 'go' 'scdoc')
provides=('aerc')
conflicts=('aerc')
source=("$_pkgname::git+https://git.sr.ht/~rjarry/aerc")
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
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw -tags=notmuch"
    make PREFIX=/usr VERSION="$(pkgver)"
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
