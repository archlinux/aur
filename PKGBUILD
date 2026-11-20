# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-dahuffman
pkgver=0.4.2
pkgrel=1
pkgdesc='Pure Python Huffman encoder and decoder'
arch=(any)
url='https://github.com/soxofaan/dahuffman'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b1827440b27018fe2852a3ff7729f9e52aada6584987e2c82e55435a58b97065')

prepare() {
  cd "dahuffman-$pkgver"
  # Python 3.14 accepts resource names as positional arguments.
  local codecs=dahuffman/codecs/__init__.py
  grep -Fq 'importlib.resources.path("dahuffman.codecs", resource=name)' "$codecs"
  sed -i 's/path("dahuffman.codecs", resource=name)/path("dahuffman.codecs", name)/' "$codecs"
}

build() {
  cd "dahuffman-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "dahuffman-$pkgver"
  local site
  site=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
  python -m installer --destdir="$srcdir/test-root" dist/*.whl
  mkdir -p "$srcdir/test-suite"
  cp -a tests "$srcdir/test-suite/"
  cd "$srcdir/test-suite"
  PYTHONPATH="$srcdir/test-root$site" python -P -m pytest -ra --import-mode=importlib tests
}

package() {
  cd "dahuffman-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
