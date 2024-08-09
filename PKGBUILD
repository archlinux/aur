# Maintainer: piernov <piernov@piernov.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-common
_pkgname=devpi_common
pkgver=4.0.4
pkgrel=1
pkgdesc="Utilities jointly used by devpi-server and devpi-client"
arch=('any')
url="https://github.com/devpi/devpi"
license=('MIT')
groups=('devpi')
depends=('python-lazy' 'python-py' 'python-requests' 'python-packaging-legacy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-changelog-shortener')
checkdepends=('python-pytest')
changelog=CHANGELOG
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('235a0a9a45c96e54c60ba6ba2f77d856cf90f1a69c1bee949887e9edc03a41cc')

prepare() {
  cd "$_pkgname-$pkgver"
}

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  PYTHONPATH=./ pytest -x -c /dev/null
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dv "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "$_site/${pkgname/-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
