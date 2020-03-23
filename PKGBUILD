# Maintainer: Chris Sculley <cs.sculley at gmail dot com>
pkgname=idena-go-git
pkgver=v0.4.0.r245.g97eefe6
pkgrel=3
pkgdesc="The idena-go node for the Idena network"
arch=("x86_64")
url="https://github.com/idena-network/idena-go"
# license=("")
makedepends=("git" "go-pie")
depends=("glibc")
provides=("idena-go")
conflicts=("idena-go")
backup=("etc/idena-go/idena-go.json")
source=("$pkgname::git+https://github.com/idena-network/idena-go.git"
        "idena-go.json"
        "idena-go.service")
md5sums=("SKIP"
        "74cdd53e2c514d4a9f6488623b2e9170"
        "6001d4aab3b42844f2c087e06c9e4598")

pkgver() {
    cd "$srcdir/$pkgname"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$pkgname"
    go build \
        -trimpath \
        -ldflags "-extldflags $LDFLAGS" \
        -o idena-go .
}

package() {
    cd "$srcdir/$pkgname"
    
    mkdir -m755 "$pkgdir"/{usr,usr/bin,etc,etc/idena-go,usr/lib,usr/lib/systemd,usr/lib/systemd/system} 
    cp "$srcdir"/idena-go.json "$pkgdir"/etc/idena-go/idena-go.json
    cp "$srcdir"/idena-go.service "$pkgdir"/usr/lib/systemd/system/idena-go.service
    
    install -Dm755 idena-go -t "$pkgdir"/usr/bin/
    # install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
 
