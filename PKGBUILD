# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Wei Congrui < crvv.mail at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Eric Engeström <eric at engestrom dot ch>
# Contributor: Andreas Linz <klingt.net at gmail dot com>
# Contributor: Akshay S Dinesh <asdofindia at gmail dot com>

pkgname=caddy1-git
_pkgname=caddy1
pkgver=20200413.3b4f7a3c
pkgrel=1
pkgdesc='HTTP/2 Web Server with Automatic HTTPS'
url='https://caddyserver.com/'
license=('Apache')
arch=('x86_64')
makedepends=('git' 'go')
source=("git+https://github.com/mholt/caddy.git#branch=v1"
        'tmpfiles'
        'service'
        'conf')
sha256sums=('SKIP'
            'c479f5736770bbcbe73511955f626b1eadebee37376af0637aed50bf113a6241'
            'bafc3d626f91c4a8135a7b7fbf9c662d50acf37a001976ac4e5f193b4a2aa79c'
            '5c48ac9bb5bdba72d2f5aed5a32356f38b196c88a18ba0c91cb6157675506ea1')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

backup=('etc/caddy1.conf')

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
	cd caddy
	go build -v
}

package() {
	cd "${srcdir}/caddy"
	install -D -m 0755 caddy/caddy "${pkgdir}/usr/bin/caddy1"
	install -D -m 0644 ../tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/caddy1.conf"
	install -D -m 0644 ../service "${pkgdir}/usr/lib/systemd/system/caddy1.service"
	install -D -m 0644 ../conf "${pkgdir}/etc/caddy1.conf"
}
