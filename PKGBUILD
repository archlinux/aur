# Maintainer: Mirko Scholz
pkgname=qwt5-qt5
_commit=2819734e280ab2fce39338ccecf21124eb787004
pkgver=5.2.3.0
pkgrel=1
pkgdesc='Qwt library (version 5.2.3) updated to work with Qt5.'
arch=('x86_64')
license=('custom')
depends=('qt5-base' 'qt5-svg')
url='https://github.com/gbm19/qwt5-qt5'
source=(
"qwt5-qt5-${pkgver}.zip::https://github.com/gbm19/qwt5-qt5/archive/${_commit}.zip"
"qwtconfig-archlinux.pri"
"00_qlist_missing.patch"
)
sha1sums=('75001ab1862ba448a7883e87a32a0956ac374053'
          '23209de530c9604a0b2fa6df32b6beabe28a9e58'
          '94ed795c9457d187d1e31489f8377e2570919bb1')

prepare() {
	install -Dm644 "qwtconfig-archlinux.pri" "${srcdir}/qwt5-qt5-${_commit}/qwtconfig.pri"
	cd "${srcdir}/qwt5-qt5-${_commit}"
	patch --forward --strip=1 --input="${srcdir}/00_qlist_missing.patch"
}

build() {
	cd "${srcdir}/qwt5-qt5-${_commit}"
	qmake-qt5 qwt.pro
	make
}

package() {
	cd "${srcdir}/qwt5-qt5-${_commit}"
	make INSTALL_ROOT="${pkgdir}" install

	# remove docs
	rm -r "${pkgdir}/usr/share/doc/"
	rm -r "${pkgdir}/usr/share/man/"

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
