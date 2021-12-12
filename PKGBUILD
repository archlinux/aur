# Maintainer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>
pkgname=python-poetry-dynamic-versioning
_name=${pkgname#python-}
pkgver=0.13.1
pkgrel=3
pkgdesc="Plugin for Poetry to enable dynamic versioning based on VCS tags"
arch=(any)
url="https://github.com/mtkennerly/poetry-dynamic-versioning"
license=('MIT')
depends=(python python-dunamai python-jinja python-poetry python-tomlkit)
makedepends=(git python-pip python-poetry)
checkdepends=(python-pytest python-pytest-cov)
options=(!strip)
# The tests require a VCS checkout.
source=("$_name::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

check() {
  cd "$_name"
  PYTHONPATH="$PWD" pytest
}

package() {
  cd "$_name"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PIP_CONFIG_FILE=/dev/null pip install --ignore-installed --isolated --no-deps --no-warn-script-location --root="$pkgdir" .
  PYTHONHASHSEED=0 python -O -m compileall -o0 -o1 "$pkgdir"/usr/lib/python*/site-packages/${_name//-/_}
}
