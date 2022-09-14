# Maintainer: peeweep <peeweep at 0x0 dot ee>
# Contributor: Alexander Bruegmann <mail at abruegmann dot eu>

pkgname=sigma
_pkg=sigmatools
pkgver=0.22.1
pkgrel=1
pkgdesc="Generic Signature Format for SIEM Systems"
arch=('any')
url="https://github.com/sigmahq/sigma"
license=('LGPL3')
depends=(
  'python>=3.8'
  'python-progressbar'
  'python-pymisp'
  'python-ruamel-yaml'
  'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('17c6b5c46eedd651cf32abcea71e4851905e6cd7595c626342a9c5734f69ca71')

prepare() {
  ## we'll install the data files ourselves
  cd "$_pkg-$pkgver"
  sed -i '50,52d' setup.py
}

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkg-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 config/*.yml -t "$pkgdir/etc/sigma/"
  cp -a --no-preserve=ownership config/generic "$pkgdir/etc/sigma"
}

# vim: ts=2 sw=2 et:
