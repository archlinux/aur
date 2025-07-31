# Maintainer: Gesh <gesh@gesh.uni.cx>
# Maintainer: Tuure Piitulainen <tuure.piitulainen@gmail.com>
# Contributor: Stefan Gehr <stefan@gehr.xyz>
# Contributor: JP-Ellis <josh@jpellis.me>

pkgname=papis
pkgver=0.14.1+PR1018
_pkgver=0.14.1
pkgrel=4
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

source=("${pkgname}-${_pkgver}::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('592b9ad2296019062922ed7f573c8c70c02fcc3b92e518fea47a00088753f440'
            'b3b5a97c7af2c9c6e3f0bd993a93e61c6b34f72f4774766612aec907277e4ad3')
prs=(
  1018 # Support python-click 8.2.0
)
for pr in "${prs[@]}"; do
    source+=("${pkgname}-PR$pr.patch::$url/pull/$pr.patch")
done

pkgver() {
  echo "$_pkgver"+PR"$(export IFS=+; echo "${prs[*]}")"
}

prepare() {
  cd "${pkgname}-${_pkgver}"

  for pr in "${prs[@]}"; do
    patch -p1 < "../${pkgname}-PR$pr.patch"
  done
}

build() {
  cd "${pkgname}-${_pkgver}"

  python -m build --wheel --no-isolation

  python -m installer --destdir=tmp_install dist/*.whl

  local _site_packages
  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  export PYTHONPATH="$PWD/tmp_install/$_site_packages"
  make -C doc man

  # Needed to add the generated manpages into the wheel
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${_pkgver}"

  local site_packages
  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  export PYTHONPATH="$PWD/tmp_install/$_site_packages"

  export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
  python -m pytest -p pytest_cov -p papis_testing \
      papis tests
}

package() {
  cd "${pkgname}-${_pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
