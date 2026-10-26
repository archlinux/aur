# Maintainer: a821 at mail de
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-scramp
pkgver=1.5.0
_commit=58a281a2b0570834a39e78dcc9d52aa8245c0aea
pkgrel=1
pkgdesc="Python implementation of the SCRAM protocol"
arch=(any)
url='https://codeberg.org/tlocke/scramp'
license=('MIT-0')
depends=(python python-asn1crypto)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-setuptools
  python-versioningit
  python-wheel
)
checkdepends=(python-pytest python-pytest-mock)
source=("git+$url.git?signed#commit=$_commit")
sha256sums=('fda81cbeb1ca565178d89e078ef7c1d685ce39ff77db6f7b424b8a9d53363e45')
validpgpkeys=(
  'D5681B7EC7292511C4CC1450892B00AB699851E8'  # Tony Locke <tlocke@tlocke.org.uk>, proven by https://keybase.io/tlocke
)

pkgver() {
  git -C scramp describe
}

build() {
  cd scramp
  python -m build --wheel --no-isolation
}

check() {
  cd scramp
  # install to temporary dir
  local _pyver=$(python -c 'import sys; print(*sys.version_info[:2], sep=".")')
  python -m installer --destdir=temp dist/*.whl
  PYTHONPATH=temp/usr/lib/python$_pyver/site-packages pytest
}

package() {
  cd scramp
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
