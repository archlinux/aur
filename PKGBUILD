# Maintainer: hmsy <heimoshuiyu at gmail dot com>

pkgname=caddy-webdav-git
pkgver=20230822.4776f62c
pkgrel=1
pkgdesc='HTTP/2 Web Server with Automatic HTTPS and webdav plugin'
arch=('x86_64')
url="https://github.com/caddyserver/caddy"
license=('Apache')
depends=()
makedepends=('git' 'go')
provides=("caddy")
conflicts=("caddy")
backup=('etc/caddy/Caddyfile')

source=("caddy::git+https://github.com/caddyserver/caddy"
	"Caddyfile"
	"caddy.service"
	"sysusers-caddy.conf"
	"tmpfiles-caddy.conf"
)
sha256sums=('SKIP'
            '2bcb3cc1e19cec630ea64c014bba5463d49c45a2712d1107d1d10e87d3c023c6'
            '8ba0cb8356921d6a84ad39a81908c433906d9dbf9381a68778fefaa681af7309'
	    'a9294eeba17a8fd57cf11cef21e2eb3719a016646eeac0764a0d9f9f380a40ef'
	    '654720ba129d7506676df0923737df513c2a438e6141dafbac66c61e4c1c04a0'
    )


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
	install -D -m 0644 tmpfiles-caddy.conf "${pkgdir}/usr/lib/tmpfiles.d/caddy.conf"
	install -D -m 0644 sysusers-caddy.conf "${pkgdir}/usr/lib/sysusers.d/caddy.conf"
}
