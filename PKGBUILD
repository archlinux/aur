#!/bin/bash
pkgname=python-commitizen
pkgver=2.17.4
pkgrel=0
pkgdesc="Create committing rules for projects, auto bump versions, and auto changelog generation"
arch=('any')
url="https://github.com/commitizen-tools/commitizen"
license=('MIT')
makedepends=(
  'python-setuptools'
  'python-dephell'
)
checkdepends=(
  'python-pytest'
  'python-pytest-mock'
)
depends=(
  'python-questionary'
  # 'python-decli'
  'python-colorama'
  'python-termcolor'
  'python-packaging'
  'python-tomlkit'
  'python-jinja'
  'python-pyaml'
  'python-argcomplete'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6cf0fbf9378bf4d247084ad156ec054ce004c72dfd621b93e9871ef957e78dad')

_pkgname="${pkgname/python-/}"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  dephell deps convert --from pyproject.toml --to setup.py
  # Skip test that checks the root folder of the repo but as we download the tar ball
  # it would detect aur as its root
  sed -i'' 's/test_find_git_project_root/skip_find_git_project_root/' tests/test_conf.py
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  py.test -vvv tests/
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
