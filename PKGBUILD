# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyrsistent
_name=${pkgname#python-}
pkgver=0.21.0
pkgrel=1
pkgdesc="Persistent/Immutable/Functional data structures"
arch=($CARCH)
license=('MIT')
url="https://github.com/tobgu/pyrsistent"
depends=(
  'glibc' 
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest' 
  'python-hypothesis' 
  'python-typing_extensions'
)
source=("${pkgname}::git+https://github.com/tobgu/pyrsistent.git#tag=v${pkgver}")
sha512sums=('990aa69aa5706bb13e9e52403b9fed25cc5357462e1d542464db2e3da9f6e0b43c0486fc11c2438efd887011f85d8a9568cb05c7f67e3c8046bb57d2d4e961d3')

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${pkgname}"
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="test_dir/$site_packages" pytest -vv
}
package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.mit -t "$pkgdir"/usr/share/licenses/$pkgname/
}
