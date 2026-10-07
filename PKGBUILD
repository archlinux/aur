# Maintainer: Sergey Safonov <spoof-arch@spoofa.info>

pkgname=python-lzallright
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc="Python bindings for the LZ library (LZO data compression algorithm)"
arch=('x86_64' 'aarch64')
url="https://github.com/vlaci/lzallright"
license=('MIT')
depends=('python>=3.11')
makedepends=(python-{build,installer,wheel} rust)
checkdepends=('python-pytest>=9')
source=("https://github.com/vlaci/lzallright/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52a5a645ab4657348f784809c952a1deb0087025fa534d35783c6be5e4cac2ba')
options=(!lto)

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
