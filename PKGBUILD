pkgname=python-cadquery
_cq_fragment="tag=v2.8.0"
pkgver=2.8.0
pkgrel=1
pkgdesc="A parametric CAD scripting framework based on PythonOCC"
arch=(any)
url="https://github.com/CadQuery/cadquery"
license=(Apache-2.0)
depends=(
python-ocp
python-ezdxf
nlopt
python-typish
python-nptyping
python-numba
python-multimethod
python-docutils
python-pyparsing
python-trame
python-trame-vtk
python-trame-components
python-trame-vuetify
python-runtype
casadi
openmpi
python-path
openblas
libxcursor
)
checkdepends=(
python-pytest
python-typing_extensions
python-docutils
ttf-liberation
)
makedepends=(
git
python-setuptools-scm
python-build
python-installer
python-wheel
)

source=(
"git+https://github.com/CadQuery/cadquery#commit=#${_cq_fragment}"
)

b2sums=('bca9374187a7ac073767cce6788dde141a0b37840fa6c992f08e5357c0f161ee6877aa0615b797a0ed3742716b377c9d0495ceed065a600c2cb69b1cdc0bd298')

pkgver() {
  cd cadquery
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/' | sed 's/^v//'
}

prepare() {
  cd cadquery
}

build() {
  cd cadquery
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --without-pip --system-site-packages --clear venv
  source venv/bin/activate
  python -m installer cadquery/dist/*.whl

  local _these_fail=(
  test_nurbs # mumps issues, TODO
  )
  printf -v _joined '%s and not ' "${_these_fail[@]}"
  python -m pytest cadquery/tests -k "$(echo "not ${_joined% and not }")"  # skip the tests we know fail

  deactivate
}

package() {
  cd cadquery
  python -m installer --destdir="$pkgdir" dist/*.whl
}
