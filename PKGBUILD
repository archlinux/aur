# Maintainer: Matthew Alexander <archlinux.org@mattalxndr.me>
_pyname=pyedid
pkgname=python-${_pyname}
pkgver=1.0.3
pkgrel=1
pkgdesc="Library to parse extended display identification data (EDID)"
arch=(any)
url="https://github.com/dd4e/pyedid"
license=(MIT)
depends=(python python-requests)
makedepends=(git python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=(
  "${_pyname}-${pkgver}.tar.gz::https://github.com/dd4e/pyedid/archive/refs/tags/v${pkgver}.tar.gz"
  disable-network-tests.patch
)
sha512sums=(
  680c3e614508995f2872ed6a4054bd7ae8b79276b4b8b3c70ec6ef66d56168d8972b15e9885a62779e0cdb5c41a1ba52cc508d6f5a96aa38285dbcb529166895
  8fd8bca8041fd41af617a826f98bbbd52fcd8251ed67176599073579e0c27dbf3be400ee4c238b44cd238ecb15f1cb24984dd3b50fdfec31aed26ee83fd6ae6a
)

prepare() {
  cd "${_pyname}-${pkgver}"
  patch -Np1 -i ../disable-network-tests.patch
}

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pyname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
