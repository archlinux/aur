# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-ykfde-git
pkgver=0.6.3.r14.g16cc1d8
pkgrel=1
pkgdesc='Full disk encryption with Yubikey (Yubico key) - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/mkinitcpio-ykfde'
license=('GPL')
depends=('yubikey-personalization' 'cryptsetup' 'iniparser' 'libarchive' 'keyutils')
makedepends=('git' 'markdown')
conflicts=('mkinitcpio-ykfde')
provides=('mkinitcpio-ykfde')
install=mkinitcpio-ykfde.install
source=('git://github.com/eworm-de/mkinitcpio-ykfde.git')
sha256sums=('SKIP')
backup=('etc/ykfde.conf')

pkgver() {
	cd mkinitcpio-ykfde/

	# usauall I use 'git describe' with '--tags'
	# skip it here as we want signed tags only
	if GITTAG="$(git describe --abbrev=0 2>/dev/null)"; then
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
	cd mkinitcpio-ykfde/

	make
}

package() {
	cd mkinitcpio-ykfde/

	make DESTDIR=${pkgdir} install-mkinitcpio
}

