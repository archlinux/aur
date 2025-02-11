#!/bin/bash
# Maintainer: Kimiblock Moe

pkgname=(cinny-web)
pkgbase=cinny
pkgver=4.3.0
pkgrel=1
pkgdesc='Yet another matrix client — web version'
arch=(any)
license=(AGPL-3.0-or-later)
depends=()
url=https://github.com/cinnyapp/cinny
#makedepends=(npm git yarn)
makedepends=(npm yarn)
#source=("git+https://github.com/cinnyapp/cinny#tag=v${pkgver}")
source=(
	cinny-${pkgver}.tar.gz::"https://github.com/cinnyapp/cinny/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('5b01ca52f350b82c2cc8f5424c8ddb8e3bb34e6f30ffd3e890604ab42381dfa09f270042fecda6b55396187c4c6ef894affd61b2ae65baaedb2caabcb8123d1f')

function prepare() {
	NODE_OPTIONS="--max_old_space_size=4096"
	cd "cinny-${pkgver}"
	#yarn
	npm install --legacy-peer-deps
}

build() {
	if [ ! ${cinnyBase} ]; then
		cinnyBase='/'
	fi
	sed -i "s|/|${cinnyBase}|g" "${srcdir}"/"cinny-${pkgver}"/build.config.ts
	cd "cinny-${pkgver}"
	NODE_OPTIONS="--max_old_space_size=4096"
	#yarn dist
	#yarn run build
	npm run build
}

package_cinny-web() {
	url=https://github.com/cinnyapp/cinny
	NODE_OPTIONS="--max_old_space_size=4096"
	backup=('etc/webapps/cinny/config.json')
	cd "cinny-${pkgver}"
	install -d "$pkgdir/usr/share/webapps/$pkgbase"
	cp -r dist/* "$pkgdir/usr/share/webapps/$pkgbase"
	install -d "$pkgdir/etc/webapps/$pkgbase"
	mv "${pkgdir}/usr/share/webapps/$pkgbase/config.json" \
		"${pkgdir}/etc/webapps/$pkgbase/config.json"
	ln -sfr "${pkgdir}/etc/webapps/$pkgbase/config.json" \
		"${pkgdir}/usr/share/webapps/$pkgbase/config.json"
}
