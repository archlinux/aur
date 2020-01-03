# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

_pkg='tempreader'
_gopkg="github.com/jtyr/$_pkg"

pkgname="$_pkg-git"
pkgver=r5.73ebe52
pkgrel=2
pkgdesc='RESTful API to read data from DS18B20 temperature sensors.'
url="https://github.com/jtyr/tempreader"
arch=('any')
license=('MIT')
conflicts=('tempreader')
makedepends=('go')


pkgver() {
    cd "$srcdir/src/$_gopkg"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    msg2 'Fetching Go package'
    GOPATH="$srcdir" go get -u -d "$_gopkg"
}


build() {
    msg2 'Building binary'
    GOPATH="$srcdir" go build -o "bin/$_pkg" -trimpath -ldflags='-s -w' "$_gopkg"
}


package() {
    msg2 'Installing files'
    install -Dm755 "$srcdir/bin/$_pkg" -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/src/$_gopkg/"/{LICENSE,README.md} -t "$pkgdir/usr/share/doc/$_pkg"
    install -Dm644 "$srcdir/src/$_gopkg/contrib/$_pkg.service" "$pkgdir/usr/lib/systemd/system/$_pkg.service"
    install -Dm644 "$srcdir/src/$_gopkg/contrib/$_pkg.default" "$pkgdir/etc/default/$_pkg"
}
