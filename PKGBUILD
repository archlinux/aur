# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=timesyncrpi
pkgver=0.0.1
pkgrel=1
pkgdesc="Sync date at boot for raspberry pi which don't have clock"
arch=('any')
url="https://github.com/Chipsterjulien/timesyncrpi"
license=('WTFPL')
makedepends=('go')
options=('!strip')
backup=('etc/timesyncrpi/timesyncrpi.toml')
source=("$pkgname-$pkgver.tar.gz")
install=timesyncrpi.install

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
    echo "End of install dependencies"

    cd "$_builddir"

    go build || return 1

    if [ $GOPATH_exist == 0 ]; then
        rm -rf ~/.gopath
        export GOPATH=
    fi
}

package() {
    cd "$_builddir"

    # timesyncrpi.toml
    install -Dm644 cfg/"$pkgname"_sample.toml \
        "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # timesyncrpi.[timer|service]
    install -Dm644 systemd/"$pkgname".timer \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".timer || return 1
    install -Dm644 systemd/"$pkgname".service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1
    install -Dm644 systemd/"$pkgname"_boot.service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname"_boot.service || return 1

    # timesyncrpi binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('b461d2ede28c0f9c746c76b3a4e5c5413742c4c9f055f973b7619ccd2dde3ced6a7f24b3321d772a410c36d9d3ac1347210d9ebf6615ca69a467315fea3a89b0')
