# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='galaxy-desktop-git'
pkgdesc='Hacked DE which mixes components from other desktop environments'
pkgver=r3.40eea43
pkgrel=1
arch=('any')
url='https://github.com/aperezdc/galaxy-desktop'
license=('custom:MIT')
makedepends=('meson' 'ninja')
provides=('galaxy-desktop')
conflicts=('galaxy-desktop')
depends=('mate-screensaver>=1.20' 'gnome-settings-daemon>=3.28' 'gala'
         'plank>=0.11' 'pantheon-polkit-agent' 'pantheon-screenshot')
optdepends=('gnome-control-center:: Allows modifying system settings'
            'synapse:: Keyboard-driver launcher'
			'termite:: Recommended terminal application'
			'arc-gtk-theme:: Recommended GTK+ theme'
			'la-capitaine-icon-theme:: Recommended icon theme'
			'xcursor-hackneyed:: Recommended cursor theme')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	arch-meson "${pkgname}" build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 "${pkgname}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
