# Maintainer: Moritz Luedecke <ritze@skweez.net>

pkgname=prometheus-git
_pkgname=prometheus
pkgver=r2764.322ad49
pkgrel=1
pkgdesc="An open-source service monitoring system and time series database."
arch=('i686' 'x86_64')
url="http://prometheus.io"
license=('APACHE')
install="$_pkgname.install"
makedepends=('go' 'git')
backup=('etc/prometheus.yml')
source=('git://github.com/prometheus/prometheus.git'
        'prometheus.service')
sha256sums=('SKIP'
            'f73d892a4a151c196d46d51ec1dc2b1e6ef18d9e6f018fe4aa5065d589cf938d')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$srcdir/$_pkgname"
	export GOPATH=`pwd`/go
	mkdir -p "$GOPATH/src/github.com/prometheus"
	rm -f "$GOPATH/src/github.com/prometheus/prometheus"
	ln -sr "$srcdir/$_pkgname" "$GOPATH/src/github.com/prometheus/prometheus"
}

build() {
	cd "$srcdir/$_pkgname"
	export GOPATH=`pwd`/go
	export GOBIN=`pwd`/go/bin
	cd "$GOPATH/src/github.com/prometheus/prometheus"
	make build
}

check() {
	export GOPATH=`pwd`/go
	cd "$GOPATH/src/github.com/prometheus/prometheus"
	make test
}

package() {
	install -dm755 "$pkgdir/usr/bin/$pkgsrc"
	install -m755 "$srcdir/$_pkgname/prometheus" "$pkgdir/usr/bin/$pkgsrc"

	install -dm755 "$pkgdir/etc"
	install -m644 "$srcdir/$_pkgname/documentation/examples/prometheus.yml" "$pkgdir/etc"
	
	install -dm755 "$pkgdir/usr/lib/systemd/system"
	install -m644 "${srcdir}/prometheus.service" "$pkgdir/usr/lib/systemd/system/prometheus.service"
}
