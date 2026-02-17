# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Filipe Nascimento <flipee at tuta dot io>

_pkgname='dstask'
pkgname="$_pkgname-git"
pkgver=1.0.1.r2.g9a620e6
pkgrel=2
pkgdesc='Git-powered terminal-based todo/note manager with full markdown note for each task (development version)'
url='https://github.com/naggie/dstask'
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64' )
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=('git' 'go')
depends=('glibc')
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  git clean -dfx
  go mod tidy
}

build() {
  cd "$_pkgname"

  local _commit='', _utcnow=''

  _commit=$(git describe --always)
  _utcnow=$(printf '%(%FT%T%z)T')

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    _GOLDFLAGS="-linkmode=external \
      -X \"github.com/naggie/dstask.GIT_COMMIT=$_commit\"
      -X \"github.com/naggie/dstask.VERSION=$pkgver\"
      -X \"github.com/naggie/dstask.BUILD_DATE=$_utcnow\""

  go build -ldflags="$_GOLDFLAGS" -o dstask        ./cmd/dstask/main.go
  go build -ldflags="$_GOLDFLAGS" -o dstask-import ./cmd/dstask-import/main.go

  for _shell in bash fish zsh; do
    ./dstask "$_shell-completion" > "_completions.$_shell"
  done
}

check() {
  cd "$_pkgname"

  ./dstask version
}

package() {
  cd "$_pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin" dstask{,-import}

  install -Dm0644 _completions.bash "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm0644 _completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -Dm0644 _completions.zsh  "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

  install -Dm0755 -t "$pkgdir/usr/share/doc/$pkgname/" ./*.md doc/*.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
