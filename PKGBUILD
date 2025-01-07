# Maintainer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>
pkgname=python-asyncclick
_name=${pkgname#python-}
pkgver=8.1.8
_tagname=$pkgver
pkgrel=2
pkgdesc="Composable command line interface toolkit, async version"
arch=(any)
url="https://github.com/python-trio/asyncclick"
license=('BSD')
depends=(python python-anyio)
makedepends=(git python-build python-flit-core python-installer python-wheel)
checkdepends=(python-pytest python-trio)
optdepends=('python-trio: Alternative async event loop'
            'python-curio: Alternative async event loop')
options=(!strip)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$_tagname.tar.gz")
sha256sums=('0f0eb0f280e04919d67cf71b9fcdfb4db2d9ff7203669c40284485c149578e4c')

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
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
