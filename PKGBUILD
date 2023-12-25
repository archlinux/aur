# Maintainer: Sergey Safonov <spoof-arch@spoofa.info>

pkgname=python-lzallright
_name=${pkgname#python-}
pkgver=0.2.4
pkgrel=2
pkgdesc="Python bindings for the LZ library (LZO data compression algorithm)"
arch=('x86_64' 'aarch64')
url="https://github.com/vlaci/lzallright"
license=('MIT')
depends=('python>=3.8')
makedepends=(python-{build,installer,wheel} rust rustup)
checkdepends=('python-pytest>=7')
source=("https://github.com/vlaci/lzallright/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b91b1e140ffe4d03b40c6752a78304164a72146a0ed3c4a5df1c6f875e4b329e')
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
