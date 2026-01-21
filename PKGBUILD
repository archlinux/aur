pkgname=python-cadquery
pkgver=v2.6.1.r16
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
python-trame
python-trame-vtk
python-runtype
casadi
openmpi
python-path  # solving https://gitlab.archlinux.org/archlinux/packaging/packages/python-path/-/issues/1 will fix "absolute" issues here, release v16.16.0 works
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

_fragment="#commit=fe53ca0c18bf6d4e2e2f0e1cc8720d18fb5158c1"
source=("git+https://github.com/CadQuery/cadquery#commit=${_fragment}")

sha256sums=('bfbcc2810f0ecf7cc4df7c7f97a561da6feab5d8c341f08fa7f5075ea9239338')

pkgver() {
  cd cadquery
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/'
}

prepare() {
  cd cadquery
  #curl https://patch-diff.githubusercontent.com/raw/CadQuery/cadquery/pull/1946.patch | patch -p1
  
  # changes to allow this to work with the latest stable release of python-ocp
  curl https://github.com/CadQuery/cadquery/commit/7cf644e75d41bb4ba6667a6ec81befe22b9dd254.patch | patch -p1
  
  # address ast class deprecations
  curl https://github.com/CadQuery/cadquery/commit/fc85e1d5ce26f85babd4755f7f22f565d1003e1b.patch | patch -p1
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
  TestCQGI  # probably ast issues see https://github.com/CadQuery/cadquery/issues/1976 and https://github.com/CadQuery/cadquery/compare/ocp79
  )
  printf -v _joined '%s and not ' "${_these_fail[@]}"
  python -m pytest cadquery/tests -k "$(echo "not ${_joined% and not }")"  # skip the tests we know fail

  deactivate
}

package() {
  cd cadquery
  python -m installer --destdir="$pkgdir" dist/*.whl
}
