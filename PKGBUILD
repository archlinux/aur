# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Wei Congrui < crvv.mail at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Eric Engeström <eric at engestrom dot ch>
# Contributor: Andreas Linz <klingt.net at gmail dot com>
# Contributor: Akshay S Dinesh <asdofindia at gmail dot com>

pkgname=caddy-git
_pkgname=caddy
pkgver=20210111.14f50d9d
pkgrel=1
pkgdesc='HTTP/2 Web Server with Automatic HTTPS'
url='https://caddyserver.com/'
license=('Apache')
arch=('x86_64')
makedepends=('git' 'go')
source=('git+https://github.com/caddyserver/caddy.git'
        'service'
        'conf')
sha256sums=('SKIP'
            '9b896e77ac33b9b364582d93cf5ab180145aa8879f9e6400e4c8620851b0c194'
            '52e461351f3040ad62c6d7fcfd84391e820ae1a1935b87efd1d5eb271cdabce9')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

backup=('srv/http/Caddyfile')

pkgver() {
	cd "${srcdir}/caddy"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/caddy"
	go get -v -d
}

build() {
	cd "${srcdir}/caddy"
	go build -v -o caddy2 cmd/caddy/main.go
}

package() {
	cd "${srcdir}/caddy"
	install -D -m 0755 caddy2 "${pkgdir}/usr/bin/caddy2"
	install -D -m 0644 ../service "${pkgdir}/usr/lib/systemd/system/caddy2.service"
	install -D -m 0644 ../conf "${pkgdir}/srv/http/Caddyfile"
	ln -s caddy2 "${pkgdir}/usr/bin/caddy"
}
