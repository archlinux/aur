# Maintainer: Joachim Desroches <joachim.desroches@epfl.ch>

pkgname=cdist
pkgver=6.9.7
pkgrel=1
pkgdesc='A usable configuration management system'
arch=('any')
url='https://code.ungleich.ch/ungleich-public/cdist/'
license=('GPL3')
depends=('python' 'openssh')
makedepends=('python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
validpgpkeys=('69767822F3ECC3C349C1EFFFEFD2AE4EC36B6901') # ungleich GmbH (ungleich FOSS) <foss@ungleich.ch>'
source=("https://code.ungleich.ch/ungleich-public/cdist/uploads/4c62574643cbb2669044fb23e1eac85d/cdist-6.9.7.tar.gz"
	"https://code.ungleich.ch/ungleich-public/cdist/uploads/8e8d35619c5c0b18c9bbbc714d3a8f0c/cdist-6.9.7.tar.gz.asc")
sha256sums=('657240ab52a00abbff13404035e43631b8db4dbe2bb14165d1479909a018ee6e'
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
