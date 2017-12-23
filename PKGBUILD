pkgname=go-dep-git
pkgver=20171222.2849_d9ce240c
pkgrel=1
pkgdesc="Go dependency management tool"
arch=('i686' 'x86_64')
license=('Custom')
depends=(
)
makedepends=(
	'go'
	'git'
)

source=(
	"git://github.com/golang/dep.git"
)

md5sums=(
	'SKIP'
)

backup=(
)

conflicts=(
)

pkgver() {
	cd "$srcdir/dep"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

build() {
	GOPATH=$srcdir
	GOBIN=$srcdir/bin/
	mkdir -p $srcdir/src/github.com/golang
	ln -sf $srcdir/dep $srcdir/src/github.com/golang
	cd $srcdir/src/github.com/golang/dep
	go install -v ./...
}

package() {
	find "$srcdir/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
}
