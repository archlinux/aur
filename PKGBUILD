# Maintainer: piernov <piernov@piernov.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-common
pkgver=4.1.0
pkgrel=1
pkgdesc="Utilities jointly used by devpi-server and devpi-client"
arch=('any')
url="https://github.com/devpi/devpi"
license=('MIT')
groups=('devpi')
depends=('python-lazy' 'python-packaging-legacy' 'python-requests' )
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-changelog-shortener')
checkdepends=('python-pytest')
changelog=CHANGELOG
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('58d7f761e3fe7fdfe449c4a6a9e2350d4ddfbeb66cb0f6d208025142943030d3')

prepare() {
  cd "$pkgname-$pkgver"
}

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
  python -m installer --destdir="$pkgdir" dist/*.whl
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dv "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "$_site/${pkgname/-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
