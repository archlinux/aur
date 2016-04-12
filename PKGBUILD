# Maintainer:  somedude
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xkeyboard-config-bone
pkgver=1840.918d5c5
pkgrel=1
pkgdesc="X keyboard configuration files with bone support"
arch=(any)
license=('custom')
url="https://github.com/HenningJW/xkeyboard-config"
makedepends=('intltool' 'xorg-xkbcomp' 'xorg-util-macros')
provides=('xkeyboard-config' 'xkbdata')
replaces=('xkeyboard-config' 'xkbdata')
conflicts=('xkeyboard-config' 'xkbdata')
source=(git+https://github.com/HenningJW/xkeyboard-config.git)
sha256sums=('SKIP')

pkgver() {
	cd xkeyboard-config
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd xkeyboard-config
	./autogen.sh --prefix=/usr \
		--with-xkb-base=/usr/share/X11/xkb \
		--with-xkb-rules-symlink=xorg \
		--enable-compat-rules=yes
	make
}

package() {
	cd xkeyboard-config

	make DESTDIR="${pkgdir}" install
	rm -f "${pkgdir}/usr/share/X11/xkb/compiled"

	install -m755 -d "${pkgdir}/var/lib/xkb"
	install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set noet sts=0 sw=4 ts=4:
