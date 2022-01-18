# Maintainer: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-xhtml2pdf
_name=${pkgname#python-}
pkgver=0.2.5
pkgrel=2
pkgdesc="A library for converting HTML into PDFs using ReportLab"
arch=(any)
url="https://github.com/xhtml2pdf/xhtml2pdf"
license=('Apache')
depends=(python-arabic-reshaper
         python-bidi
         python-reportlab
         python-pypdf2
         python-html5lib)
makedepends=(python-setuptools
             python-sphinx_rtd_theme
             texlive-latexextra
             python-wheel)
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
