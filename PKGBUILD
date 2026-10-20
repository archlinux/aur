# shellcheck shell=bash
# -*- sh -*-

# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-piou-git'
pkgdesc='A CLI tool to build rich text command-line interfaces with type validation (development version)'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname}"
pkgver=0.38.2.r1.gd5ab1de
pkgrel=1
url="https://github.com/Andarius/$_srcname"
arch=('any')
license=('MIT')
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
depends=(
  'python'
  'python-rich'
  'python-typing_extensions'
)
optdepends=(
  'python-textual: for an optional interactive TUI (Text User Interface)'
  'python-watchfiles: for auto-reload support for development'
  'python-aiohttp: needed for one or more of the examples'
  'python-httpx: needed for one or more of the examples'
  'python-niquests: needed for one or more of the examples'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcdir"

  git describe --long --tags \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcdir"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples" \
    examples/*.py
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
