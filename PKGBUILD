# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=searchNewDocOnAidop
pkgver=0.0.1
pkgrel=2
pkgdesc="Program that searches for new files"
arch=('any')
url="https://github.com/Chipsterjulien/searchNewDocOnAidop"
license=('WTFPL')
makedepends=('go')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz")
install=searchnewdoconaidop.install

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

    # searchNewDocOnAidop_sample.toml
    install -Dm644 cfg/"$pkgname"_sample.toml \
        "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # searchNewDocOnAidop binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('18264533ea758104b5daddd13923586255768addbc710b3bc88492d083e69332672dcb1e252ca244c082c1779bad8348e01b9f4d59d95f0cad15be9ac1cda988')
