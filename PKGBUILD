# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=gpdfand-git
pkgver=0.r16.ga477ac0
pkgrel=1
pkgdesc='GPD fan control - git checkout'
arch=('any')
url='https://github.com/efluffy/gpdfand'
license=('GPL')
depends=('perl' 'perl-proc-daemon' 'perl-proc-pid-file' 'perl-log-dispatch' 'perl-timedate')
makedepends=('git')
provides=('gpdfand')
conflicts=('gpdfand')
source=('git://github.com/efluffy/gpdfand.git')
sha256sums=('SKIP')

pkgver() {
	cd gpdfand/

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

prepare() {
	cd gpdfand/

	sed -i 's|/usr/local/|/usr/|' gpdfand.service
}

package() {
	cd gpdfand/

	install -D -m0644 gpdfand.service "${pkgdir}"/usr/lib/systemd/system/gpdfand.service
	install -D -m0755 gpdfand "${pkgdir}"/usr/lib/systemd/system-sleep/gpdfand
	install -D -m0755 gpdfand.pl "${pkgdir}"/usr/bin/gpdfand
	install -d -m0755 "${pkgdir}"/var/log/gpdfand/
}

