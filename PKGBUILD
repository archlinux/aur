# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='wiki-go'
pkgdesc='A modern, feature-rich, databaseless flat-file wiki platform'
pkgver=1.8.3
pkgrel=1
url='https://github.com/leomoon-studios/wiki-go'
arch=('aarch64' 'x86_64')
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
makedepends=('go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('30081e8134c1d718fbbc7771bcf68c5c12df55cbdaf3f9f225d5199374c2a2a1')

prepare() {
  cd "$pkgname-$pkgver"

  mkdir -vp build
  go mod tidy
}

build() {
  cd "$pkgname-$pkgver"

  case "Z$CARCH" in
    'Zaarch64' | 'Zx86_64' )
      export LDFLAGS="$LDFLAGS -Wl,-z,shstk"
    ;;
  esac

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  _opts=(
    -buildmode=pie
    -gcflags=all='-l -B -C'
    -ldflags="-linkmode=external -X wiki-go/internal/version.Version=$pkgver"
    -mod=readonly
    -modcacherw
    -tags='netgo,usergo'
    -trimpath
  )
  go build "${_opts[@]}" -o build/wiki-go .
}

check() {
  cd "$pkgname-$pkgver"

  : go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm0755 -t "$pkgdir/usr/bin" build/wiki-go
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md

  cp -vfa demo-site-files "$pkgdir/usr/share/doc/$pkgname/"
}

# eof
