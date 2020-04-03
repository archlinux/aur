# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=pacman-offline-git
pkgver=0.1.0.r2.g2b908f4
pkgrel=1
pkgdesc='offline system update with pacman - git checkout'
arch=('any')
url='https://github.com/eworm-de/pacman-offline'
license=('GPL')
depends=('systemd' 'pacman')
makedepends=('git' 'markdown')
conflicts=('pacman-offline')
provides=('pacman-offline')
backup=('etc/pacman.d/offline.conf')
source=('git://github.com/eworm-de/pacman-offline.git')
sha256sums=('SKIP')

pkgver() {
	cd pacman-offline/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

package() {
	cd pacman-offline/

	make DESTDIR=${pkgdir} install
}

