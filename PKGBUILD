# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-xhtml2pdf
_name=${pkgname#python-}
pkgver=0.2.11
pkgrel=2
pkgdesc="A library for converting HTML into PDFs using ReportLab"
arch=(any)
url="https://github.com/xhtml2pdf/xhtml2pdf"
license=(Apache)
depends=(
  python
  python-arabic-reshaper
  python-asn1crypto
  python-bidi
  python-html5lib
  python-pillow
  python-pyhanko
  python-pyhanko-certvalidator
  python-pypdf
  python-reportlab
  python-svglib
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  # python-sphinx_rtd_theme
  # python-sphinxcontrib-pdfembed
  # texlive-latexextra
  # texlive-fontsextra
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
  "latex_engine.patch"
)
sha256sums=(
  '198a7c78d4233322802cf57a554a92db78f30c7fa485a25cdb93713812f1f9ad'
  '19d631ba04ae7d42e6c95962df1bc99edf84c80920539bb8aa2fc7f2f6c53589'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="${srcdir}/latex_engine.patch"
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation

  #(cd docs && make html)
  #(cd docs && make latexpdf)
}

check() {
  cd "$_archive"

  python setup.py test
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  # cp ${srcdir}/${_name}-${pkgver}/docs/build/html ${pkgdir}/usr/share/doc/${pkgname} -R
  # cp ${srcdir}/${_name}-${pkgver}/docs/build/latex/${_name}.pdf ${pkgdir}/usr/share/doc/${_name}.pdf
}
