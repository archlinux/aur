# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python38-snappy
pkgver=0.6.1
pkgrel=1
pkgdesc='Python bindings for the snappy compression library.'
url='https://github.com/andrix/python-snappy'
depends=(python38 snappy)
makedepends=(python38-setuptools)
checkdepends=(python38-pytest)
license=(BSD)
arch=(x86_64)
source=(https://files.pythonhosted.org/packages/source/p/python-snappy/python-snappy-$pkgver.tar.gz)
sha256sums=('b6a107ab06206acc5359d4c5632bd9b22d448702a79b3169b0c62e0fb808bb2a')

prepare() {
  cd $pkgname-$pkgver
  # Move test scripts around, so that they can use the correct sys.path (build/lib.linux...)
  mkdir tests
  mv test_*.py tests
}

build() {
  cd $pkgname-$pkgver
  python3.8 setup.py build
}

check() {
  cd $pkgname-$pkgver
  pyver=$(python3.8 -m "import sys; print('{}{}'.format(*sys.version_info[:2]))")
  export PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython38-$pyver"
  # Avoid writing .pyc files in check(), or packaging with --nocheck cannot reproduce
  # packages built with check() as .pyc files created in check() embed $srcdir
  PYTHONDONTWRITEBYTECODE=1 pytest tests --ignore=tests/test_snappy_cffi.py
}

package() {
  cd $pkgname-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
