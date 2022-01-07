# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=bsd-mailx-git
pkgver=174.g1dc80bd
pkgrel=1
pkgdesc='bsd-mailx from Debian'
arch=('x86_64' 'i686')
url='https://salsa.debian.org/debian/bsd-mailx'
license=('GPL')
depends=('libbsd' 'liblockfile')
makedepends=('git')
provides=('bsd-mailx')
conflicts=('bsd-mailx')
backup=('etc/bsd-mailx.rc')
source=("${pkgname}::git+https://salsa.debian.org/debian/bsd-mailx.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf '%s.g%s' \
		"$(git rev-list --count master)" \
		"$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	for PATCH in $(< debian/patches/series); do
		patch -Np1 < debian/patches/${PATCH}
	done

	sed -i '/_PATH_MASTER_RC/s|mail.rc|bsd-mailx.rc|' pathnames.h
}

build() {
	cd "${srcdir}/${pkgname}"

	make
}

package() {
	cd "${srcdir}/${pkgname}"

	install -D -m0755 mail "${pkgdir}"/usr/bin/bsd-mailx
	install -D -m0644 mail.1 "${pkgdir}"/usr/share/man/man1/bsd-mailx.1
	install -D -m0644 misc/mail.rc "${pkgdir}"/etc/bsd-mailx.rc
}

