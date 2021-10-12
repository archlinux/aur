# Maintainer: hmsy <heimoshuiyu at gmail dot com>

pkgname=caddy-webdav-git
pkgver=20211012.c4790d7f
pkgrel=1
pkgdesc='HTTP/2 Web Server with Automatic HTTPS and webdav plugin'
arch=('x86_64')
url="https://giteub.com/caddyserver/caddy"
license=('Apache')
depends=()
makedepends=('git' 'go')
provides=("caddy")
conflicts=("caddy")
backup=('etc/caddy/Caddyfile')

source=("caddy::git://github.com/caddyserver/caddy"
	"Caddyfile"
	"caddy.service")
sha256sums=('SKIP'
            '2bcb3cc1e19cec630ea64c014bba5463d49c45a2712d1107d1d10e87d3c023c6'
            '7c5cd88ac3a35e3cb5f467118bcf0dac896aba00945ce1566df710c09bf985c2')


pkgver() {
	cd "${srcdir}/caddy"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/caddy/cmd/caddy/"
	sed -e "/plug in Caddy modules here/a\\
	_ \"github.com/mholt/caddy-webdav\"" < main.go > main.go.patched
	cp main.go.patched main.go
	rm main.go.patched
}

build() {
	cd "${srcdir}/caddy/cmd/caddy"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	rm -f go.mod
	go mod init caddy
	go mod tidy
	go build -v .
}

package() {
	cd "${srcdir}"
	install -D -m 0755 caddy/cmd/caddy/caddy "${pkgdir}/usr/bin/caddy"
	install -D -m 0644 caddy.service "${pkgdir}/usr/lib/systemd/system/caddy.service"
	install -D -m 0644 Caddyfile "${pkgdir}/etc/caddy/Caddyfile"
}
