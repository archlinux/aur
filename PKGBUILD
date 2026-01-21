pkgname=python-ocp_tessellate
_build_hash=9c2b65b8cf7d69d298149b2ce1802f5a0e2703c4
pkgver=3.1.1
pkgrel=1
pkgdesc="Tessellate OCP objects to use with threejs"
arch=(x86_64)
url="https://github.com/bernhard-42/ocp-tessellate"
license=(Apache-2.0)
depends=(
python-webcolors
python-numpy
python-cachetools
)
checkdepends=(
python-pytest
python-build123d
)
makedepends=(
git
python-setuptools-scm
python-build
python-installer
python-wheel
)

source=("git+https://github.com/bernhard-42/ocp-tessellate#commit=${_build_hash}")

sha256sums=('c96d3389e19ea1698e67d10695c9dcd0ea66999aeb8b0c7e8cf34c624225e44f')

pkgver() {
  cd ocp-tessellate
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/' | sed 's/^v//'
}

prepare() {
  cd ocp-tessellate
}

build() {
  cd ocp-tessellate
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --without-pip --system-site-packages --clear venv
  source venv/bin/activate
  cd ocp-tessellate
  python -m installer dist/*.whl

  python -m pytest tests

  deactivate
}

package() {
  cd ocp-tessellate
  python -m installer --destdir="$pkgdir" dist/*.whl
}
