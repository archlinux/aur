# Maintainer: Radostin Stoyanov <rstoyanov1@gmail.com>

pkgname=xz-static-git
pkgver=5.3.1alpha.r.gf76f751
pkgrel=1
pkgdesc='Statically linked library for decoding files compressed with LZMA or XZ utils.  Most users should *not* install this.'
arch=('i686' 'x86_64')
url='http://tukaani.org/xz/'
license=('GPL' 'LGPL' 'custom')
depends=('sh')
makedepends=('git')
provides=('lzma' 'lzma-utils' 'xz-utils' "xz=${pkgver%%.r*}")
replaces=('lzma' 'lzma-utils' 'xz-utils')
conflicts=('lzma' 'lzma-utils' 'xz-utils' 'xz')
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
		--enable-werror
	make
}

check() {
	cd xz/

	make check
}

package() {
	cd xz/

	make DESTDIR=${pkgdir} install
	install -d -m0755 ${pkgdir}/usr/share/licenses/xz/
	ln -sf /usr/share/doc/xz/COPYING ${pkgdir}/usr/share/licenses/xz/
}


