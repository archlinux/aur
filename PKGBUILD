# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=pacredir-git
pkgver=0.5.0.r0.gde04ce4
pkgrel=2
pkgdesc='redirect pacman requests, assisted by avahi service discovery - git checkout'
arch=('x86_64')
url='https://github.com/eworm-de/pacredir'
license=('GPL-3.0-or-later')
depends=('systemd-libs' 'avahi' 'curl' 'iniparser' 'darkhttpd' 'libmicrohttpd' 'sh')
makedepends=('git' 'systemd' 'discount')
provides=('pacredir')
conflicts=('pacredir')
install=pacredir.install
backup=('etc/pacman.d/pacredir'
        'etc/pacredir.conf'
        'etc/pacserve.conf')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183') # Christian Hesse <mail@eworm.de>
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

  # https://github.com/curl/curl/pull/17790
  CFLAGS+=' -Wno-attribute-warning'

  make
}

package() {
  cd pacredir/

  make DESTDIR="${pkgdir}" install
}

