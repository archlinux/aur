# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jinja2-time
pkgname=python-jinja-time
pkgver=0.2.0
pkgrel=9
pkgdesc="Jinja2 Extension for Dates and Times"
arch=(any)
url="https://github.com/hackebrot/jinja2-time"
license=(MIT)
depends=(python-arrow python-jinja)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-freezegun python-pytest)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
  $pkgname-0.2.0-arrow_shift.patch
)
sha512sums=('8ac4686312cde689f7a431001833d5d477030c4f5e9470d949bd07a40fcb9521f6ddcde37a72468093121ff9451e352a0bb43d20a796d7a204cf94e8a7545f2c'
            '0286a608702bb445cf29da7900ec04f5b1f64d1e9658b84f9a90018adf5fce5cc959832abff73fa017afcaf0a0f6be85060e52a79038bf770b8b37d8c96a5e7d')
b2sums=('370318000b1c91bc3460861d389da667f6d7e840c4f9d9d1661491c9bf1b422b8ecff12d1da2467e7a9596d12832790e314c3298672d70b38b92a53198df0156'
        '7285125450d338d4e4c927761b5eb93778f51bd5b260fcdf1ac720006d61faaee2b928a869337cd6f9e7905140810ebe6047fd3c954501c86e1185f85f1517d3')

prepare() {
  # fix the way python-arrow is used: https://github.com/hackebrot/jinja2-time/issues/15
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-0.2.0-arrow_shift.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CONTRIBUTING,CONTRIBUTORS,HISTORY,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
