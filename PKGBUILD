# shellcheck shell=bash
# -*- mode: sh -*-

# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=yarr
pkgdesc='Yet Another RSS Reader: Self-hosted, web-based feed aggregator with an embedded sqlite database'
pkgver=2.8
pkgrel=0
url='https://github.com/nkanaev/yarr'
changelog="$pkgname.changelog"
arch=('aarch64' 'x86_64')
license=('MIT')
makedepends=('git' 'go' 'make' 'npm')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c15adc91c9c0ef085ce6161c81f296e96b066e99352416b920288ef9a8d0aafa')

_githash=05d57a2

prepare() {
  cd "$pkgname-$pkgver"

  sed -i "s/^GITHASH=/GITHASH\?=/g" makefile
  sed -i "s/^VERSION=/VERSION\?=/g" makefile
  go mod tidy
}

build(){
  cd "$pkgname-$pkgver"

  case "Z${CARCH:-unknown}" in
    'Zx86_64' | 'Zaarch64' )
      # Fix “ELF file lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK.”
      export LDFLAGS="$LDFLAGS -Wl,-z,shstk"
    ;;
  esac

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  env GITHASH="$_githash" VERSION="$pkgver" make host
}

check() {
  cd "$pkgname-$pkgver"

  printf '%s %s\n' "$pkgname" "$(out/yarr -version)"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" out/yarr
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" readme.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" doc/*.{md,txt}
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" license
}

# eof
