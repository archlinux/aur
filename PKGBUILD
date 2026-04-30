# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Alkindi42

pkgname='dasel'
pkgdesc='Select, put and delete data from JSON, TOML, XML, YAML, HCL, and INI files with a single command-line tool'
pkgver=3.8.1
pkgrel=3
url='https://github.com/TomWright/dasel'
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
  '92711ddecfad9a1e97a41011d12ea88e9bb3c37827e5d5a718c3a8e8eaa88eaa'
)
b2sums=(
  'b519b4aaff19e0856a0273579f5a81af7e67161b55d83234a08de73275c9239b3459c872b108bd34994b654cb78774a52b06259af44d166600665e065e047339'
)

# eof
