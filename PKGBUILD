# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Filipe Nascimento <flipee at tuta dot io>

_pkgname='dstask'
pkgname="$_pkgname-git"
pkgver=0.28.r0.g6ad98f1
pkgrel=1
pkgdesc='Git-powered terminal-based todo/note manager with full markdown note for each task (development version)'
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64' )
url='https://github.com/naggie/dstask'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('git' 'go')
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
  _utcnow=$(date -u '+%FT%TZ')

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

  install -vDm0755 -t "$pkgdir/usr/bin" dstask{,-import}

  install -vDm0644 _completions.bash "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -vDm0644 _completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -vDm0644 _completions.zsh  "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/share/doc/$pkgname/" ./*.md doc/*.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# eof
