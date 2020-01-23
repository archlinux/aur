# Maintainer: Denis Zheleztsov <difrex.punk@gmail.com>
pkgname=swaymgr
_pkgname=swaymgr
pkgver=20200123.3_c346cef
pkgrel=1
pkgdesc="Sway autotiling manager"
arch=('x86_64')
license=('Apache 2.0')
depends=()
makedepends=(
	'go'
	'git'
)

source=(
	"$_pkgname::git+https://github.com/Difrex/swaymgr"
)
md5sums=('SKIP')

pkgver() {
	if [[ "$PKGVER" ]]; then
		echo "$PKGVER"
		return
	fi

	cd "$srcdir/$_pkgname"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

build() {
	cd "$srcdir/$_pkgname"
	export GOPATH="$srcdir/go"
    export GOBIN="$srcdir/go/bin"

	echo ":: Updating git submodules"
	git submodule update --init

	echo ":: Building binary"
	go get -v -t ./... # -v \
		# -gcflags "-trimpath $GOPATH/src"
}

package() {
	find "$srcdir/go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
}
