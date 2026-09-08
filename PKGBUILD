# shellcheck shell=bash
# -*- mode: sh -*-

# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=yarr
pkgdesc='Yet Another RSS Reader: Self-hosted, web-based feed aggregator'
pkgver=2.9
pkgrel=1
url='https://github.com/nkanaev/yarr'
arch=(aarch64 x86_64)
license=(MIT)
depends=(glibc)
makedepends=(git go npm)
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        001-makefile.patch)
sha256sums=('f6e667ec25e836add55b468fa478b089c14b71fea76131e07b429a171c1984e8'
            '0e931187a66b67cdad54aadbc454078ed5a9f7d47db6e9db1a4d80c68d60599c')

_githash=4600a53

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 < "$srcdir/001-makefile.patch"
  go mod download -modcacherw
  npm ci
}

build(){
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=vendor -modcacherw'

  env GITHASH="$_githash" VERSION="$pkgver" make host
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" out/yarr
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" license
  cp -a doc/* "$pkgdir/usr/share/doc/$pkgname/"
}

# eof
