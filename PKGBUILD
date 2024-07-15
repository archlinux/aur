# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="aider-chat"
_pkgname="aider"
pkgver=0.43.4
pkgrel=1
pkgdesc="AI pair programming in your terminal"
url="https://github.com/paul-gauthier/aider"
license=("Apache-2.0")
arch=("any")
provides=("aider")
depends=(
  "litellm"
  "python"
  "python-backoff"
  "python-beautifulsoup4"
  "python-configargparse"
  "python-diff-match-patch"
  "python-diskcache"
  "python-dotenv"
  "python-gitpython"
  "python-grep-ast"
  "python-httpx"
  "python-importlib-resources"
  "python-jsonschema"
  "python-networkx"
  "python-numpy"
  "python-packaging"
  "python-pathspec"
  "python-pillow"
  "python-playwright"
  "python-prompt_toolkit"
  "python-pygments"
  "python-pypandoc"
  "python-requests"
  "python-rich"
  "python-streamlit"
  "python-tqdm"
  "python-tree-sitter-languages-bin"
)
makedepends=(
  "git"
  "python-build"
  "python-installer"
  "python-wheel"
)
checkdepends=(
  "python-pytest"
  "python-yaml"
)
optdepends=(
  "python-sounddevice: portaudio support"
  "python-soundfile: portaudio support"
)
source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('77c615cc0d3832a297e973f4d2104a79a1b67b15a8f379c95be8020018f2252722198dec56a7b5f0110f6b8960f2c2da5e4230f7122d74c41969d12cfeb38559')

prepare() {
  cd "$pkgname"

  # Exclude benchmarks from the installed package
  sed -i "s|find_packages()|find_packages(exclude=['benchmark', 'benchmark.*'])|" setup.py
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # Deselect test_repomap.py - tree-sitter tests failing due the following
  # exception:
  #   tree_sitter_languages/core.pyx:14: TypeError
  # Deselect test_help.py - interactive help requires missing deps.
  pytest \
    --deselect aider/tests/test_repomap.py \
    --deselect aider/tests/test_help.py
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
