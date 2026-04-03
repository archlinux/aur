# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='landdown'
pkgname="$_pkgname-git"
pkgver=r27.g9161be8
pkgrel=1
pkgdesc='Simple shell script sandbox (development version)'
url='https://git.sr.ht/~marcc/landdown'
arch=('aarch64' 'x86_64' )
license=('EUPL-1.2')  # SPDX-License-Identifier: EUPL-1.2
makedepends=('git' 'go')
#depends=('glibc')
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$_pkgname"

  git clean -dfx
  go mod tidy
}

build() {
  cd "$_pkgname"

  _opts=(
    -buildmode=pie
    -mod=readonly
    -modcacherw
    -trimpath
  )
  export CGO_ENABLED=0
  export GOFLAGS="${_opts[*]}"
  go build "${_opts[@]}" -o "$_pkgname" .
}

package() {
  cd "$_pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin" "$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
