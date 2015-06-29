# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: L42y <423300@gmail.com>

pkgname=oath-toolkit-git
pkgver=2.4.0.r7.ge9d90cd
pkgrel=1
pkgdesc='OATH one-time password toolkit - git checkout'
arch=('i686' 'x86_64')
url='http://www.nongnu.org/oath-toolkit/'
license=('GPL3')
depends=('glibc' 'pam' 'xmlsec')
options=('!libtool')
makedepends=('help2man' 'gengetopt' 'datefudge')
provides=('oath-toolkit')
conflicts=('oath-toolkit')
source=('git://git.sv.gnu.org/oath-toolkit.git')
sha256sums=('SKIP')

pkgver() {
	cd oath-toolkit/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd oath-toolkit/

	# create configure script
	make -f cfg.mk

	# configure and build
	./configure --prefix=/usr --disable-valgrind-tests
	make
}

check() {
	cd oath-toolkit/

	make check
}

package() {
	cd oath-toolkit/

	make DESTDIR="${pkgdir}" install

	# Install basic docs too
	install -D -m0644 pam_oath/README "${pkgdir}/usr/share/doc/${pkgname}/PAM_README"
	install -D -m0644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

