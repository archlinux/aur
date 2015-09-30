# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Jakub Luzny <limoto94@gmail.com>

pkgname=x86info-git
pkgver=1.18.r459.g27ace37
pkgrel=1
pkgdesc='A CPU identification utility. Provides more info than /proc/cpuinfo - git checkout'
arch=('i686' 'x86_64')
url="http://www.codemonkey.org.uk/projects/x86info/"
license=('GPL')
install=x86info.install
makedepends=('git')
provides=('x86info')
conflicts=('x86info')
source=('git://github.com/dankamongmen/x86info.git')
sha256sums=('SKIP')

pkgver() {
	cd x86info/

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
	cd x86info/

	make

	cd lsmsr/

	make
}

package() {
	cd x86info/

	install -D -m0775 x86info "${pkgdir}/usr/bin/x86info"
	install -D -m0775 lsmsr/lsmsr "${pkgdir}/usr/bin/lsmsr"
	install -D -m0644 x86info.1 "${pkgdir}/usr/share/man/man1/x86info.1"
	install -D -m0644 lsmsr/lsmsr.8 "${pkgdir}/usr/share/man/man8/lsmsr.8"
}

