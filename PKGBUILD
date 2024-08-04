#!/bin/bash
# Maintainer: Kimiblock Moe

pkgname=(cinny-web)
pkgbase=cinny
pkgver=4.1.0
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
sha512sums=('ae8e9f3ae731b543b524994657ad47861dc2fd6af2c9a0b5f8edc4a2e62b995d9e018c03b1d3dcf67570d9e5f3caf5454baeea9407e0d6b92a4bfe8df2b7133d')

function prepare() {
	NODE_OPTIONS="--max_old_space_size=4096"
	cd "cinny-${pkgver}"
	#yarn
	npm install --legacy-peer-deps
}

build() {
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
	#install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	if [[ $(pacman -Q cinny-web | cut -c 11-) =~ 3.1.0 ]]; then
		echo "[Warn] Configuration directory is changed! Consult the pinned AUR comment for more information."
		sleep 5s
	fi
}
