# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-urllib3-future-git'
pkgdesc='Powerful HTTP 1.1, 2, and 3 client with both sync and async interfaces (development version)'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname/-/.}"
pkgver=2.25.904.r0.gd834510f
pkgrel=1
url='https://github.com/jawah/urllib3.future'
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
  'python-brotli'
  'python-h11'
  'python-idna'
  'python-jh2'
  'python-pyopenssl'
  'python-pysocks'
  'python-python-socks'
  'python-qh3'
  'python-typing_extensions'
  'python-urllib3'
  'python-wsproto'
  'python-websockets'
  'python-zstandard'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcdir"

  git describe --tags --long \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcdir"

  # We do not wish to conflict with the original python-urllib3
  env URLLIB3_NO_OVERRIDE=true python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm0644 README.md   "$pkgdir/usr/share/doc/$pkgname/README.md"

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -sr "$pkgname" "$_pkgname"
  done
}

# eof
