# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=labwc-menu-gnome3-git
pkgdesc='OpenBox/labwc menu generator for GNOME 3 menus'
pkgver=r9.1d138c1
pkgrel=1
url=https://github.com/labwc/labwc-menu-gnome3
arch=(x86_64)
makedepends=(git)
depends=(gnome-menus)
license=(GPL2)
source=("$pkgname::git+$url")
b2sums=(SKIP)

pkgver () {
	cd "$pkgname"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build () {
	cd "$pkgname"
	local -a cmd=("${CC:-cc}" $CFLAGS $LDFLAGS
		-DGMENU_I_KNOW_THIS_IS_UNSTABLE
		-o labwc-menu-gnome3 labwc-menu.c
		$(pkg-config --cflags --libs libgnome-menu-3.0)
	)
	echo "${cmd[*]}"
	"${cmd[@]}"
}

package () {
	cd "$pkgname"
	install -Dm755 labwc-menu-gnome3 "$pkgdir/usr/bin/labwc-menu-gnome3"
}	
