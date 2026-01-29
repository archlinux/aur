# Maintainer: Warren Wu <warrenweiwu04@gmail.com>
pkgname=bananatype
pkgver=0.0.4
pkgrel=1
pkgdesc="monkeytype in your terminal"
arch=('x86_64')
url="https://github.com/WarrenWu4/bananatype"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('!strip')

build() {
    cd "$srcdir/$pkgname"

    go build \
        -trimpath \
        -mod=readonly \
        -modcacherw \
        -ldflags="-X 'bananas/pkg/resourcepath.Build=prod' -X 'main.Build=prod' -extldflags \"$LDFLAGS\"" \
        -o "$pkgname" .
}

package() {
    cd "$srcdir/$pkgname"
    
    # Install binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install resources
    # Using -t to specify target directory and -m for permissions
    install -Dm644 resources/common-words.txt -t "$pkgdir/usr/share/$pkgname/"

    # Install License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
