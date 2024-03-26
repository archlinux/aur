# Maintainer:
# Contributor: Fedor Suchkov <f.suchkov@gmail.com>

# options
: ${_build_git:=true}

unset _pkgtype
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="fanficfare"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=4.32.3.r21.g56d1cf1
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
  'python-html2text'
  'python-html5lib'
  'python-requests'
  'python-requests-file'
  'python-urllib3'

  # AUR
  'python-cloudscraper'
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

if [ "${_build_git::1}" != "t" ] ; then
  # stable
  _prepare() {
    cd "$_pkgsrc"
    local _tag=$(git tag | grep -Ev '[A-Za-z]{2}' | sort -rV | head -1)
    git -c advice.detachedHead=false checkout -f "${_tag:?}"
    git describe --tags --long
  }

  pkgver() {
    cd "$_pkgsrc"
    git describe --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//'
  }
else
  # git
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _prepare() {
    cd "$_pkgsrc"
    git describe --tags --long
  }

  pkgver() {
    cd "$_pkgsrc"
    local _pkgver=$(
      git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
        | sed -E 's/^[^0-9]*//;s/-([^-]*-g)/+r\1/;s/-/./g'
    )
    echo "${_pkgver//+/.}"

    # update version string
    sed -E -e 's&^(\s*version)="([0-9\.]+)"$&\1="'"${_pkgver//+/.}"'"&' -i "fanficfare/cli.py"
  }
fi

prepare() {
  ( _prepare )

  cd "$_pkgsrc"
  patch -p1 -i ../0001-makeplugin-do-not-bundle-system-dependencies.patch
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
  python -m installer --destdir="$pkgdir" "$(ls -1 -- dist/FanFicFare-*.whl | sort -rV | head -1)"
  install -Dm644 FanFicFare.zip "$pkgdir"/usr/share/calibre/system-plugins/FanFicFare.zip
}
