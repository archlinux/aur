# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor: Alkindi42
# -*- sh -*-

pkgname='dasel'
pkgver=2.8.0
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
  '906f2bdb7866c58d16b7b3643f9ec19455384a9a4a50e1bf6bf59cd3914076a7'
)
b2sums=(
  '4c3603cacb592e0912b2fb552c44c26dd1578fbe1c9f4d88625098eeaeb3f7f61996bcde68020f122a53adafa2d35efbed81e60124a62eca0e27007df3e9a80a'
)

# eof
