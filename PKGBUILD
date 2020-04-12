# Maintainer: Dennis Stengele <dennis@stengele.me>
# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=beehive
pkgver=0.4.0
pkgrel=1
pkgdesc="A flexible event and agent system with lots of bees"
arch=('x86_64' 'i686')
url="https://github.com/muesli/beehive"
license=('AGPL3')
makedepends=('go' 'make')
options=('!strip' '!emptydirs' '!makeflags')
install=beehive.install
source=("$url/archive/v$pkgver.tar.gz"
        "beehive.install"
        "beehive.service")
sha256sums=('cfe18e937556371be11a08dee152b4d5258708d592d7ada3dfdfe8b1369bc380'
            '6c6d380bd00e907b42fecb87bd07157d9e4c7806daf2f293ec9e2f9e656363c0'
            '0b25ced04449720cba74c0c13bc6c0b75ff6f34bcaad58889745f572f66e7160')

build() {
    export GOPATH="$srcdir"/gopath
    export GO111MODULE=on

    mkdir -p "$GOPATH"/bin
    cd "$srcdir"/$pkgname-$pkgver

    export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD}"
    make
}

check() {
    export GOPATH="$srcdir"/gopath
    export GO111MODULE=on

    cd "$srcdir"/$pkgname-$pkgver
    make test
}

package() {
    # Install binary
    install -Dm755 "$pkgname-$pkgver/beehive" "$pkgdir/usr/bin/beehive"
    # Copy License
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # Copy Unit file
    install -Dm644 beehive.service "$pkgdir/usr/lib/systemd/system/beehive.service"
}

# vim:set ts=4 sw=4 et:
