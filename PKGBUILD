# Mainainer: Christian Hesse <mail@eworm.de>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=file-git
pkgver=5.43.r81.g4cfda317
pkgrel=1
pkgdesc='File type identification utility - git checkout'
arch=('i686' 'x86_64')
license=('custom')
groups=('base-devel')
url='http://www.darwinsys.com/file/'
depends=('glibc' 'zlib' 'xz' 'bzip2' 'libseccomp' 'libseccomp.so')
makedepends=('git')
provides=('libmagic.so' 'file')
conflicts=('file')
source=('git+https://github.com/file/file.git')
sha256sums=('SKIP')

pkgver() {
	cd file/

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
	cd file/

	autoreconf -fi
}

build() {
	cd file/

	./configure \
		--prefix=/usr \
		--datadir=/usr/share/file \
		--enable-fsect-man5 \
		--enable-libseccomp
	make
}

check() {
	cd file/

	make check
}

package() {
	cd file/

	make DESTDIR="${pkgdir}" install

	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

