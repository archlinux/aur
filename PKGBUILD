# Maintainer: András Wacha <awacha@gmail.com>
pkgname=sasview
pkgver=5.0.6
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
checkdepends=()

makedepends=(texlive-latexextra texlive-binextra texlive-fontsrecommended)
source=("$pkgname-$pkgver.tar.gz::https://github.com/SasView/sasview/archive/v${pkgver}.tar.gz"
	'sphinx-docs.patch'
)
md5sums=('a8e006dad057a7110e4ef74f93a39261'
         '5bc096ee2c911545ba3251e308429c72')
sha256sums=('3ee5a95c30d9858c1d32766e99a5e3504d219614fb6c5b2cc7c2561d6b924291'
            'e1d8e107aa24ff06917b9ba2e8357818e6b1b90d91f36135dfbd051ca5b3184b')

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

#check() {
#	cd "${pkgname}-${pkgver}/test"
#	python utest_sasview.py
#}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p ${pkgdir}/usr/share/doc/sasview/tutorials
	cp ${srcdir}/${pkgname}-${pkgver}/docs/sphinx-docs/build/latex/SasView.pdf ${pkgdir}/usr/share/doc/sasview/SasView.pdf
	cp -R ${srcdir}/${pkgname}-${pkgver}/docs/sphinx-docs/build/html ${pkgdir}/usr/share/doc/sasview/
	python setup.py install --root="$pkgdir/" --optimize=1
	
}
