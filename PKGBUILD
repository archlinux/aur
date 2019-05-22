# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Gökberk Yaltıraklı <aur at gkbrk dot com>

pkgname=aerc-git
_pkgname=aerc
pkgver=r280.062f00e
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
    make PREFIX=$pkgdir/usr
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=$pkgdir/usr install
}
