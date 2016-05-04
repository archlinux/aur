# Maintainer: Stanislav Seletskiy <s.seletskiy@gmail.com>
pkgname=carcosa-git
pkgver=20160503.6_3cc15d5
pkgrel=1
pkgdesc="store secrets and passwords in public git repo"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('go' 'git')

source=(
	"carcosa-git::git://github.com/seletskiy/carcosa.git"
)

md5sums=(
	'SKIP'
)

backup=(
)

pkgver() {
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

	git submodule init
	git submodule update

	echo "Running 'go get'..."
	GO15VENDOREXPERIMENT=1 go get
}

package() {
	find "$srcdir/.go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename ${filename%*-git})"
	done
}
