# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='gut'
pkgver=0.3.1
pkgrel=1
pkgdesc='An easy-to-use git client'
arch=('aarch64' 'x86_64')
url="https://github.com/julien040/$pkgname"
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
options=('lto')

_pkgdate='2024-11-20'
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
  '6e9f8bed00dcdf6ccb605384cb3b46afea8ad16c8b4a823c0cc631f9e92a9535'
)
b2sums=(
  'a584190a8a1bb30d66853403d6c1ffa8e89024ded406a67d828969bb68bba6d211e8d082fa167500981ec7c05256686b910db8cdee2ebf5daf3045c46ee58987'
)

# eof
