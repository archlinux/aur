# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Wei Congrui < crvv.mail at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Eric Engeström <eric at engestrom dot ch>
# Contributor: Andreas Linz <klingt.net at gmail dot com>
# Contributor: Akshay S Dinesh <asdofindia at gmail dot com>

pkgname=caddy-git
_pkgname=caddy
pkgver=20190311.e6a3e5e1
pkgrel=1
pkgdesc='HTTP/2 Web Server with Automatic HTTPS'
url='https://caddyserver.com/'
license=('Apache')
arch=('x86_64')
makedepends=('git' 'go')
source=("git+https://github.com/mholt/caddy.git"
        'tmpfiles'
        'service'
        'conf')
sha256sums=('SKIP'
            'bd4d912d083be176727882ccc1bbe577a27cc160db09238e5edc05ba458aebce'
            'e9c228a7ae33e4beb229bcf4f49f031d9b19dc1de78bf2e26c885c401e017ad6'
            '5c48ac9bb5bdba72d2f5aed5a32356f38b196c88a18ba0c91cb6157675506ea1')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

backup=('etc/caddy.conf')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}"

	_cargo=build/src
	_gopkg=github.com/mholt/caddy
	export GOPATH="${srcdir}/build"

	git clone caddy "${_cargo}/${_gopkg}"
#	sed '/^import/a\
#_ "github.com/jung-kurt/caddy-cgi"\
#_ "github.com/captncraig/caddy-realip"\
#' \
#	-i "${_cargo}/${_gopkg}/caddy/caddymain/run.go"
	go get -v -d "${_gopkg}/caddy/caddymain"
}

build() {
	cd "${srcdir}"
	export GOPATH="${srcdir}/build"
	go build -v -o build/caddy github.com/mholt/caddy/caddy
}

package() {
	cd "${srcdir}"
	install -D -m 0755 build/caddy "${pkgdir}/usr/bin/caddy"
	install -D -m 0644 tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/caddy.conf"
	install -D -m 0644 service "${pkgdir}/usr/lib/systemd/system/caddy.service"
	install -D -m 0644 conf "${pkgdir}/etc/caddy.conf"
}
