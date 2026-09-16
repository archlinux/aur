#!/hint/bash
# Maintainer : SFN

pkgname=rhine
pkgver=0.4.0
pkgrel=1
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
sha256sums=('8325a5df981ebd6bed9847b185cb8139542624e3821f67867c5592e9fdb99e17')

build() {
	cd $pkgname
	# add target and -Dcpu=baseline if building for others
	DESTDIR="build" zig build \
	--summary all \
	--prefix /usr \
	--search-prefix /usr \
	-Dpie=true \
	-Dnotify=true \
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
