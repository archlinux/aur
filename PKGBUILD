# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-cramjam
_pkgname=cramjam
pkgver=2.5.0
pkgrel=2
pkgdesc="Thin Python bindings to de/compression algorithms in Rust"
arch=('x86_64')
url="https://github.com/milesgranger/pyrus-cramjam"
license=('MIT')
depends=('python')
checkdepends=('python-hypothesis' 'python-memory-profiler' 'python-pytest')
optdepends=()
makedepends=(python-installer maturin rust)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('a92c0c2db4c6a3804eaffa253c7ca49f849e7a893a31c902a8123d7c36b2b487')

build(){
  cd "$_pkgname-$pkgver"
  maturin build --release --strip --interpreter python
}

package(){
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" target/wheels/*.whl
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_pkgname-$pkgver
  python -m installer --destdir=test_dir target/wheels/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv tests
}

# vim:ts=2:sw=2:et:
