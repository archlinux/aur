# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mamba
pkgver=0.11.3
pkgrel=2
pkgdesc="The definitive testing tool for Python. Born under the banner of Behavior Driven Development."
arch=('any')
license=('MIT')
url="https://nestorsalceda.github.io/mamba"
depends=('python-coverage' 'python-clint')
makedepends=('python-setuptools')
checkdepends=('python-doublex-expects')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nestorsalceda/mamba/archive/v$pkgver.tar.gz")
sha512sums=('0d4ee434ff2a42dc95a8a5c94980fa224652e38b1ed7e617383882b38a8327861464424f78fb46b2f3e08dabb241bb0e1e9e6734dd68376a43bc3a5b41c01d8c')

build() {
  cd mamba-$pkgver
  python setup.py build
}

check() {
  cd mamba-$pkgver
  # Hack entry points by installing it

  python setup.py install --root="$PWD/tmp_install" --optimize=1
  (
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    export PATH="$PWD/tmp_install/usr/bin:$PATH" PYTHONPATH="$PWD/tmp_install/${site-packages}:$PYTHONPATH"
    mamba --enable-coverage
  )
}

package() {
  cd mamba-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
