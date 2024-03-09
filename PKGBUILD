# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-xhtml2pdf
_pkgname=${pkgname#python-}
pkgver=0.2.15
pkgrel=2
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
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "reportlab-4.1.0-compatibility.patch"
)
sha256sums=(
  '4e802908267d3b8682076cca11cb314997dff946400e10a929243d40b4c17e28'
  '53fb653376a3d92cf50d28094c99e6685a588ab9390526e31992815690ea9096'
)

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/reportlab-4.1.0-compatibility.patch"
}

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
  cp -at "$pkgdir/usr/share/doc/$pkgname" docs/build/html

  install -Dm644 -t "$pkgdir/usr/share/man/man1" docs/build/man/xhtml2pdf.1
}
