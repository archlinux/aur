pkgname=go-returns-git
pkgver=20181028.38_538ac60
pkgrel=1
pkgdesc="go-returns"
arch=('i686' 'x86_64')
license=('GPL')
depends=(
)
makedepends=(
	'go'
	'git'
)

source=(
	"git+https://github.com/sqs/goreturns.git"
)

md5sums=(
	'SKIP'
)

backup=(
)

conflicts=(
)

pkgver() {
	cd "$srcdir/goreturns"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

build() {
	GOPATH=$srcdir
	GOBIN=$srcdir/bin/
	mkdir -p $srcdir/src
	ln -sf $srcdir/goreturns $srcdir/src
	cd $srcdir/src/goreturns
        GO111MODULE=off	go get -v
}

package() {
	find "$srcdir/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
}
