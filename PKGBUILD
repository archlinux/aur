# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Alkindi42

pkgname='dasel'
pkgdesc='Select, put and delete data from JSON, TOML, XML, YAML, HCL, and INI files with a single command-line tool'
pkgver=3.4.1
pkgrel=1
url='https://github.com/TomWright/dasel'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=('go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

# Used in LDFLAGS (although no longer used by dasel v3+)
_majver="${pkgver/[.]*/}"

prepare() {
  cd "$pkgname-$pkgver"

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
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  _opts=(
    -buildmode=pie
    -ldflags="-linkmode=external -X github.com/tomwright/dasel/v$_majver/internal.Version=$pkgver"
    -mod=readonly
    -modcacherw
    -trimpath
  )
  go build "${_opts[@]}" -o dasel ./cmd/dasel/main.go
}

check() {
  cd "$pkgname-$pkgver"

  : go test ./...

  printf 'dasel v%s\n' "$(./dasel version)"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" dasel
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGELOG,CODE_OF_CONDUCT,CONTRIBUTING,README}.md
}

sha256sums=(
  '7fb73efd7378a784ce5cda960930ef8da01a9966e42ecc8904713a18b65e8f1a'
)
b2sums=(
  'a4214b9ab7df549fd2271e5ec41596d42c1fc5da1ff6894773506973a37917c16c7ea8b85a7ab6f2dbf866a07afd0873cbbcb35a43840d310e0f0c3c8e5d194a'
)

# eof
