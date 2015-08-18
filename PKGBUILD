# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=sshd_autoban
pkgver=0.0.4
pkgrel=2
pkgdesc="A ssh autoban for fast and slow brute force attack"
arch=('any')
url="https://github.com/Chipsterjulien/go-sshd_autoban"
license=('WTFPL')
makedepends=('go')
options=('!strip')
backup=('etc/sshd_autoban/sshd_autoban.json')
source=("$pkgname-$pkgver.tar.gz")
install=sshd_autoban.install

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

    # sshd_autoban.toml
    install -Dm644 cfg/"$pkgname"_sample.toml \
        "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # sshd_autoban.service
    install -Dm644 cfg/"$pkgname".service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

    # sshd_autoban binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}


sha512sums=('1e1e6d6948dd1642e627cb8157e8f37b2e2f33d5ef7624d345ce27a54206c77c6f0a31df9e659e2c8235d03217615cc7c99cc2c450fb23d20f2ed1bdfce8eeb6')
