# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-idle-culler
pkgdesc="JupyterHub service to cull and shut down idle users and notebook servers"
pkgver=1.4.0
pkgrel=1
url="https://github.com/jupyterhub/jupyterhub-idle-culler"
license=('BSD-3-Clause')
arch=('any')

depends=(
  'python-dateutil'
  'python-packaging'
  'python-tornado'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
)
checkdepends=(
  'jupyterhub'
  'jupyterlab'
  'jupyter-notebook'
  'python-psutil'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-cov'
)

_pyname=jupyterhub_idle_culler
source=(
  "git+https://github.com/jupyterhub/$pkgname.git#tag=$pkgver"
)
sha256sums=(
  '8dc992a7e5437b29f3a8c4b65a11e3556ed2ffc3f22d660389b484f539829230'
)

build() {
  cd "$pkgname"
  python -m build --no-isolation --wheel
}

check() {
  cd "$pkgname"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pyname-$pkgver-"*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" "dist/$_pyname-$pkgver-"*.whl

  install -Dm644 "COPYING.md" "$pkgdir/usr/share/licenses/$pkgname/COPYING.md"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
