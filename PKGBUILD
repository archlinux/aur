# Maintainer: Raphael Michel <mail@raphaelmichel.de>
_pkgname=cups-fgl-printers
pkgname=$_pkgname-git
pkgver=r5.ff6abcc
pkgrel=1
pkgdesc="CUPS drivers for FGL-based ticket printers"
arch=('any')
license=('GPL')
url="https://github.com/pretix/cups-fgl-printers"
depends=('python' 'python-pillow' 'python-numpy')
makedepends=('make' 'cups')
source=('git+https://github.com/pretix/cups-fgl-printers.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	make ppds
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm 755 rastertofgl.py "${pkgdir}/usr/lib/cups/filter/rastertofgl"
	install -d  "${pkgdir}/usr/share/cups/model/custom/fgl"
	cd ppd
	find -type f -exec install -Dm 644 {} "${pkgdir}/usr/share/cups/model/custom/fgl/{}" \;
	cd ..
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
