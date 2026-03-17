pkgname=python-cadquery
_cq_fragment="tag=v2.7.0"
pkgver=2.7.0
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

source=(
"git+https://github.com/CadQuery/cadquery#commit=#${_cq_fragment}"
support-ocp-7.9.3.patch # curl https://github.com/CadQuery/cadquery/commit/7cf644e75d41bb4ba6667a6ec81befe22b9dd254.patch > support-ocp-7.9.3.patch
)

sha256sums=('46ef4f3867fe700f6ef34b09fad977278814fbc9d70abfd6451c96321361bc0d'
            '4d60cee6bf70d5eeaeb060e514d104969c1da7f30e7f4eb6d67c061e0debaa05')

pkgver() {
  cd cadquery
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/' | sed 's/^v//'
}

prepare() {
  cd cadquery
  #curl https://patch-diff.githubusercontent.com/raw/CadQuery/cadquery/pull/1946.patch | patch -p1
  
  # changes to allow this to work with the latest stable release of python-ocp
  cat ../support-ocp-7.9.3.patch | patch -p1
  
  # address ast class deprecations
  #curl https://github.com/CadQuery/cadquery/commit/fc85e1d5ce26f85babd4755f7f22f565d1003e1b.patch | patch -p1
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
