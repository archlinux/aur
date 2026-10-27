# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-wassima-git'
pkgdesc='Say goodbye to certifi. Embrace your system root CAs — retrieve them with ease and comfort (development version)'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname/-/.}"
pkgver=2.1.5.r0.g4052aa7
pkgrel=1
url='https://github.com/jawah/wassima'
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
  'python-typing_extensions'
)
options=('!strip')
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcdir"

  git describe --long --tags \
    |  sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcdir"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    {CHANGELOG,README,SECURITY}.md NOTICE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -sr "$pkgname" "$_pkgname"
  done
}

# eof
