# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=waybackpy
pkgver=3.0.6
pkgrel=1
pkgdesc='CLI tool that interfaces with the Internet Archives Wayback Machine API'
arch=('any')
url='https://github.com/akamhy/waybackpy'
license=('MIT')
depends=('python-click' 'python-requests' 'python-urllib3')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('python-waybackpy')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/w/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('497a371756aba7644eb7ada0ebd4edb15cb8c53bc134cc973bf023a12caff83f')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s/find:/$pkgname/" setup.cfg
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  export PYTHONHASHSEED=0
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$_site/$pkgname-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
