# Maintainer: Joachim Desroches <joachim.desroches@epfl.ch>

pkgname=cdist
pkgver=7.0.0
pkgrel=2
pkgdesc='A usable configuration management system'
arch=('any')
url='https://code.ungleich.ch/ungleich-public/cdist/'
license=('GPL3')
depends=('python' 'openssh')
makedepends=('python-setuptools' 'python-six' 'python-sphinx' 'python-sphinx_rtd_theme')
source=("https://code.ungleich.ch/ungleich-public/cdist/archive/${pkgver}.tar.gz")
sha256sums=('951f37b01a57e0b630987d68827ceb2eeb44e29251028406b1c37c8dc05beb9f')

prepare() {
	echo "VERSION = \"${pkgver}\"" > ${pkgname}/cdist/version.py
}

build() {
	cd ${pkgname}/

	python setup.py build
	make man
}

package() {
	cd ${pkgname}/

	python setup.py install --root="${pkgdir}"

	# Install documentation
	mkdir -p ${pkgdir}/usr/share/man/man1 ${pkgdir}/usr/share/man/man7
	cp docs/dist/man/man1/*.1 ${pkgdir}/usr/share/man/man1/
	cp docs/dist/man/man7/*.7 ${pkgdir}/usr/share/man/man7/

	# Restore executable bit on scripts removed by setup.py
	cd "${pkgdir}"
	grep -l -R -m 1 "^#!\/" . | xargs chmod +x

}
