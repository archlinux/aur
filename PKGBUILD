# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=pythonqt
pkgname=${_pkgname}-git
pkgver=r473.c07f09f
pkgrel=1
pkgdesc='A dynamic Python binding for Qt applications'
arch=('i686' 'x86_64')
url='https://github.com/MeVisLab/pythonqt'
license=('LGPL2.1')

depends=('python' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-declarative' 'qt5-xmlpatterns')
makedepends=('git' 'qt5-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-svn" 'qt5-python27-git')

source=("git+https://github.com/MeVisLab/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
	# Updating package version
	cd "${srcdir}"/${_pkgname}
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	# Create build directory
	mkdir -p "${srcdir}"/build
	cd "${srcdir}"/build
	cp -R ../${_pkgname}/* ./

	# Fix python version
	sed -ri 's|(unix:PYTHON_VERSION=)(.+)$|\13|g' build/python.prf

	# Do not build tests nor examples
	sed -ri 's|(SUBDIRS = generator src extensions)(.+)$|\1|g' PythonQt.pro
}

build() {
	# Building package
	cd "${srcdir}"/build
	qmake-qt5 \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		CONFIG+=release \
		CONFIG+=c++14
	make
}

package() {
	cd "${srcdir}"/build

	# Includes
	mkdir -p "${pkgdir}"/usr/include/PythonQt/{gui,extensions/PythonQt_QtAll}
	cp ../${_pkgname}/src/*.h "${pkgdir}"/usr/include/PythonQt/
	cp ../${_pkgname}/src/gui/*.h "${pkgdir}"/usr/include/PythonQt/gui/
	cp ../${_pkgname}/extensions/PythonQt_QtAll/*.h "${pkgdir}"/usr/include/PythonQt/extensions/PythonQt_QtAll/

	# Library
	mkdir -p "${pkgdir}"/usr/lib
	cp -a lib/*.so* "${pkgdir}"/usr/lib/

	# pkg-config file
	mkdir -p "${pkgdir}"/usr/share/pkgconfig
	cp -R lib/*.pc "${pkgdir}"/usr/share/pkgconfig/
}
