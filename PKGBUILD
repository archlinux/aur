# Maintainer: hmsy <heimoshuiyu at gmail dot com>

pkgname=caddy-webdav-git
pkgver=20210927.059fc32f
pkgrel=1
pkgdesc='HTTP/2 Web Server with Automatic HTTPS and webdav plugin'
arch=('x86_64')
url="https://giteub.com/caddyserver/caddy"
license=('Apache')
depends=('caddy')
makedepends=('git' 'go')
provides=("caddy")
conflicts=("caddy")
backup=('etc/caddy/Caddyfile')

source=("caddy::git://github.com/caddyserver/caddy"
	"Caddyfile"
	"caddy.service")
sha256sums=('SKIP'
            'bcec35e3a514dffed5aae314cded658dd5fbd534d30756941ad37298bf066ab8'
            '9bdd2741269a0ac2088f325ca7c08bfa01ddc707149e5027170bc8aeb83cf0aa')


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
