# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='betula'
pkgname="$_pkgname-git"
pkgver=1.4.0.r1.ge4e6b90
pkgrel=1
pkgdesc='Federated personal link collection manager (latest git commit)'
arch=('aarch64' 'armv7h' 'x86_64')
url="https://git.sr.ht/~bouncepaw/$_pkgname"
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
depends=('glibc')
makedepends=('git' 'go')
source=("git+$url")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')
options=('lto')

prepare() {
  cd "$_pkgname"

  mkdir -p build
  go mod tidy
}

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

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

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.version=$pkgver" \
    -mod=readonly \
    -modcacherw \
    -o build \
      ./cmd/betula
}

package() {
  cd "$_pkgname"

  install -vDm0755 "build/betula"  "$pkgdir/usr/bin/betula"
  install -vDm0644 "FEDERATION.md" "$pkgdir/usr/share/doc/$pkgname/FEDERATION.md"
  install -vDm0644 "README.md"     "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# eof
