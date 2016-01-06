# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcver="1.3.1-6"
pkgname=libfpx
pkgver="$(echo "$_srcver" | tr '-' '_')"
pkgrel=1
pkgdesc="FlashPIX OpenSource Toolkit"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/download/delegates/"
license=('custom')
depends=('gcc-libs')
provides=('libfpx.so')
source=("http://www.imagemagick.org/download/delegates/${pkgname}-${_srcver}.tar.bz2")
sha256sums=('84e663bb23619e19195777a7c5d348046756f28cffda3d0ea2160ed0b55a698a')

build() {
	cd "$pkgname"-"$_srcver"
	
	./configure \
                --prefix=/usr \
                --enable-static=no \
                --enable-shared=yes
	
	make
}

package() {
	cd "$pkgname"-"$_srcver"
	make DESTDIR="$pkgdir/" install
	
	# Make a "LICENSE" file. Note: license is in the file "flashpix.h".
	cp --force flashpix.h LICENSE
	
	# Erase characters denoting comments
	sed -i '1s/^.\{,2\}//' LICENSE
	sed -i '2,79s/^.\{,1\}//' LICENSE
	sed -i '80s/^.\{,2\}//' LICENSE
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
