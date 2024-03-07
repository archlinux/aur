# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-urllib3-future-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname/-/.}"
pkgver=2.6.902.r0.ga2dcd0bb
pkgrel=1
pkgdesc='Powerful HTTP 1.1, 2, and 3 client with both sync and async interfaces (built from latest commit)'
arch=('any')
url="https://github.com/jawah/urllib3.future"
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python'
  'python-brotli'
  'python-brotlicffi'
  'python-cryptography'
  'python-h11'
  'python-h2'
  'python-idna'
  'python-python-socks'
  'python-qh3'
  'python-typing_extensions'
  'python-urllib3'
  'python-zstandard'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcdir"

  git describe --long --tags \
  |  sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
}

# eof
