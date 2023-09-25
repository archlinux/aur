# Maintainer: Matt Armand <marmand68 at gmail dot com>

pkgname=socranop
pkgver=0.4.92a5
pkgrel=2
pkgdesc="Soundcraft Notepad mixer tools for Linux"
arch=('any')
url="https://github.com/socratools/socranop"
license=('MIT')
depends=('python>=3.6' python-pydbus python-pyusb python-setuptools python-gobject gobject-introspection-runtime gtk3 libgudev)
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)
install=socranop.install
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('53928857e15fd49fd6d3fa25c748e969f3449d67fc6a58035949b04e7d0e5be8')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -m pytest
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
