pkgname=go-returns-git
pkgver=20160408.11_01f4431
pkgrel=1
pkgdesc="Command gopkgs list your installed Go packages for import"
arch=('i686' 'x86_64')
license=('GPL')
depends=(
)
makedepends=(
	'go'
	'git'
)

source=(
	"git://github.com/tpng/gopkgs.git"
)

md5sums=(
	'SKIP'
)

backup=(
)

conflicts=(
)

pkgver() {
	cd "$srcdir/gopkgs"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

build() {
	GOPATH=$srcdir
	GOBIN=$srcdir/bin/
	mkdir -p $srcdir/src
	ln -sf $srcdir/gopkgs $srcdir/src
	cd $srcdir/src/gopkgs
	go get -v
}

package() {
	find "$srcdir/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
}
