# Author: Kyle Manna <kyle at kylemanna dot com>

pkgname=do-agent
pkgver=0.4.13
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

sha512sums=('9d16fd13394775f1348471dfb2a763951fb2428f831d42896b50798ee0a7ca9591d4115e69df1136601099fe5f04d2c4f44d04d658c45f57a45c38ea5c0411b5'
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
