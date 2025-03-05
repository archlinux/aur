#!/bin/bash
# Maintainer: Kimiblock Moe

pkgname=(cinny-web)
pkgbase=cinny
pkgver=4.5.1
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
sha512sums=('cfadd845a18493fcc81fe8857d1044a78ac4e5415b52000c1f3cc1e7e5ec3a7f3e3d9e021525a9621fa14b57149492a268dc1f5db8987c7c32e2d2242c8db981')

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
