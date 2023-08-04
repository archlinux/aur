# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-xhtml2pdf
_name=${pkgname#python-}
pkgver=0.2.11
pkgrel=4
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

  python-sphinx_rtd_theme
  python-sphinxcontrib-pdfembed
  texlive-latexextra
  texlive-fontsextra
)
checkdepends=(
  python-nose
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
  "latex-engine.patch"
  "fix-sphinx-issues.patch"
)
sha256sums=(
  '198a7c78d4233322802cf57a554a92db78f30c7fa485a25cdb93713812f1f9ad'
  '19d631ba04ae7d42e6c95962df1bc99edf84c80920539bb8aa2fc7f2f6c53589'
  'a76ae6df2bc2103038a416e16f8eb41d2a3fcf4e813a075a6c0a5d38b50895d0'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="${srcdir}/latex-engine.patch"
  patch --forward --strip=1 --input="${srcdir}/fix-sphinx-issues.patch"

  sed -i '/with-coverage/d' setup.cfg
  sed -i '/coverage-package/d' setup.cfg
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation

  (cd docs && make html)
  (cd docs && make man)
}

check() {
  cd "$_archive"

  nosetests
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  cp -R docs/build/html "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 docs/build/man/xhtml2pdf.1 "$pkgdir/usr/share/man/man1/xhtml2pdf.1"
}
