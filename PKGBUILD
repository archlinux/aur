# Maintainer: Justin Dray <justin@dray.be>

_gitname=influx-cli
pkgname=${_gitname}-git
pkgver=r48.c79592e
pkgrel=1
pkgdesc="Graphite-web, without the interface. Just the rendering HTTP API."
url="https://github.com/Dieterbe/influx-cli"
license=('Apache')
depends=('go')
arch=('i686' 'x86_64')
source=("$_gitname::git+https://github.com/Dieterbe/influx-cli")
options=(!strip)
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	export GOPATH=$(pwd)
	go get github.com/Dieterbe/influx-cli &> /dev/null|| true
	git -C src/github.com/influxdb/influxdb checkout v0.8.8 &>/dev/null
	go get github.com/Dieterbe/influx-cli
}

check() {
	cd "$srcdir/$_gitname"
	export GOPATH=$(pwd)
	go test
}

package() {
	cd "$srcdir/$_gitname"
	install -Dm0755 "$srcdir/$_gitname/bin/influx-cli" "$pkgdir/usr/bin/influx-cli"
}
