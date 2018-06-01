# Maintainer: Egor Kovetskiy <e.kovetskiy@gmail.com>
pkgname=dard-git
pkgver=20180601.1_8d5ec8e
pkgrel=1
pkgdesc="simple http file storage daemon"
arch=('i686' 'x86_64')
license=('GPL')
depends=(
)
makedepends=(
	'go'
	'git'
)

source=(
	"dard-git::git://github.com/kovetskiy/dard#branch=${BRANCH:-master}"
)

md5sums=(
	'SKIP'
)

backup=(
)

pkgver() {
	if [[ "$PKGVER" ]]; then
		echo "$PKGVER"
		return
	fi

	cd "$srcdir/$pkgname"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

build() {
	cd "$srcdir/$pkgname"

	if [ -L "$srcdir/$pkgname" ]; then
		rm "$srcdir/$pkgname" -rf
		mv "$srcdir/.go/src/$pkgname/" "$srcdir/$pkgname"
	fi

	rm -rf "$srcdir/.go/src"

	mkdir -p "$srcdir/.go/src"

	export GOPATH="$srcdir/.go"

	mv "$srcdir/$pkgname" "$srcdir/.go/src/"

	cd "$srcdir/.go/src/$pkgname/"
	ln -sf "$srcdir/.go/src/$pkgname/" "$srcdir/$pkgname"

	git submodule update --init

	go get -v \
		-gcflags "-trimpath $GOPATH/src" \
		-ldflags="-X main.version=$pkgver-$pkgrel"
}

package() {
    install -DT "$srcdir/.go/bin/dard-git" "$pkgdir/usr/bin/dard"
    install -DT "$srcdir/.go/src/dard-git/systemd/dard.service" "$pkgdir/usr/lib/systemd/system/dard.service"
}
