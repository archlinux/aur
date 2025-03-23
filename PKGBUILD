# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-electrum_aionostr
_pkgname=electrum-aionostr
pkgver=0.0.9
pkgrel=2
pkgdesc="asyncio nostr client. This is a fork of aionostr that does not require Coincurve."
arch=('any')
depends=(python python-electrum_ecc python-aiohttp python-aiorpcx python-cryptography python-aiohttp-socks python-click)
makedepends=(python-setuptools python-build python-installer python-wheel)
url="https://github.com/spesmilo/electrum-aionostr"
license=('BSD')
options=('!emptydirs')
source=("git+https://github.com/spesmilo/electrum-aionostr.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  _tag=$(git tag --list --sort=taggerdate | tail -n1 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
  printf $_tag;
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^.\{5\}//'
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
