# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=multiplehogc
pkgver=0.0.1
pkgrel=4
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

sha512sums=('b116fc7780c6334adfe1bd4a4c2fb48b5bfa3de46a79bc851c35aced1d8488942ab9cbd7021b75507490b0846108b948cddb0042b1cacbf194be8b4de8c43fba')
