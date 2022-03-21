# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=pacredir-git
pkgver=0.4.4.r1.ga4617f1
pkgrel=1
pkgdesc='redirect pacman requests, assisted by avahi service discovery - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/pacredir'
depends=('libsystemd' 'avahi' 'curl' 'iniparser' 'darkhttpd' 'libmicrohttpd')
makedepends=('git' 'systemd' 'discount')
license=('GPL')
provides=('pacredir')
conflicts=('paccache' 'pacredir')
replaces=('paccache-git')
install=pacredir.install
backup=('etc/pacredir.conf' 'etc/pacman.d/pacredir')
source=('git+https://github.com/eworm-de/pacredir.git')
sha256sums=('SKIP')

pkgver() {
	cd pacredir/

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
	cd pacredir/

	make
}

package() {
	cd pacredir/

	make DESTDIR="${pkgdir}" install
}

