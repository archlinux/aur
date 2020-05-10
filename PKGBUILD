# Maintainer: fantasyzhjk <fantasyzhjk@outlook.com>

pkgname=mcping-git
pkgver=latest
pkgrel=1
pkgdesc="Ping any Minecraft server."
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/go-mc/mcping'
makedepends=('go' 'git')

source=(
	"git://github.com/go-mc/mcping.git"
)

md5sums=(
	'SKIP'
)

backup=(
)

pkgver() {
	cd "$srcdir/mcping"
	git log -1 --format="%cd" --date=short | sed s/-//g
}

prepare() {
	cd "$srcdir/mcping"

	rm -rf "$srcdir/.go/src"

	mkdir -p "$srcdir/.go/src"

	export GOPATH="$srcdir/.go"

	mv "$srcdir/mcping" "$srcdir/.go/src/"

	cd "$srcdir/.go/src/mcping/"
	ln -sf "$srcdir/.go/src/mcping/" "$srcdir/mcping"

	echo "Running 'go get'..."
	go get
}

build() {
	export GOPATH="$srcdir/.go"

	cd "$srcdir/.go/src/mcping/mcping/"

	mkdir -p build

	go build -ldflags "-s -w" \
		-o build/mcping .
}

package() {
	install -DT "$srcdir/.go/src/mcping/mcping/build/mcping" "$pkgdir/usr/bin/mcping"
}
