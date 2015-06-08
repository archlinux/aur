# Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=lua-ldbus
pkgver=r110.9f6db62
pkgrel=2
pkgdesc="Lua Bindings to dbus."
arch=('x86_64' 'i686')
url="https://github.com/daurnimator/ldbus"
license=('MIT')
groups=()
provides=()
depends=('lua' 'libdbus')
makedepends=('luarocks' 'git')

_commit="9f6db626600eb7e04000368da947e0c5cd175fb5"

source=("git://github.com/daurnimator/ldbus.git#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/ldbus"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/ldbus"
	luarocks make --pack-binary-rock ldbus-scm-0.rockspec \
		DBUS_INCDIR=/usr/include/dbus-1.0/ \
		DBUS_ARCH_INCDIR=/usr/lib/dbus-1.0/include
}

package() {
	cd "$srcdir/ldbus"
	install -Dvsm755 ldbus.so ${pkgdir}/usr/lib/lua/5.3/ldbus.so
}
