# Maintainer: alzeih <alzeih@users.noreply.github.com>

pkgname=do-agent-git
pkgver=0.4.7.r0.77576fd
pkgrel=1
pkgdesc="Collects system metrics from DigitalOcean Droplets"
arch=('i686' 'x86_64')
url="https://github.com/digitalocean/do-agent"
license=('Apache')
depends=()
makedepends=('go')
options=()
source=('do-agent::git+https://github.com/digitalocean/do-agent.git'
	'do-agent.service')
sha512sums=('SKIP'
            '777cd31a2c770d5e51af0381becc3b1affa6070a005aa5c2617c09d7a974d599602c0b8a80cd167fc4a87d15c15d1ca48c780caf08155948b3e8c6afa466117e')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir"
	# make temporary GOPATH for govendor and link git checkout into here
	mkdir -p go/{bin,src}
	mkdir -p go/src/github.com/digitalocean
	ln -s "$srcdir/${pkgname%-git}" "$srcdir/go/src/github.com/digitalocean/${pkgname%-git}"
}

build() {
	cd "$srcdir/go/src/github.com/digitalocean/${pkgname%-git}"
	PATH="$srcdir/go/bin:$PATH" GOPATH="$srcdir/go" make build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d $pkgdir/usr/{bin,lib/systemd/system}
	install -Dm755 do-agent $pkgdir/usr/bin/do-agent
	install -Dm644 "$srcdir/do-agent.service" $pkgdir/usr/lib/systemd/system/do-agent.service
}
