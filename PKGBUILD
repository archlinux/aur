# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Wei Congrui < crvv.mail at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Eric Engeström <eric at engestrom dot ch>
# Contributor: Andreas Linz <klingt.net at gmail dot com>
# Contributor: Akshay S Dinesh <asdofindia at gmail dot com>

pkgname=caddy-git
_pkgname=caddy
pkgver=20241022.eaaa2e587
pkgrel=1
pkgdesc='HTTP/2 Web Server with Automatic HTTPS'
url='https://caddyserver.com/'
license=('Apache-2.0')
arch=('x86_64')
makedepends=('git' 'go')
source=('git+https://github.com/caddyserver/caddy.git'
        'service'
        'conf')
sha256sums=('SKIP'
            '6a8b01fdd9e77903a72b4ef2554069ca07ee896627ab72bac383b60a613d3af7'
            '52e461351f3040ad62c6d7fcfd84391e820ae1a1935b87efd1d5eb271cdabce9')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

backup=('srv/http/Caddyfile')

pkgver() {
	cd "${srcdir}/caddy"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/caddy/cmd/caddy"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build .
}

package() {
	cd "${srcdir}/caddy"
	install -D -m 0755 cmd/caddy/caddy "${pkgdir}/usr/bin/caddy"
	install -D -m 0644 ../service "${pkgdir}/usr/lib/systemd/system/caddy2.service"
	install -D -m 0644 ../conf "${pkgdir}/srv/http/Caddyfile"
	ln -s caddy "${pkgdir}/usr/bin/caddy2"
}
