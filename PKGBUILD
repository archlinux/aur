# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-semantic-release
pkgver=7.16.1
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
b2sums=('6294910f900ce18b571748779f8cf976af6dcb7ad1e51243082161676f6b1c5fa5f9f5be8a523dfdea14cc72d62b388bf645d7c25ca27b516e6ba07e479ae529')

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
