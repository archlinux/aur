# Maintainer: Vitaliy <vitaliy.kuzmich@gmail.com>
pkgname=gohosts
_pkgname=gohosts
pkgver=1.0.0
pkgrel=1
pkgdesc="host file merge tool, written in go"
arch=('i686' 'x86_64')
license=('GPL')
backup=("etc/gohosts.json")
depends=(
)
makedepends=(
	'go'
	'git'
)

source=(
	"$_pkgname::git://github.com/vitaliy-kuzmich/gohosts.git#branch=${BRANCH:-master}"
)

md5sums=(
	'SKIP'
)

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
	
	lt=$(git describe --tags)

	echo ":: Building binary $lt" 
	echo ":: $(pwd)"
	go build -a -ldflags="-s -w -X main.Version=$lt" -o "$srcdir/go/bin/$_pkgname" 
}

package() {
	find "$srcdir/go/bin/" -type f -executable | while read filename; do
	echo $(basename $filename)
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
}
