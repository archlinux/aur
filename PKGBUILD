# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=sshd_autoban
pkgver=0.0.4
pkgrel=1
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


sha512sums=('94a24f3eda8f0850122b8b8489b4b7dbe84ae7247ec25d70e08774e1c7bbb2036c64b0e2b618f915b3f9f2cb853cadfcce1b2ffb53d17ac7fcd99cac1b03be1b')
