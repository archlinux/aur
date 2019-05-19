# Maintainer: Gökberk Yaltıraklı <aur at gkbrk dot com>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=aerc2-git
_pkgname=aerc2
pkgver=r246.ca2cd00
pkgrel=1
pkgdesc='Email Client for your Terminal'
arch=('x86_64')
url='https://git.sr.ht/~sircmpwn/aerc'
license=('MIT')
depends=('libvterm')
makedepends=('go')
provides=('aerc2')
conflicts=('aerc2')
source=("aerc2::git+$url")
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
    sed -i 's|contrib/\(.*\)|/usr/share/aerc2/\1|' config/aerc.conf
}

build() {
    cd "$srcdir/$_pkgname"
    go build \
        -gcflags "all=-trimpath=$PWD" \
        -asmflags "all=-trimpath=$PWD" \
        -ldflags "-extldflags $LDFLAGS" \
        -o $_pkgname .
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "aerc2" "$pkgdir/usr/bin/aerc2"
    install -Dm644 "config/accounts.conf" "$pkgdir/usr/share/doc/aerc2/accounts.conf"
    install -Dm644 "config/aerc.conf" "$pkgdir/usr/share/doc/aerc2/aerc.conf"
    install -Dm644 "config/binds.conf" "$pkgdir/usr/share/doc/aerc2/binds.conf"

    # install contrib scripts
    install -Dm755 -d "$pkgdir/usr/share/aerc2"
    cp contrib/* "$pkgdir/usr/share/aerc2/"
}
