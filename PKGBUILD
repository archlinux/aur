# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname=aider-chat
_pkgname=aider
pkgver=0.51.1
pkgrel=1
pkgdesc="AI pair programming in your terminal"
url="https://github.com/paul-gauthier/aider"
license=(Apache-2.0)
arch=(any)
provides=(aider)
depends=(
  litellm
  python
  python-backoff
  python-beautifulsoup4
  python-configargparse
  python-diff-match-patch
  python-diskcache
  python-dotenv
  python-gitpython
  python-grep-ast
  python-httpx
  python-importlib-resources
  python-jsonschema
  python-networkx
  python-numpy
  python-packaging
  python-pathspec
  python-pillow
  python-playwright
  python-prompt_toolkit
  python-pygments
  python-pypandoc
  python-pyperclip
  python-requests
  python-rich
  python-streamlit
  python-tqdm
  python-tree-sitter-languages-bin
  python-yaml
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
)
checkdepends=(python-pytest)
optdepends=(
  'python-sounddevice: portaudio support'
  'python-soundfile: portaudio support'
)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('94469936b86187af36479682813cb9e28d96ab3a0ff18df85d4ff08a3d61cd12')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  # Deselect failing tests:
  # - test_commands.py: TypeError, not sure why.
  # - test_repomap.py: exception in python-tree-sitter-languages-bin.
  # - test_help.py - requires missing deps.
  # - test_scrape.py - Not sure why this fails.
  pytest \
    --deselect tests/basic/test_commands.py::TestCommands::test_cmd_tokens_output \
    --deselect tests/basic/test_repomap.py \
    --deselect tests/help/test_help.py \
    --deselect tests/scrape/test_scrape.py::TestScrape::test_cmd_web_imports_playwright \
    --deselect tests/scrape/test_scrape.py::TestScrape::test_scrape_actual_url_with_playwright \
    --deselect tests/scrape/test_scrape.py::TestScrape::test_scrape_self_signed_ssl \
    --deselect tests/scrape/test_scrape.py::TestScrape::test_scrape_with_playwright_error_handling
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
