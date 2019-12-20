# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vimpager-git
pkgver=2.06.r367.g92242cf
pkgrel=1
pkgdesc='A vim-based script to use as a PAGER - git checkout'
arch=('any')
url='https://github.com/rkitover/vimpager'
license=('custom:vim')
depends=('vim')
makedepends=('git' 'pandoc')
conflicts=('vimpager')
provides=('vimpager')
backup=('etc/vimpagerrc')
source=('git+https://github.com/rkitover/vimpager.git')
sha256sums=('SKIP')

pkgver() {
	cd vimpager/

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

package() {
	cd vimpager/

	make PREFIX="/usr" SYSCONFDIR="/etc" DESTDIR="${pkgdir}" install

  install -Dm644 debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}

