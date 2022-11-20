# Maintainer: David Runge <dvzrv@archlinux.org>

_name=tabulate
pkgname=python38-tabulate
pkgver=0.9.0
pkgrel=1
pkgdesc="Pretty-print tabular data in Python, a library and a command-line utility."
arch=(any)
url="https://github.com/astanin/python-tabulate"
license=(MIT)
depends=(python38)
makedepends=(python38-build python38-installer python38-setuptools-scm python38-toml python38-wheel)
checkdepends=(python38-nose python38-numpy python38-pandas python38-pytest python38-wcwidth)
optdepends=(
  'python38-numpy: NumPy array support'
  'python38-pandas: pandas.DataFrame support'
  'python38-wcwidth: wide-character support'
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('042a6b34ea6e5b6324cb40112b3078b62e6f1f6186401262e7b06a5b96dd118d4b70e259a96121e383ac1fe53f3953c27532206af9825b97db9f41fe1e5f3934')
b2sums=('5912f173002428df2e5ff899cff8322e9bcec76e5ba0cbe2e3321d4b2e54ba110c84b8bb112b1a9b4e032b35eb5695604181474884154af1379c6226120b84b2')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python3.8 -m "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python3.8 -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -v
}

package_python38-tabulate() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
