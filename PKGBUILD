# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-execute-time
pkgdesc="JupyterLab extension to show execution time for each cell"
url='https://github.com/deshaw/jupyterlab-execute-time'
pkgver=3.0.0
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
  '2d9b08a293075a59457b442cdb856ab3ba388393e88fc3a706d798564f3b4963'
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
