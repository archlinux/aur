# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=reducemp4video
pkgver=0.0.1
pkgrel=6
pkgdesc="Program that reduce size of mp4 video"
arch=('any')
url="https://github.com/Chipsterjulien/reduceMP4Video"
license=('WTFPL')
makedepends=('go')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz")
install=reducemp4video.install

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
    echo "Install natsort"
    go get bitbucket.org/zombiezen/cardcpx/natsort

    cd "$_builddir"

    go build || return 1

    if [ $GOPATH_exist == 0 ]; then
        rm -rf ~/.gopath
        export GOPATH=
    fi
}

package() {
    cd "$_builddir"

    # reducemp4video_sample.toml
    install -Dm644 cfg/"$pkgname"_sample.toml \
        "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # reducemp4video.service
    install -Dm644 systemd/"$pkgname".service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

    # reducemp4video binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('9b8064ed5fd81c02080ae175caba93d08b5b14ec18879afe93d68c98708d732e6e252afce96381dd83cec36fd7d3aa176e1984d1de43de88b44c6a1ab47bd4e2')
