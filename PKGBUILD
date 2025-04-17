# Maintainer:
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>

: ${_commit:=c3f386aa279b130b37a4a4e91e758c7f02ec898c} # 0.9.3.r5

_pkgname="python-retry"
pkgname="$_pkgname"
pkgver=0.9.3
pkgrel=3
pkgdesc="Easy to use retry decorator"
url="https://github.com/invl/retry"
license=('Apache-2.0')
arch=('any')

depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
optdepends=(
  'python-decorator: preserves function signatures'
)

_pkgsrc="retry-$_commit"
source=("$pkgname-$pkgver-${_commit::7}.tar.gz"::"$url/archive/$_commit.tar.gz")
sha256sums=('855a6bb05942ff94eb5f0240ff7ad2aef7db5bd0749c352d1dcbc9f5c0c8675e')

prepare() {
  install -Dm644 /dev/stdin "$_pkgsrc/setup.py" << END
from setuptools import find_packages, setup
setup(packages=find_packages(exclude=('tests')))
END
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgsrc"
  PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
