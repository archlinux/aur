# Maintainer: Plague-doctor <plague <at>> privacyrequired <<dot>> com >

pkgname=trezord-go
pkgver=2.0.24
pkgrel=1
pkgdesc="TREZOR Communication Daemon aka TREZOR Bridge (written in Go)"
arch=('x86_64' 'i686')
url="https://github.com/trezor/trezord-go"
license=('MIT')
makedepends=('go')
conflicts=('trezord-git' 'trezor-bridge-bin' 'trezord')
options=('!strip' '!emptydirs')
_gourl=github.com/trezor/trezord-go

install="${pkgname}.install"

build() {
    export GOPATH="$srcdir"
    go get -d -fix -v -x ${_gourl}
    cd $srcdir/src/github.com/trezor/trezord-go
    git checkout v$pkgver
    go build ./trezord.go
}

check() {
    GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -p -m755 "$srcdir/src/github.com/trezor/trezord-go/trezord" "$pkgdir/usr/bin/trezord"

    mkdir -p "$pkgdir/usr/lib/systemd/system"
    install -p -m644 "$srcdir/src/github.com/trezor/trezord-go/release/linux/trezord.service" \
        "$pkgdir/usr/lib/systemd/system/trezord.service"

    mkdir -p "$pkgdir/etc/udev/rules.d"
    install -p -m644 "$srcdir/src/github.com/trezor/trezord-go/release/linux/trezor.rules" \
        "$pkgdir/etc/udev/rules.d"
}


