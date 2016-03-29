# Maintainer: Danny Dutton <duttondj@vt.edu>

_pkgname="qt-installer-framework"
pkgname=${_pkgname}-git
pkgrel=2
pkgver=r2826.6277c86
_qtver=5.4.2
pkgdesc="The Qt Installer Framework used for the Qt SDK installer."
arch=('i686' 'x86_64')
url='http://qt-project.org/wiki/Qt-Installer-Framework'
license=('FDL' 'LGPL')
makedepends=("git" "qt5-base>=${_qtver}" "qt5-tools>=${_qtver}" "qt5-declarative>=${_qtver}")
groups=('qt' 'qt5')
_pkgfqn="${_pkgname}-opensource-${pkgver}-src"

source=("${pkgname}::git+https://code.qt.io/installer-framework/installer-framework.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd $pkgname
	echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/${pkgname}"
	qmake-qt5 ./installerfw.pro
	make
	make docs
	cd "${srcdir}/${pkgname}/tests"
	qmake-qt5 ./tests.pro
	make
}

package() {
        install -d ${pkgdir}/usr/{bin,lib,share/{${_pkgname},doc/{qt,${_pkgname}},licenses/${_pkgname}}}
	cd "${srcdir}/${pkgname}"
	install -m644 LGPL_EXCEPTION.txt "${pkgdir}/usr/share/licenses/${_pkgname}/"
	install -m644 LICENSE.FDL "${pkgdir}/usr/share/licenses/${_pkgname}/"
	install -m644 LICENSE.LGPL* "${pkgdir}/usr/share/licenses/${_pkgname}/"
	cp -a ./bin/*    "${pkgdir}/usr/bin/"
	cp -a ./lib/*    "${pkgdir}/usr/lib/"
	cp -a "./doc/html"    "${pkgdir}/usr/share/doc/${_pkgname}/"
	cp    "./doc/ifw.qch" "${pkgdir}/usr/share/doc/qt/"
	cp -a "./tests"        "${pkgdir}/usr/share/${_pkgname}/"
	cp -a "./examples"    "${pkgdir}/usr/share/${_pkgname}/"
} 
