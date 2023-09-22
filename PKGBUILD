# Maintainer: piernov <piernov@piernov.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-common
pkgver=3.7.2
pkgrel=1
pkgdesc="Utilities jointly used by devpi-server and devpi-client"
arch=('any')
url="https://github.com/devpi/devpi"
license=('MIT')
groups=('devpi')
depends=('python-lazy' 'python-py' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/d/devpi-common/devpi-common-$pkgver.tar.gz"
        "2aba62c961653aa82181b201995ecbdcb63ce639.patch")
sha256sums=('9078989279ad79e9c181c7badc4a738460445187101eb0cbade675934d5e4644'
            'f722975b8b9b025238d2fb84b6fd89c7a61d785b54ebc9e4f7a973a5ad12b2d5')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p2 < "${srcdir}/2aba62c961653aa82181b201995ecbdcb63ce639.patch"
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
