# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Alkindi42

pkgname='dasel'
pkgdesc='Select, put and delete data from CSV, HCL, INI, JSON, KDL, TOML, XML and YAML files with a single CLI tool'
pkgver=3.11.2
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
  '5471fe33b28c98efed2b1a13431ed24097785f56a24dc9fb15e37b1e266446e1'
)
b2sums=(
  '702fe7c85958fe1208446f8e941415177cd379a6a97276e308d04d1c7454225ba823d954b46d846a79f40d10f33d2669e5fd66a628ea309c6ce03e0ce5f24e80'
)

# eof
