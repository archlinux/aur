# Maintainer: Sherlock Holo <sherlockya@gmail.com>
pkgname=camouflage
pkgver=20180729.94_55f6489
pkgrel=1
pkgdesc="a mux+websocket+TLS proxy"
arch=('i686' 'x86_64')
license=('MPL')
depends=()
makedepends=(
	'go'
	'git'
)

source=(
	"camouflage::git://github.com/Sherlock-Holo/camouflage#branch=${BRANCH:-master}"
    "camouflage.install"
)

md5sums=('SKIP'
         'd506ec62e984c89ddea0cec157292d42')

backup=(
    'etc/camouflage/example.toml'
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

	git submodule update --init

	go get -v \
		-gcflags "-trimpath $GOPATH/src"
}

package() {
	find "$srcdir/.go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done

    mkdir -p $pkgdir/etc/camouflage
    install -Dm644 $srcdir/.go/src/github.com/Sherlock-Holo/camouflage/config/example.toml $pkgdir/etc/camouflage/

	mkdir -p $pkgdir/usr/lib/systemd/system
    	install $srcdir/.go/src/github.com/Sherlock-Holo/camouflage/systemd/camouflage-{client,server}@.service \
        -Dm644 $pkgdir/usr/lib/systemd/system/
}
