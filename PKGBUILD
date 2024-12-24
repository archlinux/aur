# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: DanManN <dnahimov@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>

pkgname=python-srsly-git
_origpkgname=srsly
pkgver=2.5.0.r0.gcaf313b
pkgrel=2
pkgdesc="Modern high-performance serialization utilities for Python"
arch=("x86_64")
url="https://github.com/explosion/srsly"
license=("MIT")
depends=('cython' 'python-numpy' 'python-pytz' 'python-catalogue' 'python-psutil')
checkdepends=('python-pytest' 'python-mock' 'python-pytest-timeout')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('python-srsly')
conflicts=('python-srsly')
source=("git+https://github.com/explosion/$_origpkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_origpkgname"
  git describe --long --tags --abbrev=7 | sed 's/^release-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_origpkgname"
  git -C "${srcdir}/${_origpkgname}" clean -dfx
}

build() {
  cd "${_origpkgname}"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$_origpkgname"
#  python -m installer -d tmp_install dist/*.whl
#  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest -v --pyargs srsly -Werror
#}

package() {
  cd "$_origpkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
