# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Filipe Nascimento <flipee at tuta dot io>

pkgname=dstask
pkgver=0.28
pkgrel=1
pkgdesc='Git-powered terminal-based todo/note manager with full markdown note for each task'
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64' )
url='https://github.com/naggie/dstask'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6e0ede0b2b1cf392c04a06fede4935436abb6b488496045da1bd2671c65b24a7')

build() {
  _commit=$(zcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)

  cd "$pkgname-$pkgver"

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _GOLDFLAGS="-linkmode=external \
    -X \"github.com/naggie/dstask.GIT_COMMIT=$_commit\"
    -X \"github.com/naggie/dstask.VERSION=$pkgver\"
    -X \"github.com/naggie/dstask.BUILD_DATE=$(date -ud@"$SOURCE_DATE_EPOCH" +%FT%TZ)\""

  go mod tidy
  go build -ldflags="$_GOLDFLAGS" -o dstask        ./cmd/dstask/main.go
  go build -ldflags="$_GOLDFLAGS" -o dstask-import ./cmd/dstask-import/main.go

  for _shell in bash fish zsh; do
    ./dstask "$_shell-completion" > "_completions.$_shell"
  done
}

check() {
  cd "$pkgname-$pkgver"

  ./dstask version
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm0755 -t "$pkgdir/usr/bin" dstask{,-import}
  install -vDm0755 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md doc/*.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  install -vDm0644 _completions.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm0644 _completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -vDm0644 _completions.zsh  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

# eof
