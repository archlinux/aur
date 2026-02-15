# shellcheck shell=bash
# -*- mode: sh -*-

# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='json-bash-git'
_pkgname="${pkgname/-git}"
_srcname="${_pkgname/-/.}"
pkgdesc='Command-line tool and bash library that creates JSON (latest git commit)'
pkgver=0.3.0.r0.g74686b6
pkgrel=1
url="https://github.com/h4l/$_srcname"
arch=('any')
license=('MIT')  # SPDX-License-Identifier: MIT
checkdepends=('shellcheck')
makedepends=('git')
depends=('bash')
provides=("$_pkgname" "$_srcname")
conflicts=("${provides[@]}")
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

check() {
  cd "$_srcname"

  # This step currently fails.
  # Somebody ought to report these errors upstream.
  _scripts=(
    json.bash
    bin/jb-{cat,echo,stream}
  )
  for _script in "${_scripts[@]}"; do
    printf '» checking %s\n' "$_script"
    shellcheck "$_script"
  done
}

package() {
  cd "$_srcname"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    "bin/$_srcname"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CHANGELOG.md README.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE.md

  cp -fa examples hack "$pkgdir/usr/share/doc/$pkgname/"

  cd bin

  _sources=(
    'jb-cat'
    'jb-echo'
    'jb-stream'
  )
  install -Dm0755 -t "$pkgdir/usr/bin" "${_sources[@]}"

  cd "$pkgdir/usr/bin"

  _symlinks=(
    'jb'
    'jb-array'
    'jb-object'
  )
  for _target in "${_symlinks[@]}"; do
    ln -srf "$_srcname" "$_target"
  done

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
