# Maintainer: Petrkr <petrkr <<at>> petrkr <<dot>> net>

pkgname=trezorencrypt
pkgver=0.1
pkgrel=1
pkgdesc="TREZOR encrypt and decrypt value"
arch=('x86_64' 'i686')
url="https://github.com/petrkr/trezorencrypt"
license=('LGPL3')
makedepends=('go')
_gourl=github.com/petrkr/trezorencrypt

build() {
    export GOPATH="$srcdir"
    go get -d -fix -v -x ${_gourl}
    cd $srcdir/src/github.com/petrkr/trezorencrypt
    git checkout v$pkgver
    go build

    cd tools
    gcc -pedantic -std=c99 askpass.c -o trezor-askpass
}

check() {
    GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -p -m755 "$srcdir/src/github.com/petrkr/trezorencrypt/trezorencrypt" "$pkgdir/usr/bin/trezorencrypt"
    install -p -m755 "$srcdir/src/github.com/petrkr/trezorencrypt/tools/trezor-askpass" "$pkgdir/usr/bin/trezor-askpass"
}
