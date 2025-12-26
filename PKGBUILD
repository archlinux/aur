# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Alkindi42

pkgname='dasel'
pkgver=3.2.0
pkgrel=1
pkgdesc='Select, put and delete data from JSON, TOML, XML, YAML, HCL, and INI files with a single command-line tool'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

# Used in LDFLAGS (although no longer used by dasel v3+)
_majver="${pkgver/[.]*/}"

prepare() {
  cd "$pkgname-$pkgver"

  go mod tidy
}

build() {
  cd "$pkgname-$pkgver"

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

  install -vDm0755 -t "$pkgdir/usr/bin" dasel
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGELOG,CODE_OF_CONDUCT,CONTRIBUTING,README}.md
}

sha256sums=(
  '8e0c20898ccf24ac9ca2217dec21bc4e0f6a17949431756ea0bce94d55d0cd43'
)
b2sums=(
  '0806262818b452e0a66200bd3d054314ad39fd8eeee90d1c16136ee4fd592403696ee932c5b0e635b4987a2e03b126e97930000fdeae3623f952100eb061171d'
)

# eof
