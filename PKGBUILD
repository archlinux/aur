# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-fast-mail-parser
_pkgname=fast_mail_parser
pkgver=0.3.0
pkgrel=1
pkgdesc="Fast .eml files parsing for Python"
arch=(x86_64)
url="https://github.com/namecheap/fast_mail_parser"
license=(Apache-2.0)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-maturin
  python-wheel
)
checkdepends=(
  mailparser
  python-pytest
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('776362f8cb499045973fd2a771eb4a19dfed69ec29f6b979347a970cbfecc5e9')

build() {
  cd "$_pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest tests
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
