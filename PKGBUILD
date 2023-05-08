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
	  python-uncertainties
	  sasmodels
)
checkdepends=(python-unittest-xml-reporting)

makedepends=(texlive-latexextra)
source=("$pkgname-$pkgver.tar.gz::https://github.com/SasView/sasview/archive/v${pkgver}.tar.gz"
	'sphinx-docs.patch'
        'np_float_deprecated.patch'
)
md5sums=('52da09f7ec3ea63c7d5ab4f7a989ef1f'
         '5bc096ee2c911545ba3251e308429c72'
         '3334446106fe34caabe98a06c3bcbd82')
sha256sums=('8c92ecc113cf861f675a4ff5024920e036b58d178fd6e7afb77bd2fac41d5077'
            'e1d8e107aa24ff06917b9ba2e8357818e6b1b90d91f36135dfbd051ca5b3184b'
            '47566dc89dc3bf4e222d9fe2bff3bb71a62b8fdc4c7a652f9bb57d8702b25c11')

prepare() {
	cd "${pkgname}-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/sphinx-docs.patch"
        patch --forward --strip=1 --input="${srcdir}/np_float_deprecated.patch"
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
