# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libfpx
_digest="http://www.imagemagick.org/download/delegates/digest.rdf"
_srcver=$(curl -s "$_digest" | grep -o "${pkgname}-.*\.tar\.xz" | sed 's/[^0-9\.-]*//g' | sed -r 's/.//;s/.{2}$//')
_srcverregex=$(echo "$_srcver" | sed 's/\./\\\./g') # translate source version to a regular expression
pkgver="${_srcver//-/.}"
pkgrel=1
pkgdesc="FlashPIX OpenSource Toolkit"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/download/delegates/"
license=('custom')
depends=('gcc-libs')
makedepends=('curl' 'gcc5')
provides=('libfpx.so')
source=("http://www.imagemagick.org/download/delegates/${pkgname}-${_srcver}.tar.xz")
sha256sums=($(curl -s ${_digest} | grep -A5 "${pkgname}-${_srcverregex}\.tar\.xz" | grep 'sha256' | grep -oE '>[[:alnum:]]*?<' | sed 's/[><]//g'))

build() {
	cd "$pkgname"-"$_srcver"
	
	CC="gcc-5" \
	CPP="gcc-5 -E" \
	CXX="g++-5" \
	CXXCPP="g++-5 -E" \
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
	sed -i '1s/^.\{,2\}//'    LICENSE
	sed -i '2,79s/^.\{,1\}//' LICENSE
	sed -i '80s/^.\{,2\}//'   LICENSE
	
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
