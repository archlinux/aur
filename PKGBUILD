# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: ValHue <vhuelamo at gmail dot com>

pkgname=caja-pdf-tools
pkgver=1.2.9
pkgrel=3
_ubuntur=0extras19.06.7
pkgdesc='A set of tools to work with PDF documents from Caja'
arch=('any')
url='https://www.atareao.es/aplicacion/pdf-tools-o-modificar-pdf-en-linux/#'
license=('GPL-3.0')
conflicts=("${pkgname%-git}")
depends=('python-caja' 'python-gobject' 'python-cairo' 'python-pillow' 'gtk3' 'poppler'
	         'python-pypdf2' 'python-sh')
source=("${pkgname}-${pkgver}.tar.xz::https://launchpad.net/~atareao/+archive/ubuntu/caja-extensions/+sourcefiles/${pkgname}/${pkgver}-${_ubuntur}/${pkgname}_${pkgver}-${_ubuntur}.tar.xz")
sha256sums=('712367ad53e4bdce539559033c95ffb0cf38755cfbd91fe5a179aeebcb7633ef')

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
	cp ./data/icons/updf.svg ${pkgdir}/usr/share/caja-python/extensions/pdf-tools/icons/
	cp ./debian/changelog ${pkgdir}/usr/share/caja-python/extensions/pdf-tools/
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim: set ts=4 sw=4 et syn=sh ft=sh: