# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gökçe Aydos <aur2022_aydos_de>
_base=nbgrader
pkgname=jupyter-${_base}-git
pkgver=0.9.3.r2.gef441809
pkgrel=1
pkgdesc="A system for assigning and grading notebooks"
arch=(any)
url=https://github.com/jupyter/${_base}
license=(BSD-3-Clause)
depends=(python-alembic
  python-jinja
  python-jsonschema
  python-jupyter_client
  jupyter-server
  jupyterlab
  python-jupyterlab-server
  jupyter-nbclient
  jupyter-nbconvert
  jupyter-notebook
  python-dateutil
  python-rapidfuzz
  python-requests
  python-sqlalchemy
  python-pyaml)
# Additional optional deps from jsonschema probably due to https://github.com/jupyter/jupyter_events/blob/9b99f6718a3bb2686aab51e17f5c7ee276baf316/pyproject.toml#L31C4-L33C112
# python-fqdn python-rfc3986-validator python-rfc3339-validator python-webcolors python-uri-template python-jsonpointer python-isoduration
makedepends=(python-build python-installer python-hatch-jupyter-builder python-wheel npm git)
source=(git+${url}.git)
sha512sums=('SKIP')
provides=(jupyter-${_base})
conflicts=(jupyter-${_base})

pkgver() {
  cd ${_base}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"/usr/etc "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
