# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-connectorx
_pkgname=connector-x
pkgver=0.3.3
pkgrel=1
pkgdesc="Load data from databases into Python"
arch=('x86_64')
url="https://github.com/sfu-db/connector-x"
license=('MIT')
depends=('python')
checkdepends=()
optdepends=()
makedepends=(python-installer maturin patchelf rust)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sfu-db/connector-x/archive/refs/tags/v$pkgver.tar.gz"
  version.patch)
sha256sums=('512ce8b43c738d4f2fef460ef6b0de63f7959571d4d9c943425702d6ca3110f9'
            '8de1f09d24ef5b7ca6f20730be142f324cf5870ee055f377de9d02d4351c4c23')
options=('!lto')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 < ../version.patch
}

build(){
  cd "$_pkgname-$pkgver/connectorx-python"
  maturin build --release --strip --interpreter python
}

package(){
  cd "$_pkgname-$pkgver/connectorx-python"
  python -m installer --destdir="$pkgdir" target/wheels/*.whl
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

#check() {
  #local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  #cd "$_pkgname-$pkgver/connectorx-python"
  #python -m installer --destdir=test_dir target/wheels/*.whl
  #export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  #pytest -vv connectorx/tests
#}

# vim:ts=2:sw=2:et:
