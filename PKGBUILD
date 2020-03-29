# Maintainer: Oliver Kahrmann <oliver.kahrmann@gmail.com>

pkgname=undither
pkgver=20021015
pkgrel=1
pkgdesc="Remove dither effects from scanned images"
arch=('x86_64' 'i686')
url="http://www.madingley.org/james/resources/undither/"
license=('Custom')
depends=('fftw2')
makedepends=('wget')
source=(
	"http://www.madingley.org/james/resources/undither/files/undither-$pkgver.tar.gz"
	"LICENSE"
)
sha256sums=(
	'76241e87e64df3c7723c966ca71019e930e1473bb570de4c45e24a3340231b7f'
	'SKIP'
)

prepare() {
	# Replace fttw header filenames and library names to adjust for fftw2 package
	sed "s/<fftw.h>/<sfftw.h>/" -i "$srcdir/undither/undither.c"
	sed "s/<rfftw.h>/<srfftw.h>/" -i "$srcdir/undither/undither.c"

	sed "s/-lfftw/-lsfftw/" -i "$srcdir/undither/Makefile"
	sed "s/-lrfftw/-lsrfftw/" -i "$srcdir/undither/Makefile"

	# Download the explanation on the website as documentation
	wget -P $srcdir/undither-doc -r -nH -nd -np -nc -k -A html,gif,jpg "http://www.madingley.org/james/resources/undither/"
}

build() {
	cd "$srcdir/undither"
	make FFTW="$destdir/usr" undither
}

package() {
	cd "$srcdir/undither"
	mkdir -p $pkgdir/usr/bin
	make BINDIR="$pkgdir/usr/bin" FFTW="$destdir/usr" install

	install -Dm644 "${srcdir}/undither/README" "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -Dm644 "${srcdir}/undither-doc/"* "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
