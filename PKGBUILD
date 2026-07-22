# Maintainer:
# Contributor: Fedor Suchkov <f.suchkov@gmail.com>

_pkgname="fanficfare"
pkgname="$_pkgname-git"
pkgver=4.59.0.r25.gafd53cf
pkgrel=1
pkgdesc="Tool to make eBooks from stories on fanfiction and other websites"
url="https://github.com/JimmXinu/FanFicFare"
license=(
  'Apache-2.0'
  'GPL-3.0-only' # calibre plugin
)
arch=('any')

depends=(
  'python'
  'python-apsw'
  'python-beautifulsoup4'
  'python-brotli'
  'python-chardet'
  'python-cloudscraper' # AUR
  'python-colorama'
  'python-html2text'
  'python-pillow'
  'python-requests'
  'python-requests-file'
  'python-six'
  'python-urllib3'
)
makedepends=(
  'git'
  'python-setuptools'
  'python-wheel'
  'python-installer'
  'python-build'
)
optdepends=(
  'calibre: use as a plugin for calibre'
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "0001-makeplugin-do-not-bundle-system-dependencies.patch"
)
sha256sums=(
  'SKIP'
  '1224ccd3c8edcfb80abf7238b46081b3799773f32eadddcd82a0a4b0cdfe68d5'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/-([^-]*-g)/.r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  patch -Np1 -F100 -i ../0001-makeplugin-do-not-bundle-system-dependencies.patch
}

build() {
  cd "$_pkgsrc"

  # update version
  sed -E -e 's&^(\s*version)="(\S+)"$&\1="'"$_pkgver"'"&' -i "fanficfare/cli.py"

  # compile program
  python -m build --wheel --no-isolation

  # compile translations
  for i in calibre-plugin/translations/*.po; do
    msgfmt -vv "$i" -o "${i%.po}.mo"
  done
  python makeplugin.py
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 FanFicFare.zip -t "$pkgdir"/usr/share/calibre/system-plugins/
}
