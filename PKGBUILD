# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Anthony Wang <a_at-exozy_dot-me>

pkgname='python-jupyter-server-proxy'
pkgver=4.5.0
pkgrel=1
pkgdesc="Jupyter notebook server extension to proxy web services"
url='https://jupyter-server-proxy.readthedocs.io/'
license=('BSD-3-Clause')
arch=('any')

depends=(
  jupyter-server
  python-aiohttp
  python-simpervisor
  python-tornado
  python-traitlets
)
makedepends=(
  git
  python-build
  python-installer
  python-hatch-jupyter-builder
)
checkdepends=(
  jupyterhub
  jupyter-notebook
  python-pytest
  python-pytest-asyncio
  python-pytest-cov
  python-pytest-html
)

_commit=068b927
source=(
  "git+https://github.com/jupyterhub/jupyter-server-proxy.git?signed#commit=$_commit"
)
sha256sums=(
  '3872047f8fc45d1d2db5e4aa791c8153708597f7793da9c3bbed145d6f08ba19'
)
validpgpkeys=(
  '968479A1AFF927E37D1A566BB5690EEEBB952194'  # GitHub signing key
)

build() {
  cd jupyter-server-proxy
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd jupyter-server-proxy

  # Install wheel into a virtual environment.
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/jupyter_server_proxy-$pkgver"*.whl
  local testsite=$(test-env/bin/python -c "import site; print(site.getsitepackages()[0])")

  # Set the paths so the local installation can be found. Although we run
  # pytest through the venv, any calls it makes to the jupyter command will use
  # /usr/bin/jupyter which sets /usr/bin/python as the interpreter, thus not
  # noticing our installation of the extension.
  export PYTHONPATH="${testsite}" \
         JUPYTER_CONFIG_DIR="$(pwd)/test-env/etc/jupyter" \
         JUPYTER_DATA_DIR="$(pwd)/test-env/share/jupyter"

  test-env/bin/python -m pytest -W ignore::DeprecationWarning
}

package() {
  cd jupyter-server-proxy
  python -m installer --destdir="$pkgdir" "dist/jupyter_server_proxy-$pkgver"*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # By default, extension configuration is placed in /usr/etc.
  # Move to the standard /etc.
  mv "$pkgdir/usr/etc" "$pkgdir"
}
