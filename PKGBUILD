# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=onvif-gui
pkgver=2.0.9
pkgrel=2
pkgdesc='A client side implementation of the ONVIF specification - GUI app'
url='https://github.com/sr99622/libonvif'
license=('Apache-2.0')
arch=('any')
depends=('python-avio'
         'python-libonvif'
         'python-loguru'
         'python-numpy'
         'python-opencv'
         'python-pyqt6'
         'qt6-base')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
conflicts=('python-yolox')
# _prjrel=2.0.9
source=("git+${url}.git#commit=b21f043dea0e4401fd59bed069d6fe306c37ab22"
        "${pkgname}.desktop")
sha256sums=('1b7ba19e99c446a6fc752faba42ce4350eeec2436f9b6ff7b78eae6648196884'
            'dc6d193827628215ccf66c0617c6ce2150e2fc3a5ee66afc35fb9c0c7d571d88')

prepare() {
	cd ${srcdir}/libonvif/${pkgname}
	# move gui to non-generic namespace
	find . -type f -exec sed -e 's, gui, onvif_gui,g' -e 's,/gui/,/onvif_gui/,g' -e 's,"gui","onvif_gui",' -i {} +
	sed -e 's, gui, onvif_gui,' -i MANIFEST.in
	sed -e 's,=gui\.,=onvif_gui\.,' -i setup.py
	mv gui onvif_gui
}

pkgver() {
	cd ${srcdir}/libonvif/${pkgname}
	sed -n -e '/version/p' pyproject.toml | sed -e 's/[^0-9,.]*//g'
}

build() {
	cd ${srcdir}/libonvif/${pkgname}
	python -m build --wheel --no-isolation
}

package() {
	cd ${srcdir}/libonvif/${pkgname}
	install -D -m 644 \
		${srcdir}/${pkgname}.desktop \
		${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -D -m 644 \
		onvif_gui/resources/${pkgname}.png \
		${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
