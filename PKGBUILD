# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=filteripdyn
pkgver=0.0.2
pkgrel=2
pkgdesc="Filtering IP dyn with iptables"
arch=('any')
url="https://github.com/Chipsterjulien/filteripdyn"
license=('WTFPL')
makedepends=('go')
options=('!strip')
backup=('etc/gincamalarm/filteripdyn.toml')
source=("$pkgname-$pkgver.tar.gz")
install=filteripdyn.install

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

        # Getting some libs
        echo "Install go-logging"
        go get github.com/op/go-logging
        echo "Install viper"
        go get github.com/spf13/viper
    else
        # Update some libs
        echo "Update go-logging"
        go get github.com/op/go-logging
        echo "Update viper"
        go get github.com/spf13/viper
    fi

    cd "$_builddir"

    go build || return 1

    if [ $GOPATH_exist == 0 ]; then
        rm -rf ~/.gopath
        export GOPATH=
    fi
}

package() {
    cd "$_builddir"

    # filteripdyn.toml
    install -Dm644 cfg/"$pkgname"_sample.toml \
        "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # filteripdyn.service
    install -Dm644 systemd/"$pkgname".service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

    # filteripdyn binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('37163f18ff7dc2768296997dedff4a33e685a7672d07d8c5f325e331110ff0460d83b90bdf7a937498f428efe8535428f58f692be05eb59fc0b7f31d7d17b604')