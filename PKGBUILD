# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Gökberk Yaltıraklı <aur at gkbrk dot com>

pkgname=aerc-git
_pkgname=aerc
pkgver=r272.4d6e665
pkgrel=1
pkgdesc='Email Client for your Terminal'
arch=('x86_64')
url='https://git.sr.ht/~sircmpwn/aerc'
license=('MIT')
depends=('libvterm')
makedepends=('go')
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
    go build \
        -gcflags "all=-trimpath=$PWD" \
        -asmflags "all=-trimpath=$PWD" \
        -ldflags "-extldflags $LDFLAGS" \
        -o $_pkgname .
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "aerc" "$pkgdir/usr/bin/aerc"
    install -Dm644 "config/accounts.conf" "$pkgdir/usr/share/doc/aerc/accounts.conf"
    install -Dm644 "config/aerc.conf" "$pkgdir/usr/share/doc/aerc/aerc.conf"
    install -Dm644 "config/binds.conf" "$pkgdir/usr/share/doc/aerc/binds.conf"

    # install contrib scripts
    install -Dm755 -d "$pkgdir/usr/share/aerc"
    cp contrib/* "$pkgdir/usr/share/aerc/"
}
