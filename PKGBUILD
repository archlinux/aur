# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Fraser P. Newton <fpnewton90 [at] gmail [dot] com>

pkgname=gcp-cups-connector
pkgver=v1.1.r0.g481ad13
pkgrel=2
pkgdesc="The Google Cloud Print (aka GCP) CUPS Connector shares CUPS printers with users of Google Cloud Print."
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/google/cups-connector"
license=('BSD')
depends=('cups' 'net-snmp')
makedepends=('go' 'net-snmp' 'avahi' 'git' 'bzr')
optdepends=('gcp-cups-connector-systemd')
source=('gcp-cups-connector::git+https://github.com/google/cups-connector.git')
md5sums=('SKIP')
_gourl=github.com/google/cups-connector

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}/gcp-cups-connector
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}/gcp-connector-util
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

	for f in LICENSE COPYING LICENSE.* COPYING.*; do
		if [ -e "$srcdir/src/$_gourl/$f" ]; then
			install -Dm644 "$srcdir/src/$_gourl/$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
		fi
	done

	echo ""
	echo "Please use gcp-connector-util init to generate a config json file in /etc/gcp-cups-connector"
        echo "or don't forget to update config file using gcp-connector-util update-config file"
}
