# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor: Alkindi42
# -*- sh -*-

pkgname='dasel'
pkgver=2.8.1
pkgrel=1
pkgdesc='Select, put and delete data from JSON, TOML, YAML, XML and CSV files with a single command-line tool'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
options=('lto')
changelog="$pkgname.changelog"

# Used in LDFLAGS
_majver="${pkgver/[.]*/}"

prepare() {
  cd "$pkgname-$pkgver"

  go mod tidy
}

build() {
  cd "$pkgname-$pkgver"

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "Z${CARCH:-unknown}" in
    'Zx86_64' | 'Zi386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X github.com/tomwright/dasel/v$_majver/internal.Version=$pkgver" \
    -mod=readonly \
    -modcacherw \
    -o "$pkgname" ./cmd/dasel/main.go
}

check() {
  cd "$pkgname-$pkgver"

  go test ./...

  ./dasel --version
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm0755 -t "$pkgdir/usr/bin" dasel
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGELOG,CODE_OF_CONDUCT,README}.md

  "$pkgdir/usr/bin/dasel" man

  install -vDm0644 -t "$pkgdir/usr/share/man/man1" *.1

  for _shell in bash fish zsh; do
    "$pkgdir/usr/bin/dasel" completion "$_shell" > "completion.$_shell"
  done

  install -vDm0644 completion.bash \
    "$pkgdir/usr/share/bash-completion/completions/dasel"
  install -vDm0644 completion.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/dasel.fish"
  install -vDm0644 completion.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_dasel"
}

sha256sums=(
  'ba8da9569f38e7f33453c03ac988382291a01004a96c307d52cccadb9ef7837e'
)
b2sums=(
  '6d679afd498cb03882147a1e200514c5c6ba6b4668e73ccc04c52fd468fdc6066cf899aedd195e8263259b070400830fe4dd2747adc2a256cab9aeaa4d90fb56'
)

# eof
