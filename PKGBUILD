# Maintainer: ml <>
# Contributor: Lukas Zimmermann <luk.zim91 at gmail dot com>
pkgname=docker-ls
pkgver=0.5.1
pkgrel=1
pkgdesc='Tools for browsing and manipulating docker registries'
url='https://github.com/mayflower/docker-ls'
license=('MIT')
arch=('x86_64')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('53e6bf3f7b24d37f1038e2ed7dedbf7608d314c93f60f325e6fe7ab3883c5881')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath -ldflags=-linkmode=external'
  go generate ./lib/version.go
  go build -o . ./cli/docker-{ls,rm}

  for i in docker-{ls,rm}; do
    ./"$i" autocomplete bash >"$i".bash
    ./"$i" autocomplete zsh >"$i".zsh
  done
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
  for i in docker-{ls,rm}; do
    install -Dm755 "$i" -t "$pkgdir"/usr/bin
    install -Dm644 "$i".bash "$pkgdir"/usr/share/bash-completion/completions/"$i"
    install -Dm644 "$i".zsh "$pkgdir"/usr/share/zsh/site-functions/_"$i"
  done
}
