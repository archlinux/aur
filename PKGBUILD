pkgname=go-lint-git
pkgver=20210508.185_6edffad
pkgrel=1
pkgdesc="golang lint"
arch=('i686' 'x86_64')
license=('BSD 3-Clause')
url="https://github.com/golang/lint"

depends=(
)

makedepends=(
	'go>=1.12'
	'git'
)

source=(
	"git://github.com/golang/lint.git"
)

md5sums=(
	'SKIP'
)

backup=(
)

conflicts=(
    go-lint
)

provides=(
    go-lint
)

pkgver() {
	cd "$srcdir/lint"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

build() {
	GOBIN=$srcdir/bin/
	mkdir -p $GOBIN
	cd $srcdir/lint/golint
	go install -v .
}

package() {
	find "$srcdir/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
}
