# Maintainer: Sherlock Holo <sherlockya@gmail.com>
pkgname=camouflage
epoch=1
pkgver=0.11.1
_pkgver=v${pkgver}
pkgrel=1
pkgdesc="a mux websocket over TLS proxy"
arch=('x86_64')
license=('MPL')
depends=()
makedepends=('go>=2:1.12' 'git')
url='https://github.com/Sherlock-Holo/camouflage'
source=(
	"https://github.com/Sherlock-Holo/camouflage/archive/$_pkgver.tar.gz"
    "camouflage.install"
)

md5sums=('91adde40f55ef3427ef1df707a70f11f'
         'd506ec62e984c89ddea0cec157292d42')

backup=(
    'etc/camouflage/example.toml'
)

build() {
	rm -rf "$srcdir/go/src"

	mkdir -p "$srcdir/go/src"

	export GOPATH="$srcdir/go"

    cd "$srcdir/$pkgname-$pkgver"

	msg2 "Downloading dependencies"
    export GO111MODULE=on
    export CGO_ENABLED=0
	go mod download

    msg2 "Building binary"

    go build -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-w -s -extldflags ${LDFLAGS}" -v
    
    msg2 "Cleaning residual"
    chmod 777 -R $GOPATH/pkg/mod
    rm -rf $GOPATH/pkg/mod
}

package() {
    mkdir -p $pkgdir/usr/bin
	install -D $srcdir/$pkgname-$pkgver/camouflage $pkgdir/usr/bin/camouflage

    mkdir -p $pkgdir/etc/camouflage
    install -Dm644 $srcdir/$pkgname-$pkgver/config/example.toml $pkgdir/etc/camouflage/

	mkdir -p $pkgdir/usr/lib/systemd/system
    install $srcdir/$pkgname-$pkgver/systemd/camouflage-{client,server}@.service \
    -Dm644 $pkgdir/usr/lib/systemd/system/
}
