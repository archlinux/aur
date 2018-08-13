# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-setuptools_trial
pkgname=(python-setuptools_trial python2-setuptools_trial)
pkgver=0.6.0
pkgrel=2
pkgdesc="Setuptools plugin that makes unit tests execute with trial instead of pyunit"
arch=('any')
license=('SPL')
url="https://github.com/rutsky/setuptools-trial"
makedepends=('python-setuptools' 'python-twisted'
             'python2-setuptools' 'python2-twisted' 'python2-pathlib2')
checkdepends=('python-pytest-virtualenv' 'python-virtualenv'
              'python2-pytest-virtualenv' 'python2-virtualenv')
source=("https://pypi.python.org/packages/source/s/setuptools_trial/setuptools_trial-${pkgver}.tar.gz")
md5sums=('bca42190adf631b213846c2b33f3676f')

prepare() {
	cp -a "setuptools_trial-${pkgver}"{,-py2}
}

build() {
	cd "${srcdir}/setuptools_trial-${pkgver}"
	python setup.py build

	cd "${srcdir}/setuptools_trial-${pkgver}-py2"
	python2 setup.py build
}

check() {
	cd "${srcdir}/setuptools_trial-${pkgver}"
	python setup.py test

	cd "${srcdir}/setuptools_trial-${pkgver}-py2"
	python2 setup.py test
}


package_python-setuptools_trial() {
	depends=('python' 'python-twisted')

	cd "setuptools_trial-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 COPYING.SPL.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING.SPL.txt"
}

package_python2-setuptools_trial() {
	depends=('python2' 'python2-twisted' 'python2-pathlib2')

	cd "setuptools_trial-${pkgver}-py2"
	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	# pkg installs things under /usr/share/doc/python-setuptools_trial hardcoded
	mv "${pkgdir}/usr/share/doc/"{python,python2}-setuptools_trial

	install -Dm644 COPYING.SPL.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING.SPL.txt"
}
