# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=bsd-mailx-git
pkgver=162.ge08053c
pkgrel=1
pkgdesc='bsd-mailx from Debian'
arch=('x86_64' 'i686')
url='http://anonscm.debian.org/gitweb/?p=users/robert/bsd-mailx.git'
license=('GPL')
depends=('libbsd' 'liblockfile')
makedepends=('git')
provides=('bsd-mailx')
conflicts=('bsd-mailx')
backup=('etc/bsd-mailx.rc')
source=('git://anonscm.debian.org/users/robert/bsd-mailx.git')
sha256sums=('SKIP')

pkgver() {
	cd bsd-mailx/

	printf '%s.g%s' \
		"$(git rev-list --count master)" \
		"$(git log -1 --format='%h')"
}

prepare() {
	cd bsd-mailx/

	for PATCH in $(< debian/patches/series); do
		patch -Np1 < debian/patches/${PATCH}
	done

	sed -i '/_PATH_MASTER_RC/s|mail.rc|bsd-mailx.rc|' pathnames.h
}

build() {
	cd bsd-mailx/

	make
}

package() {
	cd bsd-mailx/

	install -D -m0755 mail "${pkgdir}"/usr/bin/bsd-mailx
	install -D -m0644 mail.1 "${pkgdir}"/usr/share/man/man1/bsd-mailx.1
	install -D -m0644 misc/mail.rc "${pkgdir}"/etc/bsd-mailx.rc
}

