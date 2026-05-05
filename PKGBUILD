pkgname=python-ocp-tessellate
_build_fragment="tag=v3.2.2"
pkgver=3.2.2
pkgrel=1
pkgdesc="Tessellate OCP objects to use with threejs"
arch=(any)
url="https://github.com/bernhard-42/ocp-tessellate"
license=(Apache-2.0)
depends=(
python-imagesize
python-numpy
python-ocp
python-cachetools
python-webcolors
)
checkdepends=(
python-pytest
python-build123d
python-cadquery
)
makedepends=(
git
python-setuptools-scm
python-build
python-installer
python-wheel
)
optdepends=(
"python-build123d: for build123d support"
"python-cadquery: for cadquery support"
"python-ocp-addons: for native tessellation"
)

source=("git+https://github.com/bernhard-42/ocp-tessellate#commit=${_build_fragment}")

b2sums=('bb646dc5ee890981f5d44cb62ebdeb55ff714085daa845ef53d6b9177378108c89feea61d899fc4f653956874ac2a15b3fd4ad57f15cc04fd57d419e1374e846')

pkgver() {
  cd ocp-tessellate
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/;s/^v//'
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
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "${pkgdir}/${site_packages}/tests"
  rm -r "${pkgdir}/${site_packages}/examples"
}
