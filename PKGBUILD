# Maintainer: Stanislav Seletskiy <s.seletskiy@gmail.com>
pkgname=zeus-git
_pkgname=zeus
pkgver=20200118.9_2dd8962
pkgrel=1
pkgdesc="zfs backup tool"
arch=('i686' 'x86_64')
license=('GPL')
depends=(
)
makedepends=(
	'go'
	'git'
)

source=(
	"$_pkgname::git://github.com/reconquest/zeus.git#branch=${BRANCH:-master}"
	"zeusd.service"
)

md5sums=('SKIP'
         '0e60533305684a378c0abe73a19b8169')

backup=(
)

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

	echo ":: Updating git submodules"
	git submodule update --init

	echo ":: Building binary"
	go get -v \
		-gcflags "-trimpath $GOPATH/src" ./cmd/...
}

package() {
	find "$srcdir/go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
	install -DT -m0755 "$srcdir/zeusd.service" "$pkgdir/usr/lib/systemd/system/zeusd.service"
}
