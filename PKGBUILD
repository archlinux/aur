# Maintainer: Stanislav Seletskiy <s.seletskiy@gmail.com>
pkgname=bmo-git
pkgver=20160412.16_45d0829
pkgrel=1
pkgdesc="the missing tool for parsing structured text, like logs"
arch=('i686' 'x86_64')
license=('GPL')
depends=(
)
makedepends=(
	'go'
	'git'
)

source=(
	"bmo::git://github.com/reconquest/bmo"
)

md5sums=(
	'SKIP'
)

backup=(
)

pkgver() {
	cd "$srcdir/bmo"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

check() {
	cd "$srcdir/.go/src/bmo/tests"

    ./run_tests.sh
}

build() {
	cd "$srcdir/bmo"

	if [ -L "$srcdir/bmo" ]; then
		rm "$srcdir/bmo" -rf
		mv "$srcdir/.go/src/bmo/" "$srcdir/bmo"
	fi

	rm -rf "$srcdir/.go/src"

	mkdir -p "$srcdir/.go/src"

	export GOPATH="$srcdir/.go"

	mv "$srcdir/bmo" "$srcdir/.go/src/"

	cd "$srcdir/.go/src/bmo/"
	ln -sf "$srcdir/.go/src/bmo/" "$srcdir/bmo"

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
