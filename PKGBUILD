# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Alkindi42

pkgname='dasel'
pkgver=3.1.1
pkgrel=1
pkgdesc='Select, put and delete data from JSON, TOML, YAML, XML, INI, and HCL files with a single command-line tool'
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

  printf 'dasel v%s\n' "$(./dasel version)"
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
  'ee4d8073f040a1cf182eb05ced0f0540b6a70ffd49187be3ed80c8f1290c37a3'
)
b2sums=(
  'd2d44f8f60ac19ca31502e9d5731a5bcab1bf87fd2f398aec4f17127279a54a766eed602c0738a8cb89d03854036e7f6bbddea365f4d399e3a9a43e2cd92592e'
)

# eof
