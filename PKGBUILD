# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jonian Guveli <https://github.com/jonian/>
pkgname=python-gtts
_name=gTTS
pkgver=2.5.3
pkgrel=1
pkgdesc="Python library and CLI tool to interface with Google Translate's text-to-speech API"
arch=('any')
url="https://github.com/pndurette/gTTS"
license=('MIT')
depends=(
  'python-click'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest-cov'
  'python-testfixtures'
)
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "https://github.com/pndurette/gTTS/pull/483.patch")
sha256sums=('eb80495db5b1e0537ca8d74a58b8be2c72ab28e3a245856d532b651339d11446'
            '5ed566083c5efa8d69afc602063686e801176c33df16d65d3c93c22a2fc765c8')

prepare() {
  cd "$_name-$pkgver"

  # test: fix/simplify --all cli test to work with new languages codes
  patch -Np1 -i ../483.patch
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  # Remove installed tests
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "${pkgdir}${site_packages}"/gtts/{tests,tokenizer/tests}/
}
