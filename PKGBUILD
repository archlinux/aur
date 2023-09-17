# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-tiktoken
_name=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc="A fast BPE tokeniser for use with OpenAI's models"
arch=(x86_64)
url="https://github.com/openai/tiktoken"
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
  python-regex
  python-requests
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-rust
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-pytest
)
optdepends=(
  'python-blobfile: for reading blobfiles'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ccb01d22e0f9b2385b7dfece3f9ff67b9ad9642f9c7c4728ba6e26c08df66f6f')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -r tiktoken tiktoken.egg-info tiktoken_ext
  local python_version
  python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="build/lib.linux-$CARCH-cpython-$python_version" python -m pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
