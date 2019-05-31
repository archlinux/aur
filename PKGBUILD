# Maintainer: Dennis Stengele <dennis@stengele.me>
# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=beehive-git
pkgver=r815.5e1ccac
pkgrel=1
pkgdesc="A flexible event and agent system with lots of bees"
arch=('x86_64' 'i686')
url="https://github.com/muesli/beehive"
license=('AGPL3')
makedepends=('go' 'git' 'make')
options=('!strip' '!emptydirs' '!makeflags')
install=beehive.install
source=("$pkgname::git+https://github.com/muesli/beehive.git"
        "beehive.install"
        "beehive.service")
sha256sums=('SKIP'
            '6c6d380bd00e907b42fecb87bd07157d9e4c7806daf2f293ec9e2f9e656363c0'
            '0b25ced04449720cba74c0c13bc6c0b75ff6f34bcaad58889745f572f66e7160')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export GOPATH="$srcdir"/gopath
    export GO111MODULE=on

    mkdir -p "$GOPATH"/bin
    cd "$srcdir"/$pkgname

    export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD}"
    make
}

check() {
    export GOPATH="$srcdir"/gopath
    export GO111MODULE=on

    cd "$srcdir"/$pkgname
    make test
}

package() {
    # Install binary
    install -Dm755 "$pkgname/beehive" "$pkgdir/usr/bin/beehive"
    # Copy License
    install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # Copy Unit file
    install -Dm644 beehive.service "$pkgdir/usr/lib/systemd/system/beehive.service"
}

# vim:set ts=4 sw=4 et:
