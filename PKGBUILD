# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-xhtml2pdf
_name=${pkgname#python-}
pkgver=0.2.14
pkgrel=1
pkgdesc="A library for converting HTML into PDFs using ReportLab"
arch=(any)
url="https://github.com/xhtml2pdf/xhtml2pdf"
license=(Apache-2.0)
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
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  # Documentation
  python-sphinx_rtd_theme
  python-sphinxcontrib-pdfembed
  texlive-fontsextra
  texlive-latexextra
)
checkdepends=(python-nose)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4750304ef414803a95f0a5e398b719619048d801258714d74a412a3a15b6ac24')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation

  export PYTHONPATH=$PWD/docs/source:$PWD
  make -C docs html man
}

check() {
  cd "$_archive"

  nosetests
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  cp --archive docs/build/html "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/man/man1" docs/build/man/xhtml2pdf.1
}
