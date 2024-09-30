# Contributor: Gesh <gesh@gesh.uni.cx>
# Maintainer: Julian Hauser <julian at julianhauser.com>
# PKGBUILD adapted from papis, maintained by JP-Ellis <josh@jpellis.me>

pkgname=papis-git
_pkgname=papis
pkgver=0.13.r509.g9b270726
pkgrel=1
pkgdesc="Command-line document and bibliography manager"
arch=('any')
url="https://github.com/papis/papis"
license=('GPL-3.0-or-later')
depends=('python'
    'python-arxiv'
    'python-beautifulsoup4'
    'python-bibtexparser'
    'python-click'
    'python-colorama'
    'python-doi'
    'python-dominate'
    'python-filetype'
    'python-habanero'
    'python-isbnlib'
    'python-lxml'
    'python-platformdirs'
    'python-prompt_toolkit'
    'python-pygments'
    'python-pyparsing'
    'python-requests'
    'python-slugify'
    'python-stevedore'
    'python-yaml'
)
optdepends=(
    'fzf: fzf picker'
    'papis-rofi: integration with rofi'
    'papis-zotero: imports from zotero'
    'pdfjs: pdf reader in the web app'
    'python-chardet: improved encoding autodetection when scraping'
    'python-jinja: jinja formatting'
    'python-papis-scihub: imports from scihub'
    'python-markdownify: convert zenodo imports to markdown'
    'python-whoosh: whoosh database backend'
    'python-docutils: for papis.sphinx_ext (used by some plugins)'
    'python-sphinx: for papis.sphinx_ext (used by some plugins)'
    'python-sphinx-click: for papis.sphinx_ext (used by some plugins)'
    'python-pytest: for papis.testing (used by some plugins)'
)
makedepends=('git'
    'python-build'
    'python-installer'
    'python-hatchling'

    'python-sphinx-click'
    'python-sphinx-design'
)
checkdepends=(
    # For pytest
    python-pytest
    python-pytest-cov
    # These are optional -- if they're not installed, papis will automatically
    # skip these tests -- and are only necessary if you intend to use the
    # optdeps as well
    python-jinja
    python-markdownify
    python-whoosh

    # For flake8
    flake8
    python-flake8-bugbear
    python-flake8-polyfill
    python-flake8-pyproject
    python-flake8-quotes
    python-pep8-naming

    # For mypy
    mypy
    python-types-beautifulsoup4
    python-types-pygments
    python-types-pyyaml
    python-types-requests
    python-types-setuptools
)
provides=("papis")
conflicts=("papis")
source=("git+https://github.com/papis/papis.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  python -m build --wheel --no-isolation
  python -m installer --destdir=tmp_man_install dist/*.whl

  local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
  export PYTHONPATH="$(pwd)/tmp_man_install/${site_packages}:${PYTHONPATH}"
  make -C doc man

  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}"
  python -m pytest papis tests
  python -m flake8 papis tests examples
  python -m mypy papis
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
