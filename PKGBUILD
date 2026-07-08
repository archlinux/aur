# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-qh3-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=1.9.3.r0.gcc63dc9
pkgrel=1
pkgdesc='Lightweight QUIC and HTTP/3 implementation in Python (development version)'
arch=('aarch64' 'x86_64')
url='https://github.com/jawah/qh3'
license=('BSD-3-Clause')
depends=(
  'glibc'
  'libgcc'
  'python'
  'python-brotli'
)
makedepends=(
  'cmake'
  'git'
  'python-build'
  'python-installer'
  'python-maturin'
  'python-wheel'
)
optdepends=(
  'httpbin: needed to run the examples in the doc directory'
  'python-asgiref: needed to run the examples in the doc directory'
  'python-dnslib: needed to run the examples in the doc directory'
  'python-starlette: needed to run the examples in the doc directory'
  'python-uvloop: needed to run the examples in the doc directory'
  'python-wsproto: needed to run the examples in the doc directory'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("$_srcname::git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_srcname"

  # Relax maturin requirements
  sed -i 's/,<1.14"/,<=1.14.1"/g' pyproject.toml
}

pkgver() {
  cd "$_srcname"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  git clean -dfx
  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    {CHANGELOG,README}.rst SECURITY.md
  cp -fa examples "$pkgdir/usr/share/doc/$pkgname/"

  for _dir in doc licenses; do
    pushd "$pkgdir/usr/share/$_dir"
    ln -srf "$pkgname" "$_pkgname"
    popd
  done > /dev/null
}

# eof
