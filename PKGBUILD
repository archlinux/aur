# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Filipe Nascimento <flipee at tuta dot io>

pkgname=dstask
pkgver=1.0
pkgrel=1
pkgdesc='Git-powered terminal-based todo/note manager with full markdown note for each task'
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64' )
url='https://github.com/naggie/dstask'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('faec7a671331435ddf5be644404a62eef3b6fc0f895811b1f7c6b840e0bec234')

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

  for _exe in dstask{,-import}; do
    go build -ldflags="$_GOLDFLAGS" -o "$_exe" "./cmd/$_exe/main.go"
  done

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

  test -t 1 && set -x

  install -Dm0755 -t "$pkgdir/usr/bin" dstask{,-import}
  install -Dm0755 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md doc/*.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  install -Dm0644 _completions.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm0644 _completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm0644 _completions.zsh  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

# eof
