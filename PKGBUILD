# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>

pkgname=python-libeconf
_pkgname=${pkgname#python-}
pkgver=0.7.1
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
b2sums=('7f82a3ee62015d838b427718f9c2e8008934f5e077432a7f6402c8fb1aaf1f981580ffef22905c2a44a843d0df60c5cdb089c6d494f016778228fb8be68db2d6')

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
