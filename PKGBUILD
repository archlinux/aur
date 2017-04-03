# Maintainer: phiresky <phireskyde+git@gmail.com>
pkgname=reddit-placebot
pkgver=r18.c8fcbfb
pkgrel=1
pkgdesc="Automatically place pixels on reddit.com/r/place (not working yet, needs patches)"
arch=(any)
url="https://github.com/wijagels/reddit-placebot"
license=('GPL3')
groups=()
depends=(nodejs)
makedepends=('git' npm)
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=reddit-placebot.install
sources=(
	'git+https://github.com/wijagels/reddit-placebot'
	'reddit-placebot.service'
	'reddit-placebot.install'
)

noextract=()


pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	# Git, tags available
	#printf "%s" "$(git describe --tags --abbrev=0)"
}

prepare() {
	cd "$srcdir/$pkgname"
	git checkout service
	# git checkout "tags/$(git describe --tags --abbrev=0)"
}

build() {
	cd "$srcdir/$pkgname"
	npm install --cache "$srcdir/npm-cache"
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/"{lib/systemd/user,bin}

	npm install -g --user root --prefix "$pkgdir"/usr

	cp "$srcdir/../reddit-placebot.service" "$pkgdir/usr/lib/systemd/user"
	cat >> "$pkgdir/usr/bin/reddit-placebot" <<"EOF"
#!/bin/bash

cd $(mktemp -d --suffix -reddit-placebot)
node /usr/lib/node_modules/reddit-placebot/run.js
EOF
	chmod +x "$pkgdir/usr/bin/reddit-placebot"
}


