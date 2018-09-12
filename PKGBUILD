# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Fraser P. Newton <fpnewton90 [at] gmail [dot] com>

pkgname=cloud-print-connector-git
pkgver=v1.16.r2.g9386e53
pkgrel=1
pkgdesc="Share printers from your Windows, Linux, FreeBSD or OS X computer with ChromeOS and Android devices, using the Cloud Print Connector"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/google/cloud-print-connector"
license=('BSD')
depends=('cups' 'net-snmp')
makedepends=('go' 'net-snmp' 'avahi' 'git' 'bzr')
optdepends=('gcp-cups-connector-systemd')
provides=("${pkgname%-git}")
conflicts=('gcp-cups-connector')
replaces=('gcp-cups-connector')
source=('git+https://github.com/google/cloud-print-connector.git')
md5sums=('SKIP')
_gourl=github.com/google/cloud-print-connector

pkgver() {
	cd "$srcdir/${pkgname%-git}"
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
			install -Dm644 "$srcdir/src/$_gourl/$f" "$pkgdir/usr/share/licenses/${pkgname%-git}/$f"
		fi
	done

	echo ""
	echo "Please use gcp-connector-util init to generate a config json file in /etc/gcp-cups-connector"
        echo "or don't forget to update config file using gcp-connector-util update-config file"
}
