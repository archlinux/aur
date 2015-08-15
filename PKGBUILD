# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>
pkgname=goweatherclient
url="https://github.com/Chipsterjulien/goweatherclient"
pkgver=0.0.1
pkgrel=1
pkgdesc="A client for goweatherserver who get and send temperature in json via tcp"
arch=('any')
license=('WTFPL')
makedepends=(go)
options=('!strip')
source=($pkgname-$pkgver.tar.gz)
install=goweatherclient.install

_builddir="$pkgname-$pkgver"

build() {
    GOPATH_exist=1
    if [ -z $GOPATH ]; then
        # path don't exit
        GOPATH_exist=0

        # create gopath directory
        mkdir -p .gopath/{bin,src}
        # export var
        export GOPATH=~/.gopath
    fi

    # Getting some libs
    go get github.com/jmcvetta/napping
    go get github.com/op/go-logging
    go get github.com/spf13/viper

    cd "$_builddir"

    go build || return 1

    if [ $GOPATH_exist == 0 ]; then
        rm -rf ~/.gopath
        export GOPATH=
    fi
}

package() {
    cd "$_builddir"

    # goweatherserver.toml
    install -Dm644 cfg/"$pkgname"_sample.toml \
        "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # goweatherclient.[service|timer]
    install -Dm644 cfg/"$pkgname".timer \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".timer || return 1
    install -Dm644 cfg/"$pkgname".service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

    # goweatherclient binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}
sha512sums=('ddd827a22013a1432cf5a27ca48146f4f860e43079d4324612ca05695869f3b66bacf719893e368ea28bb523eeb4f9e5a3cfd47df8d447102e6798d7e2d062c9')
