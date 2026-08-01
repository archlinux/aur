# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Bart Libert <email hidden>

_pkgname='tooi'
pkgname="$_pkgname-git"
pkgdesc='Text-based user interface for Mastodon, Pleroma and friends (development version)'
pkgver=0.27.0.r0.gba969ce
pkgrel=2
url='https://codeberg.org/ihabunek/tooi'
changelog="$_pkgname.changelog"
arch=('any')
license=('MIT')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
depends=(
  'python'
  'python-aiodns'   # For fast DNS resolving by aiohttp
  'python-aiohttp'
  'python-beautifulsoup4'
  'python-certifi'
  'python-click'
  'python-html2text'
  'python-platformdirs'
  'python-pydantic'
  'python-textual'
  'python-textual-fspicker'
  'python-textual-image'
  'python-tomlkit'
  'python-typing_extensions'
)
provides=('tooi')
conflicts=("${provides[@]}")
options=('!strip')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  git clean -dfx
}

build() {
  cd "$_pkgname"

  export PYTHONWARNINGS=ignore
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
