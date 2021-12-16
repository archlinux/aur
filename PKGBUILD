# Maintainer: Joachim Desroches <joachim.desroches@epfl.ch>

pkgname=cdist
pkgver=6.9.8
pkgrel=1
pkgdesc='A usable configuration management system'
arch=('any')
url='https://code.ungleich.ch/ungleich-public/cdist/'
license=('GPL3')
depends=('python' 'openssh')
makedepends=('python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
source=("https://code.ungleich.ch/ungleich-public/cdist/archive/6.9.8.tar.gz")
sha256sums=('b6913ecf5953b2592bc0e6b357aaa8592f5ab8c28ba5921a3d0b9de88a8445b9')

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
