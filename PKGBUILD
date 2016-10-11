# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=paccache-git
pkgver=0.1.22.r0.gdd01039
pkgrel=1
pkgdesc='serve pacman cache and redirect via avahi service - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/paccache'
depends=('avahi' 'curl' 'iniparser' 'darkhttpd' 'libmicrohttpd' 'nss-mdns')
makedepends=('git' 'markdown')
license=('GPL')
# this is not to blame pacserve from AUR but to replace my old
# package that was named the same
conflicts=('pacserve' 'paccache')
provides=('paccache')
replaces=('pacserve')
install=paccache.install
backup=('etc/pacredir.conf' 'etc/pacman.d/paccache')
source=('git://github.com/eworm-de/paccache.git')
sha256sums=('SKIP')

pkgver() {
	cd paccache/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

build() {
	cd paccache/

	make
}

package() {
	cd paccache/

	make DESTDIR="${pkgdir}" install
}

