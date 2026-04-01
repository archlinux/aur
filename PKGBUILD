# shecllcheck shell=bash
# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Damien Robert <damien {dot} olivier {dot} robert {plus} archlinux {at} gmail {dot} com>

pkgname=uni
pkgver=2.9.0
pkgrel=4
pkgdesc='Query the Unicode database from the commandline, with good support for emojis'
url='https://github.com/arp242/uni'
arch=('aarch64' 'x86_64')
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=('go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dc595807a0ab875111dafd55be9f3de116cbea652216f9d0082d03dddb3d83be')
install="$pkgname.install"

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
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
  export CGO_LDFLAGS="$LDFLAGS"

  _opts=(
    -buildmode=pie
    -ldflags="-linkmode=external"
    -mod=readonly
    -modcacherw
    -trimpath
  )
  go build "${_opts[@]}" -o "$pkgname" .
}

check() {
  cd "$pkgname-$pkgver"

  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" "$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CHANGELOG.md README.md dmenu-uni uni.vim
}

# eof
