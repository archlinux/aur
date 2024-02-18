# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=bacnet-stack
pkgver=1.3.3
pkgrel=1
pkgdesc="BACnet protocol stack and diagnostic tools (bacrp, bacwp, etc.)"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/bacnet/"
license=('GPL')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=()
makedepends=()
options=()
source=("https://sourceforge.net/projects/bacnet/files/bacnet-stack/bacnet-stack-${pkgver}/bacnet-stack-${pkgver}.tgz")
md5sums=('e15f6f8c375cd76086661da69e7420e6')
sha256sums=('d06f17964b4630f5d43947340b0ba57e03ec2af68e4bbc691500005f3ad58e1f')

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"

	# Switch "-Wl,-Labc,-labc" to "-Labc -labc".  This allows compilation to
	# proceed even if /usr/lib/libbacnet.a exists from an earlier version.
	sed -i '/^LFLAGS.*BACNET_LIB/ { s/-Wl,// }; /^BACNET_LIB/ { s/,/ / }' apps/Makefile
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"

	# Parallel builds don't work in v1.0.0.  Appears to be fixed in git so the
	# next release should be ok.
	#make -j1
	CFLAGS="$CFLAGS -Wno-deprecated-declarations" make ${MAKEFLAGS}
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	install -d "$pkgdir/usr/bin"
	install -m 755 -t "$pkgdir/usr/bin" `find bin -executable -type f -name bac\*`
}
