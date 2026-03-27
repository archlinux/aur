# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-gguf-git
_pkgname=gguf
pkgver=b8118.r1.ba3b9c8844
pkgrel=1
pkgdesc="for writing binary files in the GGUF (GGML Universal File) format."
arch=('x86_64')
url='https://ggml.ai/'
license=(MIT)
depends=(python python-sentencepiece)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
  python-poetry
  git)
optdepends=(
  'python-numpy: for numerical operations'
  'python-tqdm: for progress bars'
  'python-mkl: for convert_hf_to_gguf.py')
provides=('python-gguf')
conflicts=('python-gguf')

# Source from llama.cpp repository's gguf-py directory
source=("${pkgname}::git+https://github.com/ggml-org/llama.cpp.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}" || exit
  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
  cd "$pkgname/gguf-py"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname/gguf-py"
  # Tests may require additional setup
  # python -m pytest -s -v tests
}

package() {
  cd "$pkgname/gguf-py"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
