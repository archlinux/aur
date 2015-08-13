# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>
pkgname=goweatherserver
url="https://github.com/Chipsterjulien/goweatherserver"
pkgver=0.1
pkgrel=1
pkgdesc="A server who take temperature from TCP connection and save into a database"
arch=('any')
license=('WTFPL')
makedepends=(go)
options=('!strip')
source=($pkgname-$pkgver.tar.gz)
install=goweatherserver.install

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
    go get github.com/gin-gonic/gin
    go get github.com/jinzhu/gorm
    go get github.com/mattn/go-sqlite3
    go get github.com/op/go-logging
    go get github.com/spf13/viper

    cd "$_builddir"

    go build || return 1
}

package() {
    cd "$_builddir"

    # gonsupdate.toml
    install -Dm644 cfg/"$pkgname".toml \
        "$pkgdir"/etc/$pkgname/"$pkgname".toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # Create db directory
    install -dm755 "$pkgdir"/var/lib/$pkgname || return 1

    # goweatherserver.service
    install -Dm644 cfg/"$pkgname".service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

    # goweatherserver binary
    install -m750 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}
sha512sums=('dbc6588828d76a951bf63350624565bd1acf8b40cc347df131a900897b86fe8d8195b1099c6b0994de1999de4b78679ca60c29dd0c6b119e2ab71423321aff3a')
