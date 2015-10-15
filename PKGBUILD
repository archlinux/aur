# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Fraser P. Newton <fpnewton90 [at] gmail [dot] com>

pkgname=gcp-cups-connector
pkgver=2015.08.24.r53.g6cfa7e0
pkgrel=2
pkgdesc="The Google Cloud Print (aka GCP) CUPS Connector shares CUPS printers with users of Google Cloud Print."
arch=('i686' 'x86_64')
url="https://github.com/google/cups-connector"
license=('BSD')
depends=('cups')
makedepends=('go' 'net-snmp' 'avahi' 'git' 'bzr')
source=('gcp-cups-connector::git+https://github.com/google/cups-connector.git'
        'gcp-cc-service::git+https://github.com/fpnewton/gcp-cups-connector-systemd.git')
md5sums=('SKIP'
         'SKIP')
_gourl=github.com/google/cups-connector

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}/gcp-cups-connector
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}/gcp-cups-connector-util
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -p -m644 "$srcdir/gcp-cc-service/gcp-cups-connector.service" "$pkgdir/usr/lib/systemd/system"

	mkdir -p "$pkgdir/etc/gcp-cups-connector"
	install -p -m600 "$srcdir/gcp-cc-service/cups-connector.config.json.example" "$pkgdir/etc/gcp-cups-connector"

	for f in LICENSE COPYING LICENSE.* COPYING.*; do
		if [ -e "$srcdir/src/$_gourl/$f" ]; then
			install -Dm644 "$srcdir/src/$_gourl/$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
		fi
	done

	echo ""
	echo "Please use connector-init to generate a config json file in /etc/gcp-cups-connector"
}
