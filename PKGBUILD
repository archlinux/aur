# Maintainer: gilcu3
# Contributor: gilcu3
_pkgname=changelog-chug
pkgname=python-$_pkgname
pkgver=0.0.3
pkgrel=2
pkgdesc='parser for project Change Log documents'
arch=('any')
url='https://git.sr.ht/~bignose/changelog-chug'
license=('AGPL-3.0-or-later')
depends=('python' 'python-semver' 'python-docutils')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-testscenarios' 'python-testtools' 'python-coverage')
source=($pkgname-$pkgver.tar.gz::https://git.sr.ht/~bignose/changelog-chug/archive/release/$pkgver.tar.gz)
sha256sums=('0777bacb46df129120d813ab198419735acb43870cdc32dae181c57e37eafaa7')


build() {
  cd $_pkgname-release/$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-release/$pkgver
  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  python -m unittest discover -v
}

package() {
  cd $_pkgname-release/$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.AGPL-3  "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.AGPL-3
}
