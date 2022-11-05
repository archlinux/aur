# Maintainer: KUMAX <kumax2048@pm.me>

_pkgbase=yafu
pkgname=yafu-git
pkgrel=1
pkgver=r468.ca48c65
pkgdesc="Automated integer factorization."
url=https://github.com/bbuhrow/yafu
license=("MIT")
arch=('x86_64')
conflicts=(${_pkgbase})
provides=('yafu' 'ysieve')
#makedepends=('zlib' 'msieve') ## These dependencies are related to some features, but they are not tested for being sufficient to make yafu work.
makedepends=('git' 'subversion')
depends=('gmp' 'gmp-ecm')
optdepends=('ggnfs')
source=(
	"git+https://github.com/bbuhrow/yafu.git"
	"git+https://github.com/bbuhrow/ytools.git"
	"git+https://github.com/bbuhrow/ysieve.git"
	msieve::"svn+svn://svn.code.sf.net/p/msieve/code/trunk"
	)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
	cd ${srcdir}/yafu
	sed -i "s%^LIBS += -lecm /users/buhrow/src%#LIBS += -lecm /users/buhrow/src%" Makefile
	sed -i "s/^\#LIBS += -lecm -lgmp -lytools -lysieve/LIBS += -lecm -lgmp -lytools -lysieve/" Makefile
}

pkgver() {
	cd "${_pkgbase}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd ${srcdir}/ytools
	make CC=gcc
	cp libytools.a ${srcdir}/ysieve/

	cd ${srcdir}/ysieve
	make CC=gcc
	cp libytools.a ${srcdir}/yafu/
	cp libysieve.a ${srcdir}/yafu/
	
	cd ${srcdir}/msieve
	make all NO_ZLIB=1

	cd ${srcdir}/yafu
	make yafu CC=gcc NFS=1
}

package() {
	cd ${srcdir}/ysieve
	install -Dm755 ysieve ${pkgdir}/usr/bin/ysieve

	cd ${srcdir}/yafu
	install -Dm755 yafu ${pkgdir}/usr/bin/yafu
	install -Dm644 yafu.ini -t ${pkgdir}/etc/yafu
	install -Dm644 README -t ${pkgdir}/usr/share/doc/yafu
	install -Dm644 CHANGES -t ${pkgdir}/usr/share/doc/yafu
	install -Dm644 docfile.txt -t ${pkgdir}/usr/share/doc/yafu
}
