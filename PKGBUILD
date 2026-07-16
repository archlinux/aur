# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_pyname=dockerspawner
pkgname="python-jupyterhub-${_pyname}"
pkgdesc="Spawns JupyterHub single user servers in Docker containers"
pkgver=14.0.0
pkgrel=1
url="https://github.com/jupyterhub/dockerspawner"
arch=('any')
license=('BSD-3-Clause')

depends=(
  'docker'
  'jupyterhub>4'
  'python-docker'
  'python-escapism'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  #'python-setuptools'
  #'python-setuptools-scm'
)
checkdepends=(
  'python-psutil'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-cov'
  'python-pytest-tornado'
)

source=("${_pyname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('5d4b07677b1a4622e4da86ac518f81beaa0254ff81bcb719f2ff69b49a4102e3fde97ebf7527eb53d23c140f30f2987e5ead898ede83abb0bdd1c03efe79a555')

build() {
  cd "$_pyname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pyname-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pyname-$pkgver"-*.whl
  # Skipping tests that require docker to be running, as this is not feasible in a clean chroot environment.
  # If we do build using makepkg in a user's normal environment, then some tests still fail.
  # Disabling them for now.
  #test-env/bin/python -m pytest -v
}

package() {
  cd "$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pyname-$pkgver"-*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Don't package the unit tests.; There aren't any tests in the wheel.
  #rm -rf "$pkgdir/"usr/lib/python*/site-packages/dockerspawner/tests
}
