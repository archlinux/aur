# Maintainer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>
pkgname=python-asyncclick
_name=${pkgname#python-}
pkgver=8.1.7.2
_tagname=$pkgver
pkgrel=2
pkgdesc="Composable command line interface toolkit, async version"
arch=(any)
url="https://github.com/python-trio/asyncclick"
license=('BSD')
depends=(python python-anyio)
makedepends=(git python-build python-installer python-setuptools python-setuptools-scm python-wheel)
checkdepends=(python-pytest python-trio)
optdepends=('python-trio: Alternative async event loop'
            'python-curio: Alternative async event loop')
options=(!strip)
source=("$_name-$_tagname.tar.gz::$url/archive/refs/tags/$_tagname.tar.gz")
sha256sums=('f5b84b541ec562d20850ea6e4711dbb44dcea1bcffbfa21da55c4460eced02d6')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd "$_name-${_tagname//+/-}"
  PYTHONHASHSEED=0 python -m build --wheel --no-isolation
}

check() {
  cd "$_name-${_tagname//+/-}"
  PYTHONPATH="$PWD/src" pytest || :
}

package() {
  cd "$_name-${_tagname//+/-}"
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
