# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

_pkg='tempreader'
_gopkg="github.com/jtyr/$_pkg"

pkgname="$_pkg-git"
pkgver=r4.ce5459d
pkgrel=1
pkgdesc='RESTful API to read data from DS18B20 temperature sensors.'
url="https://github.com/jtyr/tempreader"
arch=('any')
license=('MIT')
makedepends=('go')


pkgver() {
    msg2 'Getting version'
    cd "$srcdir/src/$_gopkg"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    msg2 'Fetching Go package'
    GOPATH="$srcdir" go get -u "$_gopkg"
}


build() {
    msg2 'Building binary'
    rm -f "$srcdir/bin/$_pkg"
    GOPATH="$srcdir" go install "$_gopkg"
}


package() {
    msg2 'Installing files'
    install -Dm755 "$srcdir/bin/$_pkg" -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/src/$_gopkg/"/{LICENSE,README.md} -t "$pkgdir/usr/doc/$_pkg"
    install -Dm644 "$srcdir/src/$_gopkg/contrib/$_pkg.service" "$pkgdir/usr/lib/systemd/system/$_pkg.service"
    install -Dm644 "$srcdir/src/$_gopkg/contrib/$_pkg.default" "$pkgdir/etc/default/$_pkg"
}
