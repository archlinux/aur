# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Alkindi42

pkgname='dasel'
pkgver=3.1.0
pkgrel=1
pkgdesc='Select, put and delete data from JSON, TOML, YAML, XML, and HCL files with a single command-line tool'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
changelog="$pkgname.changelog"

# Used in LDFLAGS (although no longer used by dasel v3+)
_majver="${pkgver/[.]*/}"

prepare() {
  cd "$pkgname-$pkgver"

  go mod tidy
}

build() {
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  # Compile executable
  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X github.com/tomwright/dasel/v$_majver/internal.Version=$pkgver" \
    -mod=readonly \
    -modcacherw \
    -o dasel \
      ./cmd/dasel/main.go

  # Create man pages
  #./dasel man

  # Create shell completions
  #for _shell in bash fish zsh; do
  #  ./dasel completion "$_shell" > "_completions.$_shell"
  #done
}

check() {
  cd "$pkgname-$pkgver"

  : go test ./...

  printf 'dasel v%s\n' $(./dasel version)
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm0755 -t "$pkgdir/usr/bin" dasel
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGELOG,CODE_OF_CONDUCT,CONTRIBUTING,README}.md

  ### man pages are gone in v3+
  #install -vDm0644 -t "$pkgdir/usr/share/man/man1" \
  #  dasel.1 dasel-*.1

  ### completions are gone in v3+
  #install -vDm0644 _completions.bash \
  #  "$pkgdir/usr/share/bash-completion/completions/dasel"
  #install -vDm0644 _completions.fish \
  #  "$pkgdir/usr/share/fish/vendor_completions.d/dasel.fish"
  #install -vDm0644 _completions.zsh \
  #  "$pkgdir/usr/share/zsh/site-functions/_dasel"
}

sha256sums=(
  'a6490154fb98069575e762e2d0b53313319b56ead81faf4f5d57d3705734c71d'
)
b2sums=(
  '617fedb5772cf63c7946d8a81edbfb027e6c235dbd7f62b1076a5242f4cd90a283560b6bce71197244847d73bc15d8b53e142dca5c2015bb8950c0026d89de8b'
)

# eof
