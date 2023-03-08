# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=nh3
pkgname=python-nh3
pkgver=0.2.8
pkgrel=1
pkgdesc="Ammonia HTML sanitizer Python binding"
arch=('x86_64')
url="https://pypi.org/project/nh3/"
license=('MIT')
depends=('python')
checkdepends=('python-pytest')
makedepends=('python-installer' 'maturin')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('83814e5725f22eccc7f601b58846a7860d2490455777ad107fdc4b7127218920')

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
