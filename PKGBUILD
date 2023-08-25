# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

_pkgname='mycorrhiza'
pkgname="$_pkgname-git"
pkgver=1.14.0.r7.gd0be765
pkgrel=1
pkgdesc='Filesystem and git-based wiki engine written in Go using mycomarkup (built from latest commit)'
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/bouncepaw/$_pkgname"
license=('AGPL3')
depends=('git' 'glibc')
makedepends=('git' 'go')
source=("git+$url.git")
provides=('mycorrhiza')
conflicts=('mycorrhiza')
sha256sums=('SKIP')
options=('lto')

prepare() {
  cd "$_pkgname"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  mkdir -p build
  go mod tidy
}

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.version=$pkgver" \
    -mod=readonly \
    -modcacherw \
    -o build \
     .
}

package() {
  cd "$_pkgname"

  install -Dm0755 "build/mycorrhiza"  "$pkgdir/usr/bin/mycorrhiza"
  install -Dm0644 "README.md"         "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 "help/mycorrhiza.1" "$pkgdir/usr/share/man/man1/mycorrhiza.1"
}

# eof
