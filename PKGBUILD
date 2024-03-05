# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-wstools
pkgver=0.4.10
_commit=c7f6c2973f5c598affa7def61d87e1775a6ac1d1
pkgrel=7
pkgdesc="WSDL parsing services package for Web Services for Python"
arch=('any')
url="https://github.com/pycontribs/wstools"
license=('BSD-3-Clause')
depends=('python-six')
makedepends=('git' 'python-pbr' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'autopep8' 'python-pytest-cov')
source=("git+https://github.com/pycontribs/wstools.git#commit=$_commit"
        python310.patch)
sha512sums=('SKIP'
            'd1eb690578eaf7f5e79d9dbc0494b545d88e124e11f9927c5c17c9e64b7cba209fbe5ad68b43afd84c850d22c36133e39e305d214ea55e8a7935e06a465f8947')

prepare() {
  cd wstools
  patch -Np1 -i ../python310.patch
  sed -i "s/, 'pytest-runner'//" setup.py
}

build() {
  cd wstools
  python -m build --wheel --no-isolation
}

check() {
  cd wstools
  pytest
}

package() {
  cd wstools
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 docs/* -t "$pkgdir"/usr/share/licenses/$pkgname/
}
