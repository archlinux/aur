# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-idle-culler
pkgdesc="JupyterHub service to cull and shut down idle users and notebook servers"
pkgver=2.0.0
pkgrel=1
url="https://github.com/jupyterhub/jupyterhub-idle-culler"
license=('BSD-3-Clause')
arch=('any')

depends=(
  'python-dateutil'
  'python-packaging'
  'python-tornado'
  'python-traitlets'
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
  'pull_request_107.patch::https://patch-diff.githubusercontent.com/raw/jupyterhub/jupyterhub-idle-culler/pull/107.patch'
)
sha256sums=(
  'c450182241461998a719d45846c2f7aea154e3f4e3cb964e336c3616a1fcda70'
  'ad0cc9a0a908eb712cb2d8845741f217b27e85742a7e88690bce9aafa2be46c5'
)

prepare() {
  cd "$pkgname"
  git apply -v "$srcdir/pull_request_107.patch"  # Fixes failures during test cleanup
}

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
