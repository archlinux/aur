# Author: Kyle Manna <kyle at kylemanna dot com>

pkgname=do-agent
pkgver=0.5.1
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

sha512sums=('8f5c47b5686ed811f343626a5c5a90010b956f8c90dce5d74cfb78cbfbcadf7d688156a2213c9868d3f8dc566eed1ff5ec3c9aa5fdfc4432a88d77d6bbbcbdb1'
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
