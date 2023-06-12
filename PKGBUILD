# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-option-group
pkgname=python-click-option-group
pkgver=0.5.6
pkgrel=1
pkgdesc="Option groups missing in Click"
arch=(any)
url="https://github.com/click-contrib/click-option-group"
license=(BSD)
depends=(
  python
  python-click
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('7ac321a0c2dedcacf9b0383cb6b1ae6f7dd0ec6855e4f88cd4817ddece0c2c043c8b10fab04a41aefce38f871075a793bdc7b000f3b99adc7d93a3b6f0cf9884')
b2sums=('8edc9e1c7aff7ff03f86fea41a43a37b9605efb11cae402ebaaa18620b21fd50237d92979f024b319b7de7b244f3168a3557efcc4f754c83e1bc4cd05b578428')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
