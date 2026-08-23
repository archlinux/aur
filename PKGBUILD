# Maintainer: Gesh <gesh@gesh.uni.cx>
# Maintainer: Tuure Piitulainen <tuure.piitulainen@gmail.com>
# Contributor: Stefan Gehr <stefan@gehr.xyz>
# Contributor: JP-Ellis <josh@jpellis.me>

pkgname=papis
pkgver=0.16.0
pkgrel=1
pkgdesc='Command-line document and bibliography manager'
arch=('any')
url='https://github.com/papis/papis'
license=('GPL-3.0-or-later')
depends=('python'
    'python-arxiv'
    'python-beautifulsoup4'
    'python-bibtexparser<2'
    'python-click'
    'python-colorama'
    'python-doi'
    'python-dominate'
    'python-filetype'
    'python-habanero'
    'python-lark-parser'
    'python-lxml'
    'python-platformdirs'
    'python-prompt_toolkit'
    'python-pygments'
    'python-requests'
    'python-slugify'
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
    'python-citeproc-py: exporting to CSL'
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
    'python-sphinx_rtd_theme'
)
checkdepends=(
    'python-pytest'
    # These are needed for the integration tests against the corresponding
    # optdepends, papis will autoskip the relevant tests if they're not
    # installed
    'git'
    'python-jinja'
    'python-markdownify'
    'python-whoosh'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9f7a6c5bc0452487a2774e764607735574541feeb7e23002a047aef7081f6903')

build() {
  cd "${pkgname}-${pkgver}"

  python -m build --wheel --no-isolation

  python -m venv --system-site-packages build-env
  build-env/bin/python -m installer dist/*.whl
  build-env/bin/python -P "$(command -v sphinx-build)" \
    -b man -d doc/build/doctrees doc/source doc/build/man

  # Needed to add the generated manpages into the wheel
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"

  build-env/bin/python -m pytest \
    --disable-plugin-autoload \
    -o addopts='--papis-tmp-doctests --papis-tmp-xdg-home --doctest-modules' \
    -p papis_testing
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
