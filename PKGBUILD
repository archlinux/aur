# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: naxuroqa <naxuroqa@gmail.com>

pkgname=tox-prpl-git
pkgver=0.4.2.r11.g18cc684
pkgrel=1
pkgdesc='Tox protocol plugin for pidgin / libpurple - git checkout'
arch=('i686' 'x86_64')
url='http://tox.dhs.org/'
license=('GPL3')
depends=('libpurple' 'tox-git')
makedepends=('git' 'libconfig')
optdepends=('pidgin: Use tox in pidgin messenger')
options=('!libtool')
conflicts=('tox-prpl')
provides=('tox-prpl')
source=('git://github.com/jin-eld/tox-prpl.git')
sha256sums=('SKIP')

pkgver() {
	cd tox-prpl/

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

prepare() {
	cd tox-prpl/

	# make it compile again with new api
	git cherry-pick -n e547fa94
}

build() {
	cd tox-prpl/

	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd tox-prpl/

	make DESTDIR="$pkgdir" install
}

