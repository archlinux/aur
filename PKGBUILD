# shellcheck shell=bash
# -*- sh -*-

# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-whenever-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgdesc='Modern datetime library for Python (development version)'
pkgver=0.10.3.r0.ga107d67
pkgrel=1
url="https://github.com/ariebovenberg/$_srcname"
arch=('aarch64' 'x86_64')
license=('MIT')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools-rust'
  'python-wheel'
)
depends=(
  'glibc'
  'libgcc'
  'python'
  'python-pydantic-core'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_srcname"

  git clean -dfx
}

build() {
  cd "$_srcname"

  export PYTHONWARNINGS=ignore
  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGELOG,CONTRIBUTING,README}.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" \
    && ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
