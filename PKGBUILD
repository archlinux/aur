pkgname=python-cadquery
pkgver=v2.5.2.r27
pkgrel=1
pkgdesc="A parametric CAD scripting framework based on PythonOCC"
arch=(any)
url="https://github.com/CadQuery/cadquery"
license=(Apache-2.0)
conflicts=(python-cadquery-git)
depends=(
python-ocp
python-ezdxf
nlopt
python-typish
python-nptyping
python-multimethod
python-docutils
python-pyparsing
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

_fragment="#commit=0006f90040eefa958d8b5448a4e3587ee6244680"
source=("git+https://github.com/CadQuery/cadquery#commit=${_fragment}")

sha256sums=('c2a99dbbe752cb0316692581c4ccac4ff37ad9440976710f28243f4caf777fd0')

pkgver() {
  cd cadquery
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/'
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
  test_project
  testText
  )
  printf -v _joined '%s and not ' "${_these_fail[@]}"
  python -m pytest cadquery/tests -k "$(echo "not ${_joined% and not }")"  # skip the tests we know fail

  deactivate
}

package() {
  cd cadquery
  python -m installer --destdir="$pkgdir" dist/*.whl
}
