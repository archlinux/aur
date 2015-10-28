#Maintainer wicast <wicastchen at hotmail>
pkgname=go-tools
_pkgname=tools
pkgver=20151028.1639_f96de0f
pkgrel=1
pkgdesc="Various packages and tools that support the Go programming language"
arch=('i686' 'x86_64')
url='https://golang.org/x/tools'
license=('BSD')
makedepends=('go' 'git')

source=(
	#"go-tools::git+https://go.googlesource.com/tools"
	#"go-net::git+https://go.googlesource.com/net"
	"go-tools::git+https://github.com/golang/tools.git"
	"go-net::git+https://github.com/golang/net.git"
)

md5sums=(
	'SKIP'
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
    mkdir -p "$GOPATH/src/golang.org/x/"
    ln -sf "$srcdir/$pkgname" "$GOPATH/src/golang.org/x/$_pkgname"
    ln -sf "$srcdir/go-net" "$GOPATH/src/golang.org/x/net"
    cd "$srcdir/.go/src/golang.org/x/$_pkgname"
    
    #remove those already in main package
    rm -rf ./cmd/godoc ./cmd/vet

    for file in ./cmd/*
    do
        GO15VENDOREXPERIMENT=1 go  get -v ./$file
    done
}

package() {
	find "$srcdir/.go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
}
