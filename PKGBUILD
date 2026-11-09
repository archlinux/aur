#!/hint/bash
# Maintainer : SFN

pkgname=rhine
pkgver=0.5.0
pkgrel=2
pkgdesc="A modular window manager for river"
arch=('x86_64')
url="https://codeberg.org/sivecano/rhine"
license=('GPL3')
depends=('libwayland-client.so' 'libdbus-1.so' 'river' 'glibc')
makedepends=('zig' 'libxkbcommon' 'git')
provides=('wayland-compositor')
source=(
"$pkgname::git+${url}.git#tag=${pkgver}"
)
sha256sums=('7a00a8038de7a72435da0da4480f787ca85d22f1d94c1dbb6ddb937b1dfc9fbb')

prepare() {
    cd $srcdir/$pkgname
    # patch libtributary hash
    sed -i 's|tributary-0.4.1-tqCfW4bDAACwvVYmVPiWYHhXCxpen4c1Noi89uaO0yit|tributary-0.5.1-tqCfW27DAAAHoFA0ZWGt3ItwHqlSzZ5bXXhvz4p76LKe|' build.zig.zon
}

build() {
	cd $pkgname
	# add target and -Dcpu=baseline if building for others
	DESTDIR="build" zig build \
	--summary all \
	--prefix /usr \
	--search-prefix /usr \
	-Dpie=true \
	-Dstrip=true \
	-Ddbus=true \
	-Doptimize=ReleaseSafe
}

package() {
	cd $pkgname

	cp -a build/* "$pkgdir"

	install -Dm644 README.asciidoc -t "$pkgdir/usr/share/$pkgname"
	install -Dm644 config.rh -t "$pkgdir/usr/share/$pkgname"
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
# vim:set ts=8:
