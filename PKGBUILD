# Maintainer: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-xhtml2pdf
_name=${pkgname#python-}
pkgver=0.2.9
pkgrel=1
pkgdesc="A library for converting HTML into PDFs using ReportLab"
arch=(any)
url="https://github.com/xhtml2pdf/xhtml2pdf"
license=('Apache')
depends=(python-arabic-reshaper
         python-bidi
         python-reportlab
         python-pypdf
         python-html5lib
         python-svglib
         python-pyhanko
)
makedepends=(python-setuptools
             python-sphinx_rtd_theme
             python-sphinxcontrib-pdfembed
             texlive-latexextra
             texlive-fontsextra)
# Sometimes there is v prefix in version, sometimes not.
source=("${_name}-${pkgver}.tar.gz::https://github.com/xhtml2pdf/xhtml2pdf/archive/refs/tags/$pkgver.tar.gz"
        'latex_engine.patch'
)
sha256sums=('da1771a0837f8daf2aac38883576eca86f79ff4660f15449d770801012fa3503'
            '19d631ba04ae7d42e6c95962df1bc99edf84c80920539bb8aa2fc7f2f6c53589'
)
prepare() {
	cd "${_name}-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/latex_engine.patch"
}

build() {
	cd ${_name}-${pkgver}
	python setup.py build
	(cd docs && make html)
	(cd docs && make latexpdf)
}

check() {
	cd ${_name}-${pkgver}
	python setup.py test
}

package() {
	cd ${_name}-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
	cp ${srcdir}/${_name}-${pkgver}/docs/build/html ${pkgdir}/usr/share/doc/${pkgname} -R
	cp ${srcdir}/${_name}-${pkgver}/docs/build/latex/${_name}.pdf ${pkgdir}/usr/share/doc/${_name}.pdf
}
