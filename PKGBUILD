# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='jorge'
pkgname="${_pkgname}-git"
pkgver=0.9.1.r0.g2e9a364
pkgrel=1
pkgdesc='Personal site generator with org-mode support (latest commit)'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/facundoolano/jorge'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('glibc')
makedepends=('git' 'go')
source=("git+$url.git")
options=('lto')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags \
  | sed 's/^v//;s/-rc\d*//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    -mod=readonly \
    -modcacherw \
    -o build
}

check() {
  cd "$_pkgname"

  go test ./...

  build/jorge --version
}

package() {
  cd "$_pkgname"

  install -vDm0755 build/jorge "$pkgdir/usr/bin/jorge"
  install -vDm0644 README.md   "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm0644 LICENSE     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
