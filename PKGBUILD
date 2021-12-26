# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=normcap
pkgver=0.2.9
pkgrel=1
pkgdesc="OCR powered screen-capture tool to capture information instead of images"
arch=('any')
url="https://dynobo.github.io/normcap"
license=('GPL')
depends=('leptonica' 'pyside2' 'python-importlib-metadata' 'python-importlib_resources'
         'python-jeepney' 'python-tesserocr' 'tesseract-data-eng')
makedepends=('python-pip' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dynobo/normcap/archive/refs/tags/v$pkgver.tar.gz"
#        "https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('28677c414195f7cc3ba70968db73766064517fd2acb0dde5d799e9c04a52e31e'
            '29992fdb19773faa7582e44fe4394d4772984d5b7b9b7b347617c387f0a260f9')

prepare() {
  cd "$pkgname-$pkgver"

  # Relax requirements
  sed -i 's/python = ">=3.7.1,<3.10"/python = ">=3.7.1"/g' pyproject.toml
}

build() {
  cd "$pkgname-$pkgver"
  poetry build --format wheel
}

package() {
  cd "$pkgname-$pkgver"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  python -O -m compileall "${pkgdir}${site_packages}/"

  install -d "$pkgdir/usr/share/pixmaps/"
  ln -s "$site_packages/$pkgname/resources/$pkgname-256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
