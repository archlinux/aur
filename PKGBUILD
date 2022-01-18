# Maintainer: András Wacha <awacha@gmail.com>
pkgname=python-xhtml2pdf
_name=${pkgname#python-}
pkgver=0.2.5
pkgrel=1
pkgdesc="A library for converting HTML into PDFs using ReportLab"
arch=(any)
url="https://github.com/xhtml2pdf/xhtml2pdf"
license=('Apache')
makedepends=( python-setuptools 
              python-sphinx 
		python-sphinx_rtd_theme
              python-nose 
	      python-wheel
	      texlive-core
	      texlive-bin
)
depends=( python-reportlab
	python-pillow
	python-html5lib
	python-httplib2
	python-coverage
	python-pypdf2
	python-six
)
source=("https://github.com/${_name}/${_name}/archive/${pkgver}.tar.gz"  )
sha256sums=('6cb3ff827861bc53e88a5ff99fe6b166dabe2861a7bc51f0817009436a7dd4b8')
build() {
	cd ${_name}-${pkgver}
	python setup.py build
        (cd doc && make html)
	(cd doc && make latexpdf)
}

check() {
	cd ${_name}-${pkgver}
	python setup.py test
}

package() {
	cd ${_name}-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
	cp ${srcdir}/${_name}-${pkgver}/doc/build/html ${pkgdir}/usr/share/doc/${pkgname} -R
	cp ${srcdir}/${_name}-${pkgver}/doc/build/latex/${_name}.pdf ${pkgdir}/usr/share/doc/${_name}.pdf
}
