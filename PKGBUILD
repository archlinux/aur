pkgname=go-symbols-git
pkgver=20151212.3_b75dfef
pkgrel=1
pkgdesc="A utility for extracting a JSON representation of the package symbols from a go source tree."
arch=('i686' 'x86_64')
license=('GPL')
depends=(
)
makedepends=(
	'go'
	'git'
)

source=(
	"git://github.com/newhook/go-symbols.git"
)

md5sums=(
	'SKIP'
)

backup=(
)

conflicts=(
)

pkgver() {
	cd "$srcdir/go-symbols"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

build() {
	GOPATH=$srcdir
	GOBIN=$srcdir/bin/
	mkdir -p $srcdir/src
	ln -sf $srcdir/go-symbols $srcdir/src
	cd $srcdir/src/go-symbols
	go get -v
}

package() {
	find "$srcdir/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
}
