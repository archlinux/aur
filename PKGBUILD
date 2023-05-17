# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=nh3
pkgname=python-nh3
pkgver=0.2.11
pkgrel=1
pkgdesc="Ammonia HTML sanitizer Python binding"
arch=('x86_64')
url="https://pypi.org/project/nh3/"
license=('MIT')
depends=('python')
checkdepends=('python-pytest')
makedepends=('python-installer' 'maturin' 'rust')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('3ed2624ca0a1cec3128e8f915e9954dbf6d0e71e76b29813c699fb2d46d01b8f')

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir=test_dir target/wheels/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

build() {
  cd ${_pkgname}-${pkgver}
  maturin build --release --strip 
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="${pkgdir}" target/wheels/*.whl
}
