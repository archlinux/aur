# Maintainer: Sherlock Holo <sherlockya@gmail.com>
_pkgname=camouflage
pkgname=$_pkgname-git
pkgver=1.0.2.r1.g47784fa
pkgrel=1
pkgdesc="a mux websocket over TLS proxy, experimental version"
arch=('x86_64')
license=('MPL')
depends=()
makedepends=('go>=2:1.14' 'git')
url='https://github.com/Sherlock-Holo/camouflage'
source=(
	"git+https://github.com/Sherlock-Holo/camouflage"
    "camouflage.install"
)

provides=(camouflage)
conflicts=(camouflage)

md5sums=('SKIP'
         'd506ec62e984c89ddea0cec157292d42')

backup=(
    'etc/camouflage/example.toml'
)

pkgver() {
    cd $srcdir/$_pkgname
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

build() {
	rm -rf "$srcdir/go/src"

	mkdir -p "$srcdir/go/src"

	export GOPATH="$srcdir/go"

    cd "$srcdir/$_pkgname"

    msg2 "Downloading dependencies"
    export GO111MODULE=on
    export CGO_ENABLED=0
    export GOPROXY=https://goproxy.cn,direct
    go mod download

    msg2 "Building binary"

    go build -trimpath -v
    
    msg2 "Cleaning residual"
    chmod 777 -R $GOPATH/pkg/mod
    rm -rf $GOPATH/pkg/mod
}

package() {
    mkdir -p $pkgdir/usr/bin
	install -D $srcdir/$_pkgname/camouflage $pkgdir/usr/bin/camouflage

    mkdir -p $pkgdir/etc/camouflage
    install -Dm644 $srcdir/$_pkgname/config/example.toml $pkgdir/etc/camouflage/

	mkdir -p $pkgdir/usr/lib/systemd/system
    install $srcdir/$_pkgname/systemd/camouflage-{client,server}@.service \
    -Dm644 $pkgdir/usr/lib/systemd/system/
}
