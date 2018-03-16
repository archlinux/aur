# Maintainer: Nick Milosevic <nick000@gmail.com>

_pkgname=php-facedetect
pkgname=${_pkgname}-git
pkgver=1.1.0.r15.gc717941
pkgrel=1
pkgdesc="PHP extension for opencv face detection"
license=('BSD')
arch=('any')
url="https://github.com/infusion/PHP-Facedetect"
depends=( 'php>=5.3' 'opencv>=2.0' 'gtkglext')
makedepends=('git')
backup=('etc/php/conf.d/facedetect.ini')
install=php-facedetect.install
source=("${_pkgname}"::"git+https://github.com/infusion/PHP-Facedetect.git")
sha512sums=('SKIP')

pkgver() {
	#cd "${_pkgname}-${pkgver}"
	cd $srcdir/${_pkgname}
	git describe --long --tags | sed 's/\([^v-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

build() {
	cd "${srcdir}/${_pkgname}"

	phpize || return 1
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd "$srcdir/${_pkgname}"

	echo ';extension=facedetect.so' > facedetect.ini
	install -D -m744 "$srcdir/${_pkgname}/modules/facedetect.so" "$pkgdir/usr/lib/php/modules/facedetect.so"
	install -D -m644 facedetect.ini "$pkgdir/etc/php/conf.d/facedetect.ini"
}
