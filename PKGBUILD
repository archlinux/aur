# Author: Kyle Manna <kyle at kylemanna dot com>

pkgname=do-agent
pkgver=0.4.7
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

sha512sums=('64147e6e2e7b78bb696c942b337440eb682628252d650a1a3cc7d42f3502a64f7ec58040e45f1cc887982332103a19bdb2beb10ee4afd4f1cd33f5d80cd97d9b'
            '9c926ce72e5e37c59f4ceb05db91b10da24d2c9d757395549ce8d01531adae10a18b76952f66044fd7f551198119b8750adac8ab45650d2646ae60f64364d8e2')

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
