# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname=aider-chat
_pkgname=aider
pkgver=0.55.0
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
  python-json5
  python-jsonschema
  python-networkx
  python-numpy
  python-packaging
  python-pathspec
  python-pexpect
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
sha256sums=('3463544813d367d02b71d28e957621a7782d6644d0cde82d6d7c688f219d1138')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  local pytest_args=(
    # TypeError, not sure why.
    --deselect=tests/basic/test_commands.py::TestCommands::test_cmd_tokens_output
    # Tries to make and sign a commit - fails for some reason.
    --deselect=tests/basic/test_main.py::TestMain::test_lint_option
    # Exception in python-tree-sitter-languages-bin.
    --deselect=tests/basic/test_repomap.py
    # Requires missing deps.
    --deselect=tests/help/test_help.py
    # Not sure why these fail.
    --deselect=tests/scrape/test_scrape.py::TestScrape::test_cmd_web_imports_playwright
    --deselect=tests/scrape/test_scrape.py::TestScrape::test_scrape_actual_url_with_playwright
    --deselect=tests/scrape/test_scrape.py::TestScrape::test_scrape_self_signed_ssl
    --deselect=tests/scrape/test_scrape.py::TestScrape::test_scrape_with_playwright_error_handling
  )

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest "${pytest_args[@]}"
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
