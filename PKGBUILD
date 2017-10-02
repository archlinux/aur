# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=multiplehogc
pkgver=0.0.1
pkgrel=3
pkgdesc="Launch many intances of hogc"
arch=('any')
url="https://github.com/Chipsterjulien/multiplehogc"
license=('WTFPL')
makedepends=('go')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz")
install=multiplehogc.install

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
    echo "Install go-logging"
    go get github.com/op/go-logging
    echo "Install viper"
    go get github.com/spf13/viper
    echo "Install email"
    go get github.com/jordan-wright/email

    cd "$_builddir"

    go build || return 1

    if [ $GOPATH_exist == 0 ]; then
        rm -rf ~/.gopath
        export GOPATH=
    fi
}

package() {
    cd "$_builddir"

    # multiplehogc.toml
    install -Dm644 cfg/"$pkgname"_sample.toml \
        "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # multiplehogc.service
    install -Dm644 systemd/"$pkgname".service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

    # multiplehogc binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('f947acc5e4cedb97529295d2c343ebaedc95886ad2fe52e8003ab306de9e4128d3faec11f8a9741871cd7759ab0d765fed710efa61856cd96acf68a2d7a7d872')
