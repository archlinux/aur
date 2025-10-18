# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-sudospawner
pkgdesc="Spawn JupyterHub single-user servers with sudo"
pkgver=1.0.0
pkgrel=1
url="https://github.com/jupyterhub/sudospawner"
license=('BSD-3-Clause')
arch=('any')

depends=(
  'jupyterhub'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
)
checkdepends=(
  'python-pytest'
  'python-pytest-tornado'
)

source=(
  "sudospawner-$pkgver.tar.gz::https://github.com/jupyterhub/sudospawner/archive/$pkgver.tar.gz"
)
sha256sums=(
  'afca1a9a7af2df55997705a2d00bda26b0f2182db3d0492ef0e7ad910817d128'
)

build() {
  cd "sudospawner-${pkgver}"
  python -m build --no-isolation --wheel
}

check() {
  cd "sudospawner-${pkgver}"

  # Install the built wheel into a virtual environment.
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/sudospawner-$pkgver"*.whl

  # Add to the path so the sudospawner command can be found.
  PATH="${srcdir}/sudospawner-${pkgver}/test-env/bin:$PATH" test-env/bin/python -m pytest
}

package() {
  cd "sudospawner-${pkgver}"
  python -m installer --destdir="$pkgdir" "dist/sudospawner-$pkgver"*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -t "${pkgdir}/usr/share/doc/${pkgname}" -vDm 644 CHANGELOG.md README.md
  install -t "${pkgdir}/usr/share/doc/${pkgname}/examples" -vDm 644 example/*

  # Remove unit tests from the final package.
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "${pkgdir}/${site_packages}/sudospawner/tests/"
}
