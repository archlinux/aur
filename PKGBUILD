# Maintainer: David Runge <dvzrv@archlinux.org>

_name=sly
pkgname=python-sly
pkgver=0.5
pkgrel=2
pkgdesc="Python implementation of the lex and yacc tools"
arch=(any)
url="https://github.com/dabeaz/sly"
license=(BSD)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('da3a3507acc4228fd32542ef9ecc640195134531be55058a6b93c830335a2c678afb04405636070b025d78fddf66a7313c5e6afab8359c5c8ae66e87130c6c08')
b2sums=('8d5dff1960d9c3b940667feb21d9a2e0d493c0202eea361a8f1107712d5afde1a7ecd1f910b2525a24fa53966059d77572d7fc676343f35bce9616cc657e9cee')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 CONTRIBUTING.md README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
