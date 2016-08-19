# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=pingormail
pkgver=0.0.1
pkgrel=5
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

sha512sums=('e8def5d1b14f1c2b597975c8bc3e99e5723bb64531fd0c4cefb5a048072e1225a9a725f8e6ae6c6740bc67ea2ef5f61bb9ba5b934c5fbc30199e789f84959fe6')
