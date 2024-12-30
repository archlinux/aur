# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Anthony Wang <a_at-exozy_dot-me>

pkgname='python-jupyter-server-proxy'
pkgver=4.4.0
pkgrel=2
pkgdesc="Jupyter notebook server extension to proxy web services"
url="https://github.com/jupyterhub/jupyter-server-proxy"
license=('BSD-3-Clause')
arch=('any')

depends=(
  jupyter-server
  python-aiohttp
  python-simpervisor
)
makedepends=(
  python-build
  python-installer
  python-hatch-jupyter-builder
)
checkdepends=(
  jupyter-notebook
  python-pytest
  python-pytest-asyncio
  python-pytest-cov
  python-pytest-html
)

_pyname='jupyter_server_proxy'
source=(
  "https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//_/-}/$_pyname-$pkgver.tar.gz"
)
sha256sums=(
  'e5732eb9c810c0caa997f90a2f15f7d09af638e7eea9c67eb5c43e9c1f0e1157'
)

build() {
  cd "$_pyname-$pkgver"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "$_pyname-$pkgver"

  # Install wheel into a virtual environment.
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pyname-$pkgver"*.whl
  local testsite=$(test-env/bin/python -c "import site; print(site.getsitepackages()[0])")

  # Set the paths so the local installation can be found (although we run
  # pytest through the venv, any calls it makes to the jupyter command will use
  # /usr/bin/jupyter which sets /usr/bin/python as the interpreter, thus not
  # noticing our installation of the extension).
  PYTHONPATH="${testsite}" \
    JUPYTER_CONFIG_DIR="$(pwd)/test-env/etc/jupyter" \
    JUPYTER_DATA_DIR="$(pwd)/test-env/share/jupyter" \
    test-env/bin/python -m pytest -W ignore::DeprecationWarning
}

package() {
  cd "$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pyname-$pkgver"*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # By default, extension configuration is placed in /usr/etc.
  # Move to the standard /etc.
  mv "$pkgdir/usr/etc" "$pkgdir"
}
