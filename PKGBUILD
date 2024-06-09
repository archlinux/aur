# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-xhtml2pdf
_pkgname=${pkgname#python-}
pkgver=0.2.16
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c031b662d3f999e18f384e8d606be84a8a1e516d8380a87b3bd9fd2446a1e754')

_archive="$_pkgname-$pkgver"

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
  cp -a -t "$pkgdir/usr/share/doc/$pkgname" docs/build/html
  install -Dm644 -t "$pkgdir/usr/share/man/man1" docs/build/man/xhtml2pdf.1
}
