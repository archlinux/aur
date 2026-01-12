# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=onvif-gui
pkgver=3.3.4
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
# _prjrel=3.3.4
source=("git+${url}.git#commit=60372b0c15fc1843bc3f3030a1952355e5cb5cab"
        "${pkgname}.desktop")
sha256sums=('42eb59cfd1d5df2a302126b8cc4fac02c23d9816c469c40f77213bc82339ab9e'
            'dc6d193827628215ccf66c0617c6ce2150e2fc3a5ee66afc35fb9c0c7d571d88')

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
