# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgbase=libonvif
pkgname=('python-libonvif')
pkgver=3.2.8
pkgrel=1
url='https://github.com/sr99622/libonvif'
license=('LGPL-2.1-or-later')
arch=('i686' 'x86_64')
makedepends=('cmake'
             'git'
             'libxml2'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
# _prjrel=3.3.4
source=("git+${url}.git#commit=60372b0c15fc1843bc3f3030a1952355e5cb5cab"
        'git+https://github.com/pybind/pybind11.git')
sha256sums=('42eb59cfd1d5df2a302126b8cc4fac02c23d9816c469c40f77213bc82339ab9e'
            'SKIP')

prepare() {
	cd ${srcdir}/${pkgbase}
	git submodule init libonvif/pybind11
	git config submodule.libonvif/pybind11.url "${srcdir}/pybind11"
	git -c protocol.file.allow=always submodule update libonvif/pybind11
}

pkgver() {
	cd ${srcdir}/${pkgbase}/libonvif
	sed -n -e '/libonvif VERSION/p' CMakeLists.txt | sed -e 's/[^0-9,.]*//g'
}

build() {
	cd ${srcdir}/${pkgbase}/libonvif
	python -m build --wheel --no-isolation
}

package_python-libonvif() {
	pkgdesc='A client side implementation of the ONVIF specification - python library'
	depends=('libxml2' 'python')

	cd ${srcdir}/${pkgbase}/libonvif
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
