# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=pingormail
pkgver=0.0.1
pkgrel=7
pkgdesc="Ping or connect to address. If no result, it send an email"
arch=('any')
url="https://github.com/Chipsterjulien/pingormail"
license=('WTFPL')
makedepends=('go')
options=('!strip')
backup=('etc/pingormail/pingormail.toml')
source=("$pkgname-$pkgver.tar.gz")
install=pingormail.install

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
        echo "Install viper"
        go get github.com/spf13/viper
        echo "Install email"
        go get github.com/jordan-wright/email
    
    else
    	# Getting some libs
        echo "Update go-logging"
        go get github.com/op/go-logging
        echo "Update viper"
        go get github.com/spf13/viper
        echo "Update email"
        go get github.com/jordan-wright/email
        

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

    # pingormail.toml
    install -Dm644 cfg/"$pkgname"_sample.toml \
        "$pkgdir"/etc/$pkgname/"$pkgname"_sample.toml || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # pingormail.service
    install -Dm644 systemd/"$pkgname".service \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".service || return 1

    # pingormail.timer
    install -Dm644 systemd/"$pkgname".timer \
        "$pkgdir"/usr/lib/systemd/system/"$pkgname".timer || return 1

    # pingormail binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('08aa5c7bad8b1cd75f37611d3d612d96aae4122e289479f23c5dac569b875df9df8bfa4e5e03dc8407b40f6d9eadeba60d978641763dd7301d0229e75fadfdf7')
