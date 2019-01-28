# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=ginsearchmotion
pkgver=0.0.1
pkgrel=1
pkgdesc="Gin server to manage search motions"
arch=('any')
url="https://github.com/Chipsterjulien/ginsearchmotion"
license=('WTFPL')
makedepends=('go')
optdepends=('wiringpi: GPIO support')
options=('!strip')
backup=('etc/ginsearchmotion/ginsearchmotion.toml')
source=("$pkgname-$pkgver.tar.gz")
install=ginsearchmotion.install

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

    # ginsearchmotion.toml
    install -Dm644 cfg/"$pkgname"_sample.toml \
        "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # ginsearchmotion.service
    install -Dm644 systemd/"$pkgname".service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

    # ginsearchmotion binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('fb47cbe792533920a962e48e9a82a72539d3f9d8722c1ef65e81390ddc7407948c3c53721322e2b917ad04dfa3c8c4d7b163a15ded3867b6afeb1ab617b06c00')
