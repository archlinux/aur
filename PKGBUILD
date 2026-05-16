# Maintainer: Knut <kemehus at gmail dot com>
# Contributor: Simon <thelinuxguy @ freenode>
# Contributor: Garrett <floft.net/contact>

pkgname=openlp-git
_pkgbase=openlp
pkgver=3.1.2.r238.g1d1988a31
pkgrel=1
pkgdesc="Church presentation and lyrics projection software."
arch=('any')
url='https://openlp.org/'
license=('GPL-3.0-or-later')
provides=('openlp')
conflicts=('openlp')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-hatch-vcs'
  'qt6-tools'
)
depends=(
  'python>=3.10'
  'python-alembic'
  'python-beautifulsoup4'
  'python-chardet'
  'python-distro'
  'python-flask'
  'python-flask-cors'
  'python-lxml'
  'python-mako'
  'python-packaging'
  'python-platformdirs'
  'python-pyicu'
  'python-qrcode'
  'python-requests'
  'python-sqlalchemy'
  'python-waitress'
  'python-websocket-client'
  'python-websockets'
  'python-qtawesome'
  'pyside6>=6.7'
)
optdepends=(
  'libreoffice: display Impress presentations'
  'python-qdarkstyle: dark theme support'
  'python-pymupdf: display PDFs'
  'python-pysword: import SWORD bibles'
  'python-pyenchant: spell checking support'
  'python-pyodbc: import OPS Pro / WorshipCenter Pro / MediaShout databases'
  'python-mysql-connector: use a MySQL/MariaDB database'
  'python-psycopg2: use a PostgreSQL database'
  'aspell: aspell-based spell checking'
  'hspell: Hebrew spell checking support'
  'libvoikko: Finnish spell checking and grammar support'
  'nuspell: nuspell-based spell checking (uses Hunspell dictionaries)'
)
install=openlp.install
source=(
  "$_pkgbase::git+https://gitlab.com/openlp/openlp.git"
  'openlp.sh'
)
sha256sums=(
  'SKIP'
  '19c2f3c622585bf308efc259013fb5518feaf8cf14b51613e1e71778fcc2e8cf'
)

pkgver() {
  cd "$_pkgbase"
  git describe --long --tags 2>/dev/null |
    sed 's/^OpenLP_//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgbase"
  shopt -s nullglob

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0755 "$srcdir/openlp.sh" "$pkgdir/etc/profile.d/openlp.sh"
  install -Dm0644 "resources/openlp.desktop" "$pkgdir/usr/share/applications/openlp.desktop"
  install -Dm0644 "resources/images/openlp-logo.svg" "$pkgdir/usr/share/pixmaps/openlp.svg"
  install -Dm0644 "resources/images/openlp-logo-48x48.png" "$pkgdir/usr/share/pixmaps/openlp.png"

  # Install translations
  local tsrcdir="resources/i18n"
  local tdestdir="$pkgdir/usr/share/$_pkgbase/i18n"
  install -d "$tdestdir"

  for file in "$tsrcdir"/*.ts; do
    lconvert -i "$file" -o "$tdestdir/$(basename "$file" .ts).qm"
  done
}
