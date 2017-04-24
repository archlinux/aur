# Maintainer: Jonathan Lestrelin <jonathan.lestrelin@gmail.com>
pkgname=openlara-git
_pkgname=openlara
pkgver=r200.e14e661
pkgrel=1
pkgdesc="Classic Tomb Raider open-source engine"
arch=('any')
url="https://github.com/XProger/OpenLara"
license=('unknown')
makedepends=('git' 'clang')
depends=('libx11' 'libgl' 'libpulse')
provides=($_pkgname)
conflicts=($_pkgname)
source=('openlara::git://github.com/XProger/OpenLara.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname/src/platform/nix"
	./build.sh
}

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir"/usr/{share,lib}/openlara
	install -m 755 "$srcdir/$_pkgname/bin/OpenLara" "$pkgdir/usr/lib/openlara/OpenLara"
	install -m 644 "$srcdir/$_pkgname/bin/LEVEL2.PSX" "$pkgdir/usr/share/openlara/LEVEL2.PSX"
	install -m 644 "$srcdir/$_pkgname/bin/05.ogg" "$pkgdir/usr/share/openlara/05.ogg"
	install -m 644 "$srcdir/$_pkgname/bin/008.ogg" "$pkgdir/usr/share/openlara/008.ogg"
	# use a wrapper as the program needs its CWD to be the directory containing the data files
	echo -e '#!/bin/sh\nset -eu\ncd /usr/share/openlara\n/usr/lib/openlara/OpenLara $@' > "$pkgdir/usr/bin/openlara"
	chmod 0755 "$pkgdir/usr/bin/openlara"
}
