# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='gut'
pkgver=0.3.2
pkgrel=2
pkgdesc='A beginner friendly porcelain for git'
arch=('aarch64' 'x86_64')
url="https://github.com/julien040/$pkgname"
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
options=('lto')

_pkgdate='2025-04-01'
_pkgver="$pkgver ($_pkgdate)"

prepare() {
  cd "$pkgname-$pkgver"

  sed -i "s|var gutVersion = \"dev\"|var gutVersion = \"$_pkgver\"|g" \
    src/telemetry/telemetry.go

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

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external" \
    -mod=readonly \
    -modcacherw \
     .
}

check() {
  cd "$pkgname-$pkgver"

  go test ./...
  ./gut --version
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm0755 -t "$pkgdir/usr/bin" \
    "$pkgname"
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CONTRIBUTING,README,SECURITY,future_of_gut}.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}

sha256sums=(
  '49431ba0d24f9abf4c7cdbdf1956d2b6e70e16f955b5bbb70d8d8f4b8a5a48d1'
)
b2sums=(
  'cac2e4429b629ad04c6d76e7e4aef028f64a1a7ed478a2ac9f3c23e255fe84a29c2e49b86f04d9ed2cb1c4b89e05c8f676a98f6f5ed02810595d7ffaba286929'
)

# eof
