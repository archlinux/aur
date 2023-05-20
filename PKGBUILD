# Maintainer: Sergey Safonov <spoof-arch@spoofa.info>

pkgname=python-lzallright
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="Python bindings for the LZ library (LZO data compression algorithm)"
arch=('x86_64' 'aarch64')
url="https://pypi.org/project/lzallright"
license=('MIT')
depends=('python>=3.8')
makedepends=(python-{build,installer,wheel} 'python-maturin>=0.14' 'python-maturin<0.15')
checkdepends=('python-pytest>=7')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0de7e0fe110650a79c1e1fca10a188da5b6fc6b2f3730c69dc411782e3b4923a')
build() {
  cd "$_name-$pkgver"
  python -m build --wheel
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

check()  {
  cd "$_name-$pkgver"
  local tmp=$(mktemp -d)
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  python -m installer --destdir="$tmp" dist/lzallright-$pkgver-*-abi3-linux_$CARCH.whl
  PYTHONPATH="$tmp$site_packages" python -m pytest tests

  rmdir --ignore-fail-on-non-empty $tmp 
}
