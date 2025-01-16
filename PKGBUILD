# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='tootik'
pkgname="${_pkgname}-git"
pkgver=0.15.1.r1.g6ec6cac
pkgrel=1
pkgdesc='A federated nanoblogging service with a Gemini frontend (latest commit)'
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/dimkr/tootik'
license=('Apache-2.0')  # SPDX-License-Identifier: Apache-2.0
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('glibc')
makedepends=('git' 'go')
source=("git+$url.git")
options=('lto')
sha256sums=('SKIP')

pkgver() {
  test -d "./$_pkgname" && cd "$_pkgname"

  git describe --long --tags \
  | sed 's/^v//;s/-rc\d*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  mkdir -p build
  go mod tidy
  go generate ./migrations
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

  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  TOOTIK_VERSION=$(pkgver)

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-X github.com/dimkr/tootik/buildinfo.Version=$TOOTIK_VERSION -linkmode external" \
    -mod=readonly \
    -modcacherw \
    -tags fts5 \
      ./cmd/tootik
}

check() {
  cd "$_pkgname"

  # NOP for now
  : go test ./...
}

package() {
  cd "$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/bin" \
    ./tootik
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ./*.md
}

# eof
