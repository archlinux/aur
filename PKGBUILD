# Maintainer: Joachim Desroches <joachim.desroches@epfl.ch>

pkgname=cdist
pkgver=6.9.1
pkgrel=1
pkgdesc='A usable configuration management system'
arch=('any')
url='https://code.ungleich.ch/ungleich-public/cdist/'
license=('GPL3')
depends=('python' 'openssh')
makedepends=('python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
validpgpkeys=('69767822F3ECC3C349C1EFFFEFD2AE4EC36B6901') # ungleich GmbH (ungleich FOSS) <foss@ungleich.ch>'
source=("https://code.ungleich.ch/ungleich-public/cdist/uploads/d236c4eda71c01dcc222ef88d681fdf1/cdist-6.9.1.tar.gz"
	"https://code.ungleich.ch/ungleich-public/cdist/uploads/c12e97570b3f31836d4a2374d78a0213/cdist-6.9.1.tar.gz.asc")
md5sums=('7399a326c8445dfa2e6c8a26ebcc0e89'
	 'SKIP')

prepare() {
	echo "VERSION = \"${pkgver}\"" > ${pkgname}-${pkgver}/cdist/version.py
}

build() {
	cd ${pkgname}-${pkgver}/

	python setup.py build
	make man
}

package() {
	cd ${pkgname}-${pkgver}/

	python setup.py install --root="${pkgdir}"

	# Install documentation
	mkdir -p ${pkgdir}/usr/share/man/man1 ${pkgdir}/usr/share/man/man7
	cp docs/dist/man/man1/*.1 ${pkgdir}/usr/share/man/man1/
	cp docs/dist/man/man7/*.7 ${pkgdir}/usr/share/man/man7/

	# Restore executable bit on scripts removed by setup.py
	cd "${pkgdir}"
	grep -l -R -m 1 "^#!\/" . | xargs chmod +x

}
