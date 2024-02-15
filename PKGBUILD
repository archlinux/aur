# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor: Alkindi42
# -*- sh -*-

pkgname=dasel
pkgver=2.6.0
pkgrel=1
pkgdesc='Select, put and delete data from JSON, TOML, YAML, XML and CSV files with a single command-line tool'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
options=('lto')

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
  case "${CARCH:-unknown}" in
    'x86_64' | 'i386' )
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
    -ldflags="-linkmode=external -X internal.Version=$pkgver -X main.BuildDate=$(date -u '+%FT%TZ')" \
    -mod=readonly \
    -modcacherw \
    -o "$pkgname" ./cmd/dasel/main.go
}

check() {
  cd "$pkgname-$pkgver"

  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm0755 dasel "$pkgdir/usr/bin/dasel"
  install -vDm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for _doc in CHANGELOG CODE_OF_CONDUCT README; do
    install -vDm0644 "$_doc.md" "$pkgdir/usr/share/doc/$pkgname/$_doc.md"
  done

  "$pkgdir/usr/bin/dasel" man

  install -vDm0644 *.1 -t "$pkgdir/usr/share/man/man1/"

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
  '1428a0ddbe93175215f25d4dea71fb96f654fc60723b276c296ea82eca26b014'
)
b2sums=(
  '7f60276adf6e763b29dfbdd3bd1f9ed253386596cf0c875df680a76a7d81aba75f98a1812aac8566dd399750e592d975c931d76b1f2923c8e6a6c41da8186e93'
)

# eof
