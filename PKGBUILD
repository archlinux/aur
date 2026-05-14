# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Alkindi42

pkgname='dasel'
pkgdesc='Select, put and delete data from JSON, TOML, XML, YAML, HCL, and INI files with a single command-line tool'
pkgver=3.10.1
pkgrel=1
url='https://github.com/TomWright/dasel'
changelog="$pkgname.changelog"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=('go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

# Used in LDFLAGS (although no longer used by dasel v3+)
_majver="${pkgver/[.]*/}"

prepare() {
  cd "$pkgname-$pkgver"

  go mod tidy
}

build() {
  cd "$pkgname-$pkgver"

  case "Z$CARCH" in
    'Zaarch64' | 'Zx86_64' )
      export LDFLAGS="$LDFLAGS -Wl,-z,shstk"
    ;;
  esac

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export SOURCE_DATE_EPOCH="${SOURCE_DATE_EPOCH:-$(date --utc '+%s')}"

  _opts=(
    -buildmode=pie
    -ldflags="-linkmode=external -X github.com/tomwright/dasel/v$_majver/internal.Version=$pkgver"
    -mod=readonly
    -modcacherw
    -trimpath
  )
  go build "${_opts[@]}" -o dasel ./cmd/dasel/main.go

  # Generate man page
  ./dasel man > dasel.1

  # Generate Shell completions
  for _shell in bash fish zsh; do
    ./dasel completion "$_shell" > "_completions.$_shell"
  done
}

check() {
  cd "$pkgname-$pkgver"

  : go test ./...

  printf 'dasel v%s\n' "$(./dasel version)"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" dasel
  install -Dm0644 -t "$pkgdir/usr/share/man/man1" dasel.1
  install -Dm0644 _completions.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm0644 _completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm0644 _completions.zsh  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGELOG,CODE_OF_CONDUCT,CONTRIBUTING,README}.md
}

sha256sums=(
  '7241a92414991211b5e58130bd4613c960d610f0255279ee5993654fd026e3cb'
)
b2sums=(
  '319109da25c0e4548cd8313a6bec6181c09ae981adcbc7f280f781df2eab675c16a01253dbbed8a8c8affd893d3d2246318c794d0da22011cb9c5f8a484e860f'
)

# eof
