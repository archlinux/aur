# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=filteripdyn
pkgver=0.0.1
pkgrel=3
pkgdesc="Filtering IP dyn with iptables"
arch=('any')
url="https://github.com/Chipsterjulien/filteripdyn"
license=('WTFPL')
makedepends=('go')
options=('!strip')
backup=('etc/gincamalarm/filteripdyn.toml')
source=("$pkgname-$pkgver.tar.gz")
install=filteripdyn.install

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
        echo "Install viper"
        go get github.com/spf13/viper
    else
        # Update some libs
        echo "Update go-logging"
        go get -u github.com/op/go-logging
        echo "Update viper"
        go get -u github.com/spf13/viper
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

    # filteripdyn.toml
    install -Dm644 cfg/"$pkgname"_sample.toml \
        "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # filteripdyn.service
    install -Dm644 systemd/"$pkgname".service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

    # filteripdyn binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('0730072c1a90b39659863e57f2846648193127a2adc38f78bcc2086da2550d126d7939e89ac6de515eb01b85aab1f47611f4a9620d6fff5305bbda2609d322e8')