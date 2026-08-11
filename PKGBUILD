# Maintainer: Gesh <gesh@gesh.uni.cx>
# Maintainer: Tuure Piitulainen <tuure.piitulainen@gmail.com>
# Contributor: Julian Hauser <julian at julianhauser.com>

pkgname=papis-git
_pkgname=papis
pkgver=0.15.0.r136.g0f7c026a
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
makedepends=('git'
    'python-build'
    'python-installer'
    'python-hatchling'

    'python-sphinx-click'
    'python-sphinx-design'
    'python-sphinx_rtd_theme'
)
checkdepends=(
    # For pytest
    'python-pytest'
    # These are needed for the integration tests against the corresponding
    # optdepends, papis will autoskip the relevant tests if they're not
    # installed
    'git'
    'python-jinja'
    'python-markdownify'
    'python-whoosh'

    # For mypy
    'mypy'
    'python-types-beautifulsoup4'
    'python-types-docutils'
    'python-types-pygments'
    'python-types-pyyaml'
    'python-types-requests'
)
provides=('papis')
conflicts=('papis')
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  python -m build --wheel --no-isolation

  python -m venv --system-site-packages build-env
  build-env/bin/python -m installer dist/*.whl
  build-env/bin/python -P "$(command -v sphinx-build)" \
    -b man -d doc/build/doctrees doc/source doc/build/man

  # Needed to add the generated manpages into the wheel
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}"

  # Override papis python version selection which is too old for us,
  # see https://github.com/papis/papis/pull/1137
  build-env/bin/python -m mypy \
    --python-version \
      "$(python -c 'import platform; print(
        ".".join(platform.python_version_tuple()[:2])
        )')"

  build-env/bin/python -m pytest \
    --disable-plugin-autoload -o addopts='' \
    -p papis_testing
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
