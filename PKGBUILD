# Maintainer: Danny Waser (Waser Technologies) <waser@waser.tech>

_pkgname=installer
pkgname=python38-$_pkgname
pkgver=0.5.1
pkgrel=2
pkgdesc='Low-level library for installing a Python 3.8 package from a wheel distribution'
arch=('any')
url='https://github.com/pypa/installer'
license=('MIT')
depends=('python38')
makedepends=('git' 'python38-flit-core' 'python38-build'
             'python38-sphinx' 'python38-sphinx-furo' 'python38-myst-parser'
             'python38-sphinx-argparse')
checkdepends=('python38-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('0320c1795c98a593b5da46775465e26bdf8736f59835970517cb02f2756030a3744b9385a9342e8062362d0769d585ff6cce504fdf105e99d27d6ba40281842b')

build() {
  cd $_pkgname-$pkgver

  python3.8 -m build -wn --skip-dependency-check

  PYTHONPATH=src sphinx-build -b dirhtml -v docs docs/build/html
}

check() {
  cd $_pkgname-$pkgver

  PYTHONPATH=src pytest
}

package() {
  cd $_pkgname-$pkgver

  PYTHONPATH=src python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # remove windows entrypoint scripts executables
  rm "$pkgdir"/usr/lib/python*/site-packages/installer/_scripts/*.exe

  # install documentation
  install -dm 755 "$pkgdir"/usr/share/doc/$pkgname
  cp -r -a --no-preserve=ownership docs/build/html "$pkgdir"/usr/share/doc/$pkgname
  rm -rf "$pkgdir"/usr/share/doc/$pkgname/html/.doctrees

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}