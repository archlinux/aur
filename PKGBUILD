# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

_pkgname='xmpp-dns'
pkgname="${_pkgname}-git"
pkgver=0.4.5.r9.g458fb74
pkgrel=2
pkgdesc='Command-line tool to check XMPP SRV records (development version)'
arch=('aarch64' 'x86_64')
url='https://salsa.debian.org/mdosch/xmpp-dns'
license=('BSD-2-Clause')  # SPDX-License-Identifier: BSD-2-Clause
provides=('xmpp-dns')
conflicts=("${provides[@]}")
depends=('glibc')
makedepends=('git' 'go')
source=("git+$url.git")
options=('lto')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  git clean -dfx

  mkdir -p build
  go mod tidy
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
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external" \
    -mod=readonly -modcacherw \
    -o build
}

check() {
  cd "$_pkgname"

  go test ./...
}

package() {
  cd "$_pkgname"

  install -vDm0755 "build/$_pkgname" -t "$pkgdir/usr/bin/"
  install -vDm0644 "$srcdir/$_pkgname/man/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# eof
