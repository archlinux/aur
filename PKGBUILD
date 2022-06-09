# Maintainer: András Wacha <awacha@gmail.com>
pkgname=sasview
pkgver=5.0.5
pkgrel=1
pkgdesc="Small-Angle Scattering Analysis"
arch=(x86_64)
url="https://sasview.org"
license=('BSD')
depends=( python-setuptools 
          python-pyparsing 
          python-html5lib 
          python-reportlab 
          python-h5py 
          python-lxml 
          python-pillow 
          python-pylint
          python-periodictable
          python-numpy
          python-scipy
          python-pyqt5
          python-matplotlib
          python-xhtml2pdf
          python-sphinx
          python-pyopencl
          python-ipykernel
          python-qtconsole
          python-twisted
	  python-qt5reactor
	  python-service-identity
          python-pytest
	  sasmodels
)
checkdepends=(python-unittest-xml-reporting)

makedepends=(texlive-latexextra)
source=("$pkgname-$pkgver.tar.gz::https://github.com/SasView/sasview/archive/v${pkgver}.tar.gz"
	'sphinx-docs.patch'
)
md5sums=('52da09f7ec3ea63c7d5ab4f7a989ef1f' 'SKIP')
sha256sums=('8c92ecc113cf861f675a4ff5024920e036b58d178fd6e7afb77bd2fac41d5077' 'SKIP')

prepare() {
	cd "${pkgname}-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/sphinx-docs.patch"
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
	(cd docs/sphinx-docs && make html )
	(cd docs/sphinx-docs && make latexpdf )
}

check() {
	cd "${pkgname}-${pkgver}/test"
	python utest_sasview.py
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p ${pkgdir}/usr/share/doc/sasview/tutorials
	cp ${srcdir}/${pkgname}-${pkgver}/docs/sphinx-docs/build/latex/SasView.pdf ${pkgdir}/usr/share/doc/sasview/SasView.pdf
	cp -R ${srcdir}/${pkgname}-${pkgver}/docs/sphinx-docs/build/html ${pkgdir}/usr/share/doc/sasview/
	python setup.py install --root="$pkgdir/" --optimize=1
	
}
