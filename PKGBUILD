# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-xhtml2pdf
_name=${pkgname#python-}
pkgver=0.2.13
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
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "exclude-packages.patch"
)
sha256sums=(
  '549b73ec2d79da002bb81911fa3d8f6d8877ea7aa2af3a080a3d8882f90b5113'
  '9553544f4151f5d4facfe02fdcd43fb9dba78dc5ec4afc9e8a17073ad3d78a5d'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/exclude-packages.patch"
}

build() {
  cd "$_archive"

  rm -rf build
  python -m build --wheel --no-isolation

  export PYTHONPATH=$PWD/docs/source:$PWD
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
  install -Dm644 -t "$pkgdir/usr/share/man/man1" docs/build/man/xhtml2pdf.1
}
