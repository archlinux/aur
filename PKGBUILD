# Author: Kyle Manna <kyle at kylemanna dot com>

pkgname=do-agent
pkgver=2.1.3
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

sha512sums=('aa90753a19354f5fe8a3c7744197df5b01524ab1c68965139f893a90c8222b7b29130836153b2c4145733a4ca5d4fe0f5977f3272e5ac6e825d791d8aa78e221'
            '19d040ae8a75a73a86c1b473983ecf84410fc6a24a7f9142e98dc00c6dbda1ff1f2e2caec0d37bb3c6f557133644ea91f49a75697f5c4bdc23af56407d1fbcaa')

prepare() {
	cd "$srcdir"
	mkdir -p go/src/github.com/digitalocean
	mv "$srcdir/$pkgname-$pkgver" "$srcdir/go/src/github.com/digitalocean/$pkgname"
	ln -s "$srcdir/go/src/github.com/digitalocean/$pkgname" "$srcdir/$pkgname-$pkgver"
}

build() {
	export GOPATH=$srcdir/go
	cd "$srcdir/go/src/github.com/digitalocean/$pkgname"
	make build
}

package() {
	install -d $pkgdir/usr/{bin,lib/systemd/system}
	install -Dm755 "$srcdir/$pkgname-$pkgver/target/do-agent-linux-amd64" "$pkgdir/usr/bin/do-agent"
	install -Dm644 "$srcdir/do-agent.service" "$pkgdir/usr/lib/systemd/system/do-agent.service"
}
