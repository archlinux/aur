# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=journal-notify-git
pkgver=0.1.2.r1.g9d2b0d8
pkgrel=1
pkgdesc='Notify about journal log entries - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/journal-notify'
depends=('libnotify' 'systemd')
optdepends=('gnome-icon-theme: icons in notifications')
makedepends=('git' 'discount')
provides=('journal-notify')
conflicts=('journal-notify')
license=('GPL')
source=('git+https://github.com/eworm-de/journal-notify.git')
sha256sums=('SKIP')

pkgver() {
	cd journal-notify/

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

build() {
	cd journal-notify/

	make
}

package() {
	cd journal-notify/

	make DESTDIR="${pkgdir}" install
}

