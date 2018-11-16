# Maintainer: Sherlock Holo <sherlockya@gmail.com>
pkgname=camouflage
_pkgver=0.5.0
pkgver=v${_pkgver}
pkgrel=1
pkgdesc="a mux+websocket+TLS proxy"
arch=('x86_64')
license=('MPL')
depends=()
makedepends=('go' 'git')
url='https://github.com/Sherlock-Holo/camouflage'
source=(
	"https://github.com/Sherlock-Holo/camouflage/archive/$pkgver.tar.gz"
    "camouflage.install"
)

md5sums=('ae6b8e23164260f4d2be39d8205f4c47'
         'd506ec62e984c89ddea0cec157292d42')

backup=(
    'etc/camouflage/example.toml'
)

build() {
	rm -rf "$srcdir/go/src"

	mkdir -p "$srcdir/go/src"

	export GOPATH="$srcdir/go"

    tar -xvf $pkgver.tar.gz
    cd "$srcdir/$pkgname-$_pkgver"

	msg2 "Building binary"
    export GO111MODULE=on
    export CGO_ENABLED=0
	go get -v \
		-gcflags "-trimpath $PWD:$GOPATH/src"
    
    msg2 "Cleaning residual"
    chmod 777 -R $GOPATH/pkg/mod
    rm -rf $GOPATH/pkg/mod
}

package() {
	find "$srcdir/go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done

    mkdir -p $pkgdir/etc/camouflage
    install -Dm644 $srcdir/$pkgname-$_pkgver/config/example.toml $pkgdir/etc/camouflage/

	mkdir -p $pkgdir/usr/lib/systemd/system
    install $srcdir/$pkgname-$_pkgver/systemd/camouflage-{client,server}@.service \
    -Dm644 $pkgdir/usr/lib/systemd/system/
}
