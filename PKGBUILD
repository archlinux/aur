# Maintainer: Max Rossmannek <max@rossmannek.de>
# Contributor: Cullen Ross <cullenrss@gmail.com>

_pkgname='cobib'
pkgname="${_pkgname}-git"
pkgver=r1403.cce06d1
pkgrel=1
arch=('any')
depends=(
    'python'
    'python-beautifulsoup4'
    'python-bibtexparser'
    'python-linkify-it-py'
    'python-lxml'
    'python-markdown-it-py'
    'python-mdit_py_plugins'
    'python-natsort'
    'python-pylatexenc'
    'python-requests'
    'python-rich'
    'python-ruamel-yaml'
    'python-text-unidecode'
    'python-textual'
)
optdepends=(
    'python-prompt_toolkit'
    'python-regex'
)
license=('MIT')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
    'ruby-ronn-ng'
)
provides=('cobib')
conflicts=('cobib')
pkgdesc="Console Bibliography"
url="https://gitlab.com/cobib/${_pkgname}"
source=(
    "${_pkgname}::git+${url}.git"
    "git+https://gitlab.com/cobib/cobib-docs-theme.git"
    "git+https://gitlab.com/cobib/templates/cobib-plugin-template.git"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/${_pkgname}
  python3 -m build --wheel --no-isolation
}

prepare() {
  cd $srcdir/${_pkgname}
  git submodule init
  git config submodule.theme.url "$srcdir/cobib-docs-theme"
  git config submodule.plugin.url "$srcdir/cobib-plugin-template"
  git -c protocol.file.allow=always submodule update
}

package() {
  cd $srcdir/${_pkgname}
  make DESTDIR="${pkgdir}" install_extras
  python3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
