# Author: Kyle Manna <kyle at kylemanna dot com>

pkgname=do-agent
pkgver=3.5.6
pkgrel=1
pkgdesc='DigitalOcean Agent for Enhanced Droplet Graphs'
url='https://github.com/digitalocean/do-agent'
arch=('x86_64')
makedepends=('docker')
depends=()

license=('Apache')

source=("https://github.com/digitalocean/${pkgname}/archive/${pkgver}.tar.gz"
        "do-agent.service")

sha512sums=('e0007dcc8df3eb5f217e8db0b8dc9696c5b8557090712254f2b91e6d7e9c94321141d2fcc9cd13dc0153d3f76c966b968818a1ff01130a561cb97765edf840a5'
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
    make VERSION=${pkgver} build
}

package() {
    install -d $pkgdir/usr/{bin,lib/systemd/system}
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/do-agent-linux-amd64" "$pkgdir/usr/bin/do-agent"
    install -Dm644 "$srcdir/do-agent.service" "$pkgdir/usr/lib/systemd/system/do-agent.service"
}
