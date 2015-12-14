# Maintainer: Egor Kovetskiy <e.kovetskiy@office.ngs.ru>
pkgname=lsgs-git
pkgver=20151203.7_a1a7af0
pkgrel=1
pkgdesc="small tool for listing git status on many repos"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('go' 'git')

source=(
	"lsgs::git://github.com/zazab/lsgs"
)

md5sums=(
	'SKIP'
)

backup=(
)

pkgver() {
	cd "$srcdir/lsgs"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

build() {
	cd "$srcdir/lsgs"

	if [ -L "$srcdir/lsgs" ]; then
		rm "$srcdir/lsgs" -rf
		mv "$srcdir/.go/src/lsgs/" "$srcdir/lsgs"
	fi

	rm -rf "$srcdir/.go/src"

	mkdir -p "$srcdir/.go/src"

	export GOPATH="$srcdir/.go"

	mv "$srcdir/lsgs" "$srcdir/.go/src/"

	cd "$srcdir/.go/src/lsgs/"
	ln -sf "$srcdir/.go/src/lsgs/" "$srcdir/lsgs"

	git submodule init
	git submodule update

	echo "Running 'go get'..."
	GO15VENDOREXPERIMENT=1 go get
}

package() {
	find "$srcdir/.go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
}
