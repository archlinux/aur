# Author: Kyle Manna <kyle at kylemanna dot com>

pkgname=do-agent
pkgver=0.4.11
pkgrel=1
pkgdesc='DigitalOcean Agent for Enhanced Droplet Graphs'
url='https://github.com/digitalocean/do-agent'
arch=('x86_64')
makedepends=('go')
depends=()
_gourl='github.com/digitalocean/do-agent'

license=('apache')

source=("https://github.com/digitalocean/${pkgname}/archive/${pkgver}.tar.gz"
        "do-agent.service")

sha512sums=('2897e5d8bcd170b93c6ed728ed79e3774ca2ca1facec68f195f7f53ef56d2ffa8c7640a5e786463cfda390c99b4c0193d6d43d46454a2dce6d3c465c8e29041c'
            '19d040ae8a75a73a86c1b473983ecf84410fc6a24a7f9142e98dc00c6dbda1ff1f2e2caec0d37bb3c6f557133644ea91f49a75697f5c4bdc23af56407d1fbcaa')

prepare() {
	cd "$srcdir"
	# make temporary GOPATH for govendor and link git checkout into here
	mkdir -p go/{bin,src}
	mkdir -p go/src/github.com/digitalocean
	ln -s "$srcdir/$pkgname-$pkgver" "$srcdir/go/src/github.com/digitalocean/$pkgname"
}

build() {
	cd "$srcdir/go/src/github.com/digitalocean/$pkgname"
	PATH="$srcdir/go/bin:$PATH" GOPATH="$srcdir/go" make build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -d $pkgdir/usr/{bin,lib/systemd/system}
	install -Dm755 do-agent $pkgdir/usr/bin/do-agent
	install -Dm644 "$srcdir/do-agent.service" $pkgdir/usr/lib/systemd/system/do-agent.service
}
