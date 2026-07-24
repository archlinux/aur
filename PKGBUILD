# Maintainer: a821 at mail de
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-scramp
pkgver=1.4.13
_commit=b0881e39078630c57ed11fa8b14eb8af08dbc7c0
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
checkdepends=(python-pytest python-pytest-mock python-passlib)
source=("git+$url.git?signed#commit=$_commit")
sha256sums=('30511c5ff7cb3797fa5752e5bff32f74a250d651d9a392984f68e2fe24992b92')
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
