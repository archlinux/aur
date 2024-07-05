# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="aider-chat"
_pkgname="aider"
pkgver=0.42.0
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
b2sums=('62ab80a05334885be118b7eb437737733e97b022f7f955cad81704348ce83a9cc78f078d1d24c75ad90ea24a9febb2f0f46dfe4701f8903c7f85eed528da286e')

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

  # Deselect some tree-sitter tests failing due the following exception:
  #   tree_sitter_languages/core.pyx:14: TypeError
  pytest --deselect aider/tests/test_repomap.py
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
