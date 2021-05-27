# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-semantic-release
pkgver=7.15.5
pkgrel=1
pkgdesc="Automatic semantic versioning for Python projects"
arch=('any')
url="https://github.com/relekang/python-semantic-release"
license=('MIT')
depends=(
  'python-click'
  'python-click-log'
  'python-gitpython'
  'python-invoke'
  'python-semver'
  'twine'
  'python-requests'
  'python-wheel'
  'python-gitlab'
  'python-tomlkit'
  'python-dotty-dict'
)
makedepends=('python-setuptools')
checkdepends=(
  'python-pytest-runner'
  'python-mock'
  'python-pytest-mock'
  'python-responses'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('a2592fd5abfd0d28938b65c178fd9165b464ca8ce8d857216d5f66368d080fdbe6b49306f6f0e8a7bcd519cd0f2fc2f653714c26580a5186fcaf80e9358dd872')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  pytest --ignore=tests/test_cli.py --ignore=tests/test_vcs_helpers.py .
}

package() {
  cd "$pkgname-$pkgver"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # remove unncessary tests directory
  rm -rf "$pkgdir$site_packages/tests"
}
