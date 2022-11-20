# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: William J Bowman <bluephoenix47@gmail.com>

pkgname=python38-certifi
pkgver=2022.09.24
pkgrel=1
pkgdesc="Python package for providing Mozilla's CA Bundle (using system CA store)"
arch=(any)
url="https://github.com/certifi/python-certifi"
license=(MPL2)
depends=('python38' 'ca-certificates')
makedepends=(python38-build python38-installer python38-setuptools python38-wheel)
checkdepends=('python38-pytest')
source=(https://github.com/certifi/python-certifi/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('a7b5ffa2cc3de39c8a204ed7da077c63971d4305565d6663292fc6b530fb6bbb9cfc6777b5998c54f8a06506f871063aae02692ec8508f903f716c73852487e4')

prepare() {
  cd python-certifi-$pkgver
  # Use system CA store. Replacing the copy in the source tree so the test suite is actually run against it.
  ln -sf /etc/ssl/certs/ca-certificates.crt certifi/cacert.pem
  # Our CA store has non-ASCII comments, but we are not packaging for JVM
  # https://github.com/certifi/python-certifi/issues/50
  sed -i 's/encoding="ascii"/encoding="utf-8"/' certifi/core.py
}

build() {
  cd python-certifi-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd python-certifi-$pkgver
  pytest
}

package() {
  local site_packages=$(python3.8 -c "import site; print(site.getsitepackages()[0])")

  cd python-certifi-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Replace CA store here again because the symlink was installed as a file
  ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir"/$site_packages/certifi/cacert.pem

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
