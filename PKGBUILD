# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-bake-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=1.2.4.r0.g14ea4bd
pkgrel=2
pkgdesc='Mbake: Format and lint Makefiles according to best practices (development version)'
arch=('any')
url='https://github.com/EbodShojaei/bake'
license=('MIT')  # SPDX-License-Identifier: MIT
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
  'python-tomli'
  'python-typer'
)
source=("git+$url.git")
provides=({m,python-}bake)
conflicts=("${provides[@]}")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --tags --long \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 .bake.toml.example \
    "$pkgdir/usr/share/doc/$pkgname/example/bake.toml"
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ./*.md demo.mk
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE

  # Spot already taken by ruby-bake
  rm -vf "$pkgdir/usr/bin/bake"
}

# eof
