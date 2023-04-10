# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-black
pkgver=0.3.12
_commit=1d0d34a44004252ce73368ac3bf34354c06a5131
pkgrel=9
pkgdesc="A pytest plugin to enable format checking with black"
arch=('any')
license=('MIT')
url="https://github.com/shopkeep/pytest-black/"
depends=('python-black' 'python-pytest' 'python-toml')
makedepends=('git' 'python-setuptools-scm')
source=("git+https://github.com/shopkeep/pytest-black.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd pytest-black
  # pytest 6
  git cherry-pick -n edcbcae7d55a992e785c7fc001f9d3880b197ea2
}

build() {
  cd pytest-black
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-black
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH:$PWD/tests" py.test
}

package() {
  cd pytest-black
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
