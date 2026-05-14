# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='wiki-go'
pkgdesc='A modern, feature-rich, databaseless flat-file wiki platform'
pkgver=1.8.9
pkgrel=2
url='https://github.com/leomoon-studios/wiki-go'
changelog="$pkgname.changelog"
arch=('aarch64' 'x86_64')
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
makedepends=('go')
depends=('glibc')
optdepends=('python: needed to run the notion-to-wikigo script')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0bcc4863a64e04dd3191eb9ac5f0199cef1c3dc71c9c628a89b32a713f03155a')

prepare() {
  cd "$pkgname-$pkgver"

  mkdir -p build
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

  install -Dm0755 -t "$pkgdir/usr/bin" build/wiki-go
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/notion-import" \
    tools/notion-import/*.{md,py}

  cp -fa demo-site-files "$pkgdir/usr/share/doc/$pkgname/"
}

# eof
