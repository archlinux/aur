# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_ubuntur="0extras16.04.1"
pkgname="caja-pdf-tools"
pkgver="1.1.0"
pkgrel="1"
pkgdesc="A set of tools to work with PDF documents from Caja."
arch=('any')
url="https://www.atareao.es/aplicacion/pdf-tools-o-modificar-pdf-en-linux/#"
license=('GPL3')
depends=('python' 'python-beautifulsoup4' 'python-polib')
makedepends=('python-distutils-extra')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.xz::https://launchpad.net/~atareao/+archive/ubuntu/caja-extensions/+sourcefiles/${pkgname}/${pkgver}-${_ubuntur}/${pkgname}_${pkgver}-${_ubuntur}.tar.xz")
sha256sums=('4cb2e153bf14546a18fa38c34314b688c5630059e4dc479e7993a46bd948ffbe')

build() {
	cd "${srcdir}/temporal"
	for n in ./po/*.po; do
		msgfmt $n -o ./po/`basename $n .po`.mo
	done
}

package() {
	cd "${srcdir}/temporal"
	install -d ${pkgdir}/usr/share/caja-python/extensions/pdf-tools/{icons,PyPDF2}
	install -d ${pkgdir}/usr/share/locale
	for n in ./po/*.mo; do
		install -p -D -m644 $n ${pkgdir}/usr/share/locale/`basename $n .mo`/LC_MESSAGES/${pkgname}.mo
	done
	cp ./src/*.py ${pkgdir}/usr/share/caja-python/extensions/
	cp ./src/pdf-tools/*.py ${pkgdir}/usr/share/caja-python/extensions/pdf-tools/
	cp ./PyPDF2/PyPDF2/*.py ${pkgdir}/usr/share/caja-python/extensions/pdf-tools/PyPDF2/
	cp ./data/icons/updf.svg ${pkgdir}/usr/share/caja-python/extensions/pdf-tools/icons/
	cp ./debian/changelog ${pkgdir}/usr/share/caja-python/extensions/pdf-tools/

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
