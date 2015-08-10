# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>
pkgname=gonsupdate
url="https://github.com/Chipsterjulien/gonsupdate"
pkgver=0.1
pkgrel=1
pkgdesc="If necessary, update your ip for nsupdate"
arch=('any')
license=('WTFPL')
makedepends=(go)
options=('!strip')
source=($pkgname-$pkgver.tar.gz)
install=gonsupdate.install

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

    # Getting some lib
    go get github.com/op/go-logging
    go get github.com/spf13/viper

    cd "$_builddir"

    go build || return 1
}

package() {
    cd "$_builddir"

    # gonsupdate.toml
    install -Dm644 cfg/"$pkgname".toml \
        "$pkgdir"/etc/$pkgname/gonsupdate_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # Create ip directory
    install -dm755 "$pkgdir"/var/lib/$pkgname || return 1

    # gonsupdate.[timer|service]
    install -Dm644 cfg/"$pkgname".timer \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".timer || return 1
    install -Dm644 cfg/"$pkgname".service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

    # gonsupdate binary
    install -m750 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('1ed468fbcc41adb6510cb8f52b22104e3ea31139fb2c49d7e0b05456cc07b045de028e068193b44e254d6ad199102db1689e26cc9f757cf5ba0899b091dccccc')
