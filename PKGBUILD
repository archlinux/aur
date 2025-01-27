# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy dot co dot uk>
# Contributor: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>
pkgbase=python-lsp-mypy
pkgname=(python-pylsp-mypy)
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="Static type checking for python-lsp-server with mypy"
arch=(any)
url="https://github.com/python-lsp/pylsp-mypy"
license=('MIT')
depends=(python python-lsp-server mypy python-toml)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
options=(!strip)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('adeb3de24408f0c91d1d2a3e84ac6dc6084f64cfc1ea1b455dc1e101f8ab87f3')

build() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  if ! PYTHONPATH="$PWD" pytest
  then
    if [[ $PWD != /build/* ]]
    then
      echo
      echo "=> Looks like this isn't a clean chroot, ignoring failing unit tests."
      echo "   See https://github.com/python-lsp/pylsp-mypy/issues/59"
    else
      return 1
    fi
  fi
}

package_python-pylsp-mypy() {
  conflicts=(python-lsp-mypy)
  provides=(python-lsp-mypy)
  replaces=(python-lsp-mypy)

  cd "$_name-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
