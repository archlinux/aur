# Maintainer:
# Contributor: Fedor Suchkov <f.suchkov@gmail.com>

_pkgname="fanficfare"
pkgname="$_pkgname-git"
pkgver=4.44.0.r20.ga9c725d
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
  'python-beautifulsoup4'
  'python-brotli'
  'python-chardet'
  'python-cloudscraper' # AUR
  'python-colorama'
  'python-html2text'
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
  'python-pillow: convert and resize covers and images'
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "0001-makeplugin-do-not-bundle-system-dependencies.patch"
)
sha256sums=(
  'SKIP'
  '6d172dcc98a8f6dcef2048272bfabd810ceeb5740969fbe406ebcd7b638e072c'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgsrc"
  local _pkgver=$(
    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/-([^-]*-g)/.r\1/;s/-/./g'
  )
  echo "${_pkgver:?}"

  # update version string
  sed -E -e 's&^(\s*version)="(\S+)"$&\1="'"$_pkgver"'"&' -i "fanficfare/cli.py"
}

prepare() {
  cd "$_pkgsrc"
  patch -Np1 -F100 -i ../0001-makeplugin-do-not-bundle-system-dependencies.patch
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation

  for i in calibre-plugin/translations/*.po; do
    msgfmt -vv "$i" -o "${i%.po}.mo"
  done
  python makeplugin.py
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 FanFicFare.zip "$pkgdir"/usr/share/calibre/system-plugins/FanFicFare.zip
}
