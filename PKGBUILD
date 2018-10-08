# Maintainer: Sherlock Holo <sherlockya@gmail.com>
pkgname=camouflage
_pkgname=camouflage
pkgver=20181007.101_f2bcc44
pkgrel=1
pkgdesc="a mux+websocket+TLS proxy"
arch=('x86_64')
license=('MPL')
depends=()
makedepends=('go' 'git')
url='https://github.com/Sherlock-Holo/camouflage'
source=(
	"$_pkgname::git://github.com/Sherlock-Holo/camouflage#branch=${BRANCH:-master}"
    "camouflage.install"
)

md5sums=('SKIP'
         'd506ec62e984c89ddea0cec157292d42')

backup=(
    'etc/camouflage/example.toml'
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
    export GO111MODULE=on
    export CGO_ENABLED=0
	go get -v \
		-gcflags "-trimpath $PWD:$GOPATH/src"
    
    echo ":: Cleaning residual"
    chmod 777 -R $GOPATH/pkg/mod
    rm -rf $GOPATH/pkg/mod
}

package() {
	find "$srcdir/go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done

    mkdir -p $pkgdir/etc/camouflage
    install -Dm644 $srcdir/go/src/camouflage/config/example.toml $pkgdir/etc/camouflage/

	mkdir -p $pkgdir/usr/lib/systemd/system
    install $srcdir/go/src/camouflage/systemd/camouflage-{client,server}@.service \
    -Dm644 $pkgdir/usr/lib/systemd/system/
}
