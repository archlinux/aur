# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgbase=libonvif
pkgname=('libonvif' 'python-libonvif')
pkgver=3.2.5
pkgrel=1
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
# _prjrel=2.4.4
source=("git+${url}.git#commit=e5c01df0849495b98c62acad3837fde72dda654c")
sha256sums=('249110e4fd52059fd64274efac024f141ba67af3a661466fa4831ec4ad8bc98d')

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
