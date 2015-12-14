# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Stefan Kirrmann <stefan.kirrmann at gmail dot com>

pkgname=open-iscsi-git
pkgver=2.0.873.r146.g4c9d6f9
pkgrel=2
pkgdesc='iSCSI userland tools - git checkout'
arch=('i686' 'x86_64')
url='http://www.open-iscsi.org/'
license=('GPL')
install=open-iscsi.install
depends=('libutil-linux' 'openssl')
makedepends=('git' 'open-isns')
provides=('open-iscsi')
conflicts=('open-iscsi')
backup=('etc/iscsi/iscsid.conf'
	'etc/iscsi/initiatorname.iscsi')
source=('git://github.com/mikechristie/open-iscsi.git')
options=('docs')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/open-iscsi/"

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
	cd "${srcdir}/open-iscsi/"

	# include iscsistart in the package
	sed -i -e '/^PROGRAMS = /s/$/ usr\/iscsistart/' Makefile

	# build breaks if the openslp package is installed
	sed -i -e 's/\(\.\/configure\)/ \1 --without-slp/g' Makefile

	make user
}

package() {
	cd "${srcdir}/open-iscsi/"

	make DESTDIR="${pkgdir}" install_user

	install -D -m0644 etc/systemd/iscsid.service "${pkgdir}/usr/lib/systemd/system/iscsid.service"
	install -D -m0644 etc/systemd/iscsid.socket "${pkgdir}/usr/lib/systemd/system/iscsid.socket"

	# do not set initiatorname, install script does that
	rm "${pkgdir}/etc/iscsi/initiatorname.iscsi"
	touch "${pkgdir}/etc/iscsi/initiatorname.iscsi"

	# copy docs
	install -D -m0644 Changelog "${pkgdir}/usr/share/doc/open-iscsi/Changelog"
	install -D -m0644 README "${pkgdir}/usr/share/doc/open-iscsi/README"

	# fix install path for binaries
	mv "${pkgdir}/sbin" "${pkgdir}/usr/bin"
}
