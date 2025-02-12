# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=python-tesserocr
_name=${pkgname#python-}
pkgver=2.8.0
pkgrel=1
pkgdesc="A simple, Pillow-friendly, Python wrapper around tesseract-ocr API using Cython"
arch=('x86_64')
url="https://github.com/sirfz/tesserocr"
license=('MIT')
depends=(
  'leptonica'
  'python'
  'tesseract'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pillow'
  'python-pytest'
  'tesseract-data-eng'
)
optdepends=('python-pillow')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('106bcd9a67152ed9c821f705648089f8e229a971c31d2101973a64bc47949bac')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  export TESSDATA_PREFIX=/usr/share/tessdata
  python setup.py develop --user

  # test_LSTM_choices failure: 
  # https://github.com/sirfz/tesserocr/issues/214
  # https://github.com/sirfz/tesserocr/issues/295
  donttest="test_LSTM_choices"
  donttest+=" or test_detect_os"
  donttest+=" or test_init"
  pytest -k "not ($donttest)"
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
