# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-execute-time
pkgdesc="JupyterLab extension to show execution time for each cell"
url='https://github.com/deshaw/jupyterlab-execute-time'
pkgver=3.1.0
pkgrel=1
license=('BSD')
arch=('any')

depends=('jupyterlab')
makedepends=(
  'python-build' 'python-installer' 'python-jupyter-packaging'
  'python-setuptools' 'python-wheel' 'npm'
)

_pypi=jupyterlab_execute_time
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'install.json'
)
sha256sums=(
  '0451669517f103eaaa3cc5d40858414ec9f6816a86051d4bdc0c4fffd1ef3ac0'
  'fcaf662d9c5fcc529b4add01452bf3f1809c418c75d9b7e55f7fd822d407f9a3'
)

prepare() {
  cd "$_pypi-$pkgver"

  # Replace uninstallation instructions with Arch-specific ones.
  cp "$srcdir/install.json" .
}

build() {
  cd "$_pypi-$pkgver"

  # Not available otherwise, probably related to JupyterLab issue #14552
  npm install @types/react

  python -m build --no-isolation --wheel -x
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
