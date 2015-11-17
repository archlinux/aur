# Maintainer: vorpalblade77@gmail.com
pkgname=python-steamcontroller-git
_pkgname=steamcontroller
pkgver=f70b7ea
pkgrel=1
pkgdesc="Standalone userland driver for the Steam controller"
arch=('i686' 'x86_64')
url="https://github.com/ynsta/${_pkgname}"
license=('MIT')
makedepends=('python-distutils-extra')
depends=('python-libusb1')
optdepends=('steamcontroller-udev: Required to have the controller recognized'
	'python-pyside: Required for sc-gyro-plot.py'
	'python-pyqtgraph: Required for sc-gyro-plot.py')
provides=('steamcontroller')
conflicts=("${_pkgname}" 'steamcontroller-udev')
changelog=('changelog.txt')
source=("git+https://github.com/ynsta/${_pkgname}.git"
	"99-steamcontroller.rules")
sha256sums=('SKIP'
            '46de34b75730482e5276d94f072dd1911c48789f4442a41c56653b2db05ef46d')
install='steamcontroller.install'

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	python setup.py build
}

package() {
	install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
	install -Dm 644 "99-steamcontroller.rules" "${pkgdir}/usr/lib/udev/rules.d/99-steamcontroller.rules"
	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="${pkgdir}" \
	--prefix="/usr" \
	--compile -O1
	install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
