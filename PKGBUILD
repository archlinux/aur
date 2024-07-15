# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

_pkgname='tget'
pkgname="${_pkgname}-git"
pkgver=0.1.1.r1.g77add45
pkgrel=1
pkgdesc='Like wget but for torrents (latest commit)'
arch=('aarch64' 'x86_64')
url='https://github.com/sweetbbak/tget'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=("$_pkgname")
conflicts=('nodejs-tget' "$_pkgname")
depends=('gcc-libs' 'glibc')
makedepends=('git' 'go')
source=("git+$url.git")
options=('lto')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags \
  | sed 's/^[Vv]//;s/-rc\d*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

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

  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external" \
    -mod=readonly -modcacherw \
    ./cmd/tget
}

check() {
  cd "$_pkgname"

  go test ./...

  ./tget --version
}

package() {
  cd "$_pkgname"

  install -vDm0755 "$_pkgname"         "$pkgdir/usr/bin/$_pkgname"
  install -vDm0644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -vDm0644 "README.md"         "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm0644 "LICENSE"           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
