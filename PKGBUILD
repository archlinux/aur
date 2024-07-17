# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname=aider-chat
_pkgname=aider
pkgver=0.44.0
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
b2sums=('4ff5f5982d3f20c55723ee441b9d3a48f896c555e7e3dec4663c160e9b73b80445cee9fb1f1dc4792763223a1f1a527dfc60ef0563adbad0c928aba1fe6aea04')

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

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  # Deselect failing tests:
  # - test_repomap.py: exception in python-tree-sitter-languages-bin.
  # - test_help.py - requires missing deps.
  # - test_scrape.py - invokes sudo when building in a chroot for some reason.
  pytest \
    --deselect tests/basic/test_repomap.py \
    --deselect tests/help/test_help.py \
    --deselect tests/scrape/test_scrape.py
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
