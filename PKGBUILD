# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=gincamalarm
pkgver=0.0.4
pkgrel=10
pkgdesc="Gin server to manage camera with motion"
arch=('any')
url="https://github.com/Chipsterjulien/gincamalarm"
license=('WTFPL')
makedepends=('go')
options=('!strip')
backup=('etc/gincamalarm/gincamalarm.toml')
source=("$pkgname-$pkgver.tar.gz")
install=gincamalarm.install

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
        echo "Install gin"
        go get github.com/gin-gonic/gin
        echo "Install viper"
        go get github.com/spf13/viper
        echo "Install gin-cors"
        go get github.com/itsjamie/gin-cors
    
    else

        # Getting some libs
        echo "Update go-logging"
        #go get github.com/op/go-logging
        echo "Update gin"
        #go get github.com/gin-gonic/gin
        echo "Update viper"
        #go get github.com/spf13/viper
        echo "Update gin-cors"
        #go get github.com/itsjamie/gin-cors

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

    # gincamalarm.toml
    install -Dm644 cfg/"$pkgname"_sample.toml \
        "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # gincamalarm.service
    install -Dm644 systemd/"$pkgname".service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

    # gincamalarm binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('d6a4a9b19ab5bc81d0e501f629581dd6f6db87f56f1f118478da7d1167884143c434b685b4078685b0b97c540055b9a1ea00c0bf97034a36b9561d9fa5695d78')