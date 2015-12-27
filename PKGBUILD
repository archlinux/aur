# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcver="1.3.1-4"
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
sha256sums=('bd40fb7259059c06b4b8908f2a57f0fd2a6af83d0bd17ffd0651ffafe69fccb0')

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
