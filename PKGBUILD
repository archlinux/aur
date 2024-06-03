# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgbase=libonvif
pkgname=('libonvif' 'python-libonvif')
pkgver=3.1.1
pkgrel=2
url='https://github.com/sr99622/libonvif'
license=('LGPL-2.1-or-later')
arch=('i686' 'x86_64')
makedepends=('cmake'
             'git'
             'libxml2'
             'pybind11'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
# _prjrel=2.0.9
source=("git+${url}.git#commit=b21f043dea0e4401fd59bed069d6fe306c37ab22")
sha256sums=('1b7ba19e99c446a6fc752faba42ce4350eeec2436f9b6ff7b78eae6648196884')

prepare() {
	cd ${srcdir}/${pkgbase}/libonvif
	sed -e 's,add_subdirectory(pybind11),find_package(pybind11 REQUIRED),' -i CMakeLists.txt
}

pkgver() {
	cd ${srcdir}/${pkgbase}/libonvif
	sed -n -e '/libonvif VERSION/p' CMakeLists.txt | sed -e 's/[^0-9,.]*//g'
}

build() {
	cd ${srcdir}/${pkgbase}/libonvif
	cmake -B build-so \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D WITHOUT_PYTHON=true \
		-W no-dev
	cmake --build build-so
	python -m build --wheel --no-isolation
}

package_libonvif() {
	pkgdesc='A client side implementation of the ONVIF specification - library'
	depends=('libxml2')

	cd ${srcdir}/${pkgbase}/libonvif
	install -D -m 644 -t ${pkgdir}/usr/include include/onvif.h
	install -D -m 755 -t ${pkgdir}/usr/lib build-so/${pkgname}.so.*
	cp -a build-so/${pkgname}.so ${pkgdir}/usr/lib
}

package_python-libonvif() {
	pkgdesc='A client side implementation of the ONVIF specification - python library'
	depends=('libxml2' 'python')

	cd ${srcdir}/${pkgbase}/libonvif
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
