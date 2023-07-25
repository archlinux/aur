# Maintainer: Sergey Safonov <spoof-arch@spoofa.info>

pkgname=python-lzallright
_name=${pkgname#python-}
pkgver=0.2.3
pkgrel=1
pkgdesc="Python bindings for the LZ library (LZO data compression algorithm)"
arch=('x86_64' 'aarch64')
url="https://github.com/vlaci/lzallright"
license=('MIT')
depends=('python>=3.8')
makedepends=(python-{build,installer,wheel} 'maturin>=0.15' 'maturin<2.0')
checkdepends=('python-pytest>=7')
source=("https://github.com/vlaci/lzallright/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c06e026d182fa0cda423b4bdb04e6a8ec1682ee213b6443c3b07a212e2b10ef7')
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
