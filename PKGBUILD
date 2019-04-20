# Author: Kyle Manna <kyle at kylemanna dot com>

pkgname=do-agent
pkgver=2.1.4
pkgrel=1
pkgdesc='DigitalOcean Agent for Enhanced Droplet Graphs'
url='https://github.com/digitalocean/do-agent'
arch=('x86_64')
makedepends=('docker')
depends=()

license=('Apache')

source=("https://github.com/digitalocean/${pkgname}/archive/${pkgver}.tar.gz"
        "do-agent.service")

sha512sums=('8352bb7c63d85e126494a8d72b54c091ec40646622f715ee7599915e0af17df82fbd4dc4d814743548928afa0a66ae8c8c721a332461c98e336e698c21db05b9'
            '19d040ae8a75a73a86c1b473983ecf84410fc6a24a7f9142e98dc00c6dbda1ff1f2e2caec0d37bb3c6f557133644ea91f49a75697f5c4bdc23af56407d1fbcaa')

prepare() {
    cd "$srcdir"
    mkdir -p go/src/github.com/digitalocean
    mv "$srcdir/$pkgname-$pkgver" "$srcdir/go/src/github.com/digitalocean/$pkgname"
    ln -s "$srcdir/go/src/github.com/digitalocean/$pkgname" "$srcdir/$pkgname-$pkgver"
}

build() {
    cd "$srcdir/go/src/github.com/digitalocean/$pkgname"
    export GOPATH=$srcdir/go
    make build
}

package() {
    install -d $pkgdir/usr/{bin,lib/systemd/system}
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/do-agent-linux-amd64" "$pkgdir/usr/bin/do-agent"
    install -Dm644 "$srcdir/do-agent.service" "$pkgdir/usr/lib/systemd/system/do-agent.service"
}
