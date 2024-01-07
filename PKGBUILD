# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-interegular
_name=${pkgname#python-}
pkgver=0.3.3
pkgrel=1
pkgdesc="Allows to check regexes for overlaps"
arch=(any)
url="https://github.com/MegaIng/interegular"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)

_commit=e0ab881c2b4b5227b0934b243f2337e701fae008
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('5fc808d519ea8c04cdb0ce368fdff49dcd18685d7c87b42ca54e6471dabbe491')

_archive="$_name-$_commit"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl

  export PYTHONPATH="$PWD/tmp_install/$_site_packages:$PYTHONPATH"
  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
