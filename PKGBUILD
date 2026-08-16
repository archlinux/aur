# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-gguf-git
_pkgname=gguf
pkgver=b10442.r6.ad1de39e07
pkgrel=1
pkgdesc="GGUF file format library and model conversion tools for llama.cpp"
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
  'python-pytorch: for convert_hf_to_gguf.py and convert_lora_to_gguf.py'
  'python-huggingface-hub: for --remote flag in convert_hf_to_gguf.py')
provides=('python-gguf')
conflicts=('python-gguf')

# Source from llama.cpp repository's gguf-py directory
source=("${pkgname}::git+https://github.com/ggml-org/llama.cpp.git")
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

  # Install conversion/ package
  local _pyver
  _pyver="$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
  local _sitelib="/usr/lib/python${_pyver}/site-packages"

  cd ../

  install -Dm644 "conversion/__init__.py" "$pkgdir${_sitelib}/conversion/__init__.py"
  install -m644 "conversion"/*.py "$pkgdir${_sitelib}/conversion/"

  # Install conversion scripts
  install -Dm755 "convert_hf_to_gguf.py" "$pkgdir/usr/bin/convert_hf_to_gguf.py"
  install -Dm755 "convert_hf_to_gguf_update.py" "$pkgdir/usr/bin/convert_hf_to_gguf_update.py"
  install -Dm755 "convert_lora_to_gguf.py" "$pkgdir/usr/bin/convert_lora_to_gguf.py"
}
# vim:set ts=2 sw=2 et:
