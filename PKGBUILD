# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='json-bash-git'
_pkgname="${pkgname/-git}"
_srcname="${_pkgname/-/.}"
pkgver=0.2.2.r17.g5aacc24
pkgrel=3
epoch=
pkgdesc='Command-line tool and bash library that creates JSON (latest git commit)'
arch=('any')
url="https://github.com/h4l/$_srcname"
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('bash')
makedepends=('git')
#optdepends=('python: needed to run some of the documentation scripts')
provides=("$_pkgname" "$_srcname")
conflicts=("$_pkgname" "$_srcname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  ./json.bash --version
}

package() {
  cd "$_srcname"

  install -vDm0755 -t "$pkgdir/usr/bin" \
    "bin/$_srcname"
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CHANGELOG.md README.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE.md

  cp -vfa examples hack "$pkgdir/usr/share/doc/$pkgname/"

  cd 'bin'

  _sources=(
    'jb-cat'
    'jb-echo'
    'jb-stream'
  )
  install -vDm0755 -t "$pkgdir/usr/bin" "${_sources[@]}"

  cd "$pkgdir/usr/bin"

  _symlinks=(
    'jb'
    'jb-array'
    'jb-object'
  )
  for _target in "${_symlinks[@]}"; do
    ln -srvf "$_srcname" "$_target"
  done
}

# eof
