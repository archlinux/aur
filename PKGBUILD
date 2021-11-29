# Maintainer: pongo1231 <pongo1999712@gmail.com>
# Contributor: EatMyVenom <eat.my.venom@gmail.com>
# Contributor: Radostin Stoyanov <rstoyanov1@gmail.com>

pkgname=xz-static-git
pkgver=5.3.2alpha.r.g2024fbf
pkgrel=1
pkgdesc='Statically linked tools for XZ or LZMA compressed files'
arch=('x86_64')
url='http://tukaani.org/xz/'
license=('GPL' 'LGPL' 'custom')
depends=('sh')
conflicts=('xz-static')
makedepends=('git' 'po4a')
options=('staticlibs')
source=('git+http://git.tukaani.org/xz.git')
sha256sums=('SKIP')

# keep an upgrade path for older installations
PKGEXT='.pkg.tar.gz'

pkgver() {
	cd xz/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list 
--count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd xz/

	./autogen.sh
	./configure --prefix=/usr \
		--disable-rpath \
		--enable-werror \
        --disable-shared \
        --disable-xz \
        --disable-xzdec \
        --disable-lzmadec \
        --disable-lzmainfo \
        --disable-scripts \
        --disable-doc

	make
}

check() {
	cd xz/

	make check
}

package() {
	cd xz/

	make DESTDIR=${pkgdir} install

	rm -Rf ${pkgdir}/usr/{bin,include,share,lib/pkgconfig}
}

