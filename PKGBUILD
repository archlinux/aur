# Maintainer: Luca_S <luca at acul dot me>
_pkgname="qutescoop"
pkgname="${_pkgname}-git"
pkgver=v2.1.13.beta.1.r49.85cbd8e
pkgrel=1
pkgdesc="A platform-independent status indicator for VATSIM."

arch=('i686' 'x86_64')
url="https://github.com/qutescoop/qutescoop"
license=('GPL3')
depends=('qt5-base' 'glu')
makedepends=('git')
install=
source=("${_pkgname}::git+https://github.com/qutescoop/qutescoop.git" "fix-desktop-file.patch")
sha256sums=('SKIP'
            '14da95617262bc3092a4a3c9cd799f0994e31405887c76125e7efcec5a866983')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch --strip=1 < ../fix-desktop-file.patch
}

build() {
	cd "${srcdir}/${_pkgname}"
	qmake QuteScoop-unix.pro
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make install
	case $CARCH in
	'i686')
		_resultdir="${srcdir}/${_pkgname}/DIST-unix32"
		;;
	'x86_64')
		_resultdir="${srcdir}/${_pkgname}/DIST-unix64"
		;;
	esac

	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/QuteScoop/QuteScoop"
	mkdir -p "${pkgdir}/usr/share/applications"

	install -m 755 -p -v "${_resultdir}/QuteScoop" "${pkgdir}/usr/bin"
	cp -vr "${_resultdir}/data" "${pkgdir}/usr/share/QuteScoop/QuteScoop"
	cp -vr "${_resultdir}/screenshots" "${pkgdir}/usr/share/QuteScoop/QuteScoop"
	cp -vr "${_resultdir}/textures" "${pkgdir}/usr/share/QuteScoop/QuteScoop"
	cp -vr "${_resultdir}/downloaded" "${pkgdir}/usr/share/QuteScoop/QuteScoop"
	install -m 644 -p -v "${_resultdir}/qutescoop.png" "${pkgdir}/usr/share/QuteScoop/QuteScoop"

	install -m 644 -p -v "${_resultdir}/QuteScoop.desktop" "${pkgdir}/usr/share/applications"
}
