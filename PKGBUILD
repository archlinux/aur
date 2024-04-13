# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>

pkgname=python-libeconf
_pkgname=${pkgname#python-}
pkgver=0.6.3
pkgrel=1
pkgdesc='Python bindings for libeconf'
url="https://github.com/openSUSE/$_pkgname"
arch=('any')
license=('MIT')
depends=('python')
makedepends=(
  # Python build system
  'python-build' 'python-installer' 'python-wheel'
  # Upstream build system
  'python-setuptools'
)
checkdepends=('python-pytest' "$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ed3821344b04474f5f4cd6de629d0910bf0a3df906680397bcec88c43814b1b8eef4d95c67a60272279762cb1b66ae4e1d2e75940763f2c53ef8ca835baad381')

_srcdir=$_pkgname-$pkgver/bindings/python3

build() {
  cd $_srcdir
  python -m build --wheel --no-isolation
}

check() {
  cd $_srcdir
  PYTHONPATH="$_srcdir:$PYTHONPATH" pytest
}

package() {
  # libeconf is not needed for building, but is needed to run/use it
  depends+=("$_pkgname")

  pushd $_srcdir
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 docs/python-libeconf.3 "$pkgdir"/usr/share/man/man3/python-libeconf.3
  popd

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.md TODO.md NEWS
}
