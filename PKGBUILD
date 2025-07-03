# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Alessandro Bernardello <aleberna at erine dot eu>

pkgname='zenta-git'
_pkgname="${pkgname/-git}"
pkgver=1.0.0.r0.g0538490
pkgrel=2
pkgdesc='Mindfulness for terminal users (development version)'
arch=('aarch64' 'armv7h' 'i686' 'riscv64' 'x86_64')
url='https://github.com/e6a5/zenta'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('git' 'go')
source=("git+$url.git")
provides=('zenta')
conflicts=("${provides[@]}")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"

  git clean -dfx
  mkdir -vp build
  go mod tidy
}

pkgver() {
  cd "$_pkgname"

  git describe --long --tags \
  | sed 's/^v//;s/-rc\d*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  case "Z${CARCH:-unknown}" in
    'Zaarch64' | 'Zriscv64' | 'Zx86_64' )
      # Fix “ELF file lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK.”
      export LDFLAGS="$LDFLAGS -Wl,-z,shstk"
    ;;
  esac

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags='-linkmode=external' \
    -mod=readonly -modcacherw \
    -o build .
}

package() {
  cd "$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/bin/" \
    build/zenta
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ./*.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}

# eof
