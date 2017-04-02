# Maintainer: phiresky <phireskyde+git@gmail.com>
pkgname=reddit-placebot
pkgver=1.0.0
pkgrel=2
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
source=('git+https://github.com/wijagels/reddit-placebot')
noextract=()
md5sums=('SKIP')

#pkgver() {
	# cd "$srcdir/$pkgname"

# Git, tags available
	#printf "%s" "$(git describe --tags --abbrev=0)"
#}

prepare() {
	cd "$srcdir/$pkgname"
	# git checkout "tags/$(git describe --tags --abbrev=0)"
}

build() {
	cd "$srcdir/$pkgname"
	npm install
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/"{lib/systemd/user,bin}
	cp -r "$srcdir/$pkgname" "$pkgdir/usr/lib"
	rm -r "$pkgdir/usr/lib/$pkgname/.git"
	cp "$srcdir/../reddit-placebot.service" "$pkgdir/usr/lib/systemd/user"
	cat >> "$pkgdir/usr/bin/reddit-placebot" <<"EOF"
#!/bin/bash

cd $(mktemp -d --suffix -reddit-placebot)
node /usr/lib/reddit-placebot/run.js
EOF
	chmod +x "$pkgdir/usr/bin/reddit-placebot"
}
