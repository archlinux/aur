# Maintainer: TheJonsey <mail@thejonsey.com>
pkgname=streamdeckui
_pkgname=streamdeckui
pkgver=20210319.30_9899dcb
pkgrel=1
pkgdesc="Editor for the Elgato Streamdeck Linux Driver Streamdeckd"
arch=('i686' 'x86_64')
url='https://github.com/unix-streamdeck/streamdeckui'
license=('BSD-3')
depends=(
)
makedepends=(
	'go'
	'git'
)

source=(
	"$_pkgname::git+git://github.com/unix-streamdeck/streamdeckui#branch=${BRANCH:-master}"
	"streamdeckui.png"
	"streamdeckui.desktop"
)

md5sums=(
	'SKIP'
	'f2dc0ac7c013c736986d256f330ac2e1'
	'59af3b1d7bc4fabdd3d56fb7c48fd6a2'
)

backup=(
)

pkgver() {
	if [[ "$PKGVER" ]]; then
		echo "$PKGVER"
		return
	fi

	cd "$srcdir/$_pkgname"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

build() {
	cd "$srcdir/$_pkgname"

	if [ -L "$srcdir/$_pkgname" ]; then
		rm "$srcdir/$_pkgname" -rf
		mv "$srcdir/go/src/$_pkgname/" "$srcdir/$_pkgname"
	fi

	rm -rf "$srcdir/go/src"

	mkdir -p "$srcdir/go/src"

	export GOPATH="$srcdir/go"

	mv "$srcdir/$_pkgname" "$srcdir/go/src/"

	cd "$srcdir/go/src/$_pkgname/"
	ln -sf "$srcdir/go/src/$_pkgname/" "$srcdir/$_pkgname"

	echo ":: Updating git submodules"
	git submodule update --init

	echo ":: Building binary"
	go get -v \
		-gcflags "-trimpath $GOPATH/src"
}

package() {
	find "$srcdir/go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
	install -DT -m0755 "$srcdir/streamdeckui.png" "$pkgdir/usr/local/share/icons/hicolor/256x256/apps/streamdeckui.png"
	install -DT -m0755 "$srcdir/streamdeckui.desktop" "$pkgdir/usr/share/applications/streamdeckui.desktop"
}
