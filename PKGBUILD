# Maintainer: piernov <piernov@piernov.org>

pkgname=devpi-ldap
pkgver=2.1.1
pkgrel=1
pkgdesc="LDAP authentication for devpi-server"
arch=('any')
url="https://github.com/devpi/devpi-ldap"
license=('MIT')
groups=('devpi')
depends=(
  'devpi-server'
  'python-ldap3'
  'python-pyyaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5213160b0b574132e0feb1989bda6f5b2f015e8e9f476e198324e6a091ba9eb8')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  PYTHONPATH=./ pytest -x -c /dev/null
}

package() {
  cd "$pkgname-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/${pkgname/-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
