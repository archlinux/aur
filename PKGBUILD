# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Gökberk Yaltıraklı <aur at gkbrk dot com>
# Contributor: Drew DeVault <sir@cmpwn.com>

pkgname=aerc-git
_pkgname=aerc
pkgver=r285.1ec72f8
pkgrel=1
pkgdesc='Email Client for your Terminal'
arch=('x86_64')
url='https://git.sr.ht/~sircmpwn/aerc'
license=('MIT')
depends=('libvterm')
makedepends=('go' 'scdoc')
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

prepare() {
    cd "$srcdir/$_pkgname"
    # change filenames in example config to include package dirs
    sed -i 's|contrib/\(.*\)|/usr/share/aerc/\1|' config/aerc.conf
}

build() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
