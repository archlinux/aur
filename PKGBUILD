# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pypyr
pkgver=5.5.0
pkgrel=1
pkgdesc='Task runner for automation pipelines'
arch=('any')
url='https://pypyr.io'
license=('Apache')
depends=(
  'python'
  'python-dateutil'
  'python-ruamel-yaml'
  'python-tomli'
  'python-tomli-w'
)
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pyfakefs')
_commit='05c501132c25a6c4c3e6fe0798e93118b136efbd'
source=("$pkgname::git+https://github.com/pypyr/pypyr.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python setup.py build
}

check() {
  cd "$pkgname"

  pytest --deselect tests/unit/pypyr/steps/fileformattoml_test.py::test_fileformattoml_with_encoding
}

package() {
  cd "$pkgname"

  python setup.py install --root="$pkgdir" --optimize=1

  # delete tests folder
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir/$site_packages/tests"
}
