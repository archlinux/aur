# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-cadquery-git
pkgver=2.0.1.r184.gec9cd46
pkgrel=1
pkgdesc="A parametric CAD scripting framework based on PythonOCC built from git"
arch=(x86_64)
url="https://github.com/CadQuery/cadquery"
license=('Apache')
provides=(python-cadquery)
conflicts=(python-cadquery)
depends=(
python
python-ocp
python-ezdxf
)
checkdepends=(
python-pytest
python-pytest-cov
python-typing_extensions
ipython
)

source=("git+https://github.com/CadQuery/cadquery.git")
md5sums=('SKIP')

pkgver() {
  cd cadquery
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd cadquery
  
  # drop text() entirely since it appears to be broken in ocp with the latest version of opencascade
  curl https://github.com/greyltc/cadquery/commit/48bab8ad9e176590f67980a263262b4c6b0b3198.patch | patch -p1

  # loosen volume check restrictions
  curl https://github.com/greyltc/cadquery/commit/3fdf585e640bbee0e41cfd1c3ba817e28e132937.patch | patch -p1
  curl https://github.com/greyltc/cadquery/commit/a0ecf8ec23003859654087ba16343621aaecb8f3.patch | patch -p1
}

build() {
  cd cadquery
  python setup.py build
}

check() {
  cd cadquery
  pytest -v --cov
}

package() {
  cd cadquery
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # don't package test dir
  _i_dir="${pkgdir}/$(python -c 'import sys; print(sys.path[-1])')"
  rm -rf "${_i_dir}/tests"
}

