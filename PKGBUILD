# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='mdviewer'
pkgname="${_pkgname}-git"
pkgver=0.1.1.r23.gffd5000
pkgrel=2
pkgdesc='Rendered display of markdown on terminal (latest git commit)'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/noborus/mdviewer'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=("$_pkgname")
conflicts=("${provides[@]}")
depends=('glibc')
makedepends=('git' 'go')
source=("git+$url.git")
options=('lto')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/-rc\d*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  mkdir -p build
  go mod tidy
}

build() {
  cd "$_pkgname"

  _pkgver=$(git describe --tags --abbrev=0 --always)
  _pkgrev=$(git rev-parse --verify --short HEAD)

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
    -ldflags="-linkmode=external -X main.Version=$_pkgver -X main.Revision=$_pkgrev" \
    -mod=readonly -modcacherw \
    -o build
}

check() {
  cd "$_pkgname"

  go test ./...
}

package() {
  cd "$_pkgname"

  install -vDm0755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -vDm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm0644 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
