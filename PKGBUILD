# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=gingarage
pkgver=0.0.1
pkgrel=4
pkgdesc="Gin server to manage garage door"
arch=('any')
url="https://github.com/Chipsterjulien/gingarage"
license=('WTFPL')
makedepends=('go')
options=('!strip')
backup=('etc/gincamalarm/gingarage.toml')
source=("$pkgname-$pkgver.tar.gz")
install=gingarage.install

_builddir="$pkgname-$pkgver"

build() {
    echo "Build dependencies"
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
        echo "Install gin"
        go get github.com/gin-gonic/gin
        echo "Install viper"
        go get github.com/spf13/viper
        echo "Install gin-cors"
        go get github.com/itsjamie/gin-cors

    else

        # Getting some libs
        echo "Update go-logging"
        go get github.com/op/go-logging
        echo "Update gin"
        go get github.com/gin-gonic/gin
        echo "Update viper"
        go get github.com/spf13/viper
        echo "Update gin-cors"
        go get github.com/itsjamie/gin-cors

    fi
    echo "End of dependencies"

    cd "$_builddir"

    go build || return 1

    if [ $GOPATH_exist == 0 ]; then
        rm -rf ~/.gopath
        export GOPATH=
    fi
}

package() {
    cd "$_builddir"

    # gingarage.toml
    install -Dm644 cfg/"$pkgname"_sample.toml \
        "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # gingarage.service
    install -Dm644 systemd/"$pkgname".service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

    # gingarage binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('4e219b7094d436ae63499f401a666205b73719f1c8504c10eacbe4cc487a43cbf4c49dbafda8274a5265b2f7d74a4cf5241ea83d1804b23f64cf2b89c92c5256')
