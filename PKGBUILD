# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor: Alkindi42
# -*- sh -*-

pkgname='dasel'
pkgver=2.7.0
pkgrel=2
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
  '93546e10971ca74c3192940fe9435b48368cefa677cef8a7532b214c6d8b6c39'
)
b2sums=(
  '27fdc70f998c389453c7b6c6ec59491f3482ff7df1a043499e985179c5a51f6b58328272d733eddb28009ada0dd206b0e4fed37ec6bc43229314a0c1906e215e'
)

# eof
