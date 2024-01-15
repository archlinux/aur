# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor: Alkindi42
# -*- sh -*-

pkgname=dasel
pkgver=2.5.0
pkgrel=4
pkgdesc='Select, put and delete data from JSON, TOML, YAML, XML and CSV files with a single command-line tool'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')
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

  install -Dm0755 dasel        "$pkgdir/usr/bin/dasel"
  install -Dm0644 LICENSE      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for _doc in CHANGELOG CODE_OF_CONDUCT README; do
    install -Dm0644 "$_doc.md" "$pkgdir/usr/share/doc/$pkgname/$_doc.md"
  done

  "$pkgdir/usr/bin/dasel" man

  install -dm0755     "$pkgdir/usr/share/man/man1"
  install -m 0644 *.1 "$pkgdir/usr/share/man/man1/"
}

sha256sums=(
  '0e4ec875912a3ede0b84b381b14b64293c218fb9cf1472dd085bcccd1ab097a1'
)
b2sums=(
  'd3e48b200e6d595bef6fb6c66da8bc7ba9bbfd99fef28cecd2b4270537dd9c9827a6ce960abfcad1c2229abf6ad965a91da4fe58b9ce0874a2c18064db569bdc'
)

# eof
