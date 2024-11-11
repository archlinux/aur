# Contributor: Gesh <gesh@gesh.uni.cx>
# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=papis
pkgver=0.14
pkgrel=1
pkgdesc='Command-line document and bibliography manager'
arch=('any')
url='https://github.com/papis/papis'
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
    # Alternative pickers
    'fzf: alternative picker'
    'papis-rofi: alternative picker'

    # Integrations
    'git: integration with git'
    'papis-zotero: imports from zotero'
    'python-papis-scihub: imports from scihub'

    # Internally-optional features
    # papis doesn't make use of the system installation of pdfjs, instead
    # requiring an installation in $XDG_CONFIG_HOME.
    # see https://github.com/papis/papis/issues/946
    # 'pdfjs: pdf reader in the web app'
    'python-chardet: improved encoding autodetection when scraping'
    'python-jinja: jinja formatting'
    'python-whoosh: whoosh database backend'
    'python-markdownify: convert zenodo imports to markdown'

    # Plugin helpers used by some plugins
    'python-docutils: for papis.sphinx_ext (used by some plugins)'
    'python-sphinx: for papis.sphinx_ext (used by some plugins)'
    'python-sphinx-click: for papis.sphinx_ext (used by some plugins)'
    'python-pytest: for papis.testing (used by some plugins)'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'

    'python-sphinx-click'
    'python-sphinx-design'
)
checkdepends=(
    'python-pytest'
    'python-pytest-cov'
    # These are needed for the integration tests against the corresponding
    # optdepends, papis will autoskip the relevant tests if they're not
    # installed
    'git'
    'python-jinja'
    'python-markdownify'
    'python-whoosh'
)

_patchUrl='https://patch-diff.githubusercontent.com/raw'
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}-PR945.patch::${_patchUrl}/papis/papis/pull/945.patch"
)
sha256sums=('5bb9f037b84061dda990652581d0b2171d05dbb970f1657ff7b390ef8345ecee'
            '07fef0a1e26e9b64aff5372eca91c28b75568a88b09113550a020546ec23739f')

prepare() {
  cd "${pkgname}-${pkgver}"
  # Enable autoskipping git integration tests, see
  # https://github.com/papis/papis/issues/944
  patch -p1 < "../${pkgname}-PR945.patch"
}

build() {
  cd "${pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
  python -m installer --destdir=tmp_man_install dist/*.whl

  local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
  export PYTHONPATH="$(pwd)/tmp_man_install/${site_packages}:${PYTHONPATH}"
  make -C doc man

  # Needed to add the generated manpages into the wheel
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  python -m pytest papis tests
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
