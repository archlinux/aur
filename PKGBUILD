# Maintainer: SelfRef <arch@selfref.dev>

_basename=chicago95
pkgname="${_basename}-plus-git"
pkgver=r598.bdf5cf3
pkgrel=3
pkgdesc="Windows Plus! Theme Conversion for XFCE/Chicago95 (git version)"
arch=('any')
url="https://github.com/grassmunk/Chicago95"
license=('GPL')
depends=('python' 'python-svgwrite' 'python-fonttools' 'python-numpy' 'imagemagick' 'inkscape' 'noto-fonts' 'alsa-utils')
optdepends=('chicago95-theme: Base theme')
makedepends=('git')
provides=('chicago95-plus')
conflicts=('chicago95-plus')
source=("chicago95::git+https://github.com/grassmunk/Chicago95.git")
md5sums=('SKIP')

pkgver() {
	cd "$_basename"
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

package() {
	cd "$_basename/Plus"

	install -dm755 "$pkgdir/usr/lib/chicago95-plus"
	cp -r * "$pkgdir/usr/lib/chicago95-plus"
	install -Dm755 PlusGUI.desktop "$pkgdir/usr/share/applications/PlusGUI.desktop"

	install -dm755 "$pkgdir/usr/bin"
	printf '#!/bin/sh\n/usr/lib/chicago95-plus/ChicagoPlus.py' > "$pkgdir/usr/bin/ChicagoPlus"
	printf '#!/bin/sh\n/usr/lib/chicago95-plus/PlusGUI.py' > "$pkgdir/usr/bin/PlusGUI"
	chmod 755 "$pkgdir"/usr/bin/{ChicagoPlus,PlusGUI}
}
