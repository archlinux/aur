# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=onvif-gui
pkgver=3.3.7
pkgrel=1
pkgdesc='A client side implementation of the ONVIF specification - GUI app'
url='https://github.com/sr99622/libonvif'
license=('Apache-2.0')
arch=('any')
depends=('python-avio'
         'python-kankakee'
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
# _prjrel=3.3.7
source=("git+${url}.git#commit=f42ca6c0177df8d495b42cf2ed578fe2163ff151"
        "${pkgname}.desktop")
sha256sums=('619f7fdf482917c55726e9eeec9a11d37b4cd44ad76ca7cad1509f12fb8201a5'
            'dc6d193827628215ccf66c0617c6ce2150e2fc3a5ee66afc35fb9c0c7d571d88')

pkgver() {
	cd ${srcdir}/libonvif/${pkgname}
	sed -n -e '/version =/p' pyproject.toml | sed -e 's/[^0-9,.]*//g'
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
