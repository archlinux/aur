# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=mailmotion
pkgver=0.0.2
pkgrel=1
pkgdesc="Send email when motion create picture"
arch=('any')
url="https://github.com/Chipsterjulien/mailmotion"
license=('WTFPL')
makedepends=('go')
options=('!strip')
#backup=('etc/mailmotion/mailmotion.toml')
source=("$pkgname-$pkgver.tar.gz")
install=mailmotion.install

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
    echo "Install natsort"
    go get bitbucket.org/zombiezen/cardcpx/natsort
    echo "Install email"
    go get github.com/scorredoira/email

    cd "$_builddir"

    go build || return 1

    if [ $GOPATH_exist == 0 ]; then
        rm -rf ~/.gopath
        export GOPATH=
    fi
}

package() {
    cd "$_builddir"

    # mailmotion.toml
    install -Dm644 cfg/"$pkgname"_sample.toml \
        "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # mailmotion binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('cd25be339e91909013e04c4755316c3c210b71e9c0ce598682b7f41510b760075cce7e820eab87ec810314b5ea853a45009a9df246623dd8e03c4f2112be0509')