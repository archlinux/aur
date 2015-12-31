# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=gincamalarm
pkgver=0.0.1
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/Chipsterjulien/gincamalarm"
license=('WTFPL')
makedepends=('go')
options=('!strip')
backup=('etc/gincamalarm/gincamalarm.json')
source=("$pkgname-$pkgver.tar.gz")
install=gincamalarm.install

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
    go get github.com/op/go-logging
    go get github.com/gin-gonic/gin
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

    # gincamalarm.toml
    install -Dm644 cfg/"$pkgname"_sample.toml \
        "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # gincamalarm.service
    install -Dm644 cfg/"$pkgname".service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

    # gincamalarm binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('64fa5289660d1da48f0b1e06590329ce21bb0ca12edbda1ae089b13905e9ee6bf9b6fb1b4b20fcd2634fcb7b55584b80eed5bb7587b0d02e6b2cf44a164f9b85')