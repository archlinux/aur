# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-jh2-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=5.0.14.r0.g44f7bdd
pkgrel=2
pkgdesc='HTTP/2 State-Machine based protocol implementation (development version)'
arch=('aarch64' 'x86_64')
url='https://github.com/jawah/h2'
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'python>=3.7'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-maturin'
  'python-setuptools'
  'python-wheel'
)
source=("$_srcname::git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

prepare() {
  cd "$_srcname"

  # Relax maturin requirements
  sed -i 's/,<1.14/,<=1.15/g' pyproject.toml
}

pkgver() {
  cd "$_srcname"

  git describe --tags --long \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  export PYTHONWARNINGS=ignore
  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    {CHANGELOG,README}.rst SECURITY.md

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE

  for _dir in doc licenses; do
    pushd "$pkgdir/usr/share/$_dir"
    ln -sf "$pkgname" "$_pkgname"
    popd
  done > /dev/null
}

# eof
