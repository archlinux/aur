# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: _le34n$ <4le34n@gmail.com>
# Contributor: Starfry <archlinux@jelmail.com>

pkgname=nfdump
pkgver=1.6.17
pkgrel=1
pkgdesc="A set of tools to collect and process netflow data."
arch=('i686' 'x86_64')
url="https://github.com/phaag/nfdump/"
license=('BSD')
depends=('glibc')
makedepends=('flex' 'bison' 'rrdtool')
source=("nfdump-v${pkgver}.tar.gz::https://github.com/phaag/nfdump/archive/v${pkgver}.tar.gz")
md5sums=('95e30627750ae3798c3fb0c053b3b212')

prepare() {
	cd "$pkgname-$pkgver"

	sed -re 's|-lnfdump|libnfdump.la|g' -i bin/Makefile.am
}

build() {
	cd "$pkgname-$pkgver"

	./autogen.sh  # needed since 1.6.17
	./configure --prefix=/usr \
	  --enable-nfprofile \
	  --enable-nftrack \
	  --enable-sflow

	make
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/nfdump/COPYING"
}
