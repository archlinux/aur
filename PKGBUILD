# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-option-group
pkgname=python-click-option-group
pkgver=0.5.5
pkgrel=1
pkgdesc="Option groups missing in Click"
arch=(any)
url="https://github.com/click-contrib/click-option-group"
license=(BSD)
depends=(python-click)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('685cd80e6b18456084ff139b91e06b003275eff4f973fd42b311a53f098655f06258cbb4ccf5a16a3dab6794a45b8f5abaeffcc515fb5214f178b30746113feb')
b2sums=('2f0db2d5083a6b6459ca30cf90ba8446f4e1783c2bc01239fe9554204880a8545f03f224a287f08804cfda674a39f15192792ffdf836da6ee699134457281e85')

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
