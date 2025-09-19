# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='ryelang'
pkgname="${_pkgname}-git"
pkgver=0.0.84.r0.g8c56efd
pkgrel=1
pkgdesc='Rye — a programming language trying to be flexible about expression, but strict about state (development version)'
arch=('aarch64' 'x86_64')
url='https://ryelang.org/'
_url='https://github.com/refaktor/rye'
license=('BSD-3-Clause')  # SPDX-License-Identifier: BSD-3-Clause
provides=('ryelang')
conflicts=("${provides[@]}")
depends=('glibc')
makedepends=('git' 'go')
source=("git+$_url.git")
install="$pkgname.install"
sha256sums=('SKIP')

pkgver() {
  cd rye

  git describe --tag --long --abbrev=7 2>/dev/null \
  | sed 's/\([^-]*-g\)/r\1/;s/^v//;s/-/./g'
}

prepare() {
  cd rye

  git clean -dfx
  go mod tidy
}

build() {
  local _ver=''; _ver=$(pkgver)

  cd rye

  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  _opts=(
    -buildmode=pie
    -ldflags="-linkmode=external -X github.com/refaktor/rye/runner.Version=$_ver"
    -mod=readonly
    -modcacherw
    -trimpath
    -tags=seccomp
  )
  go build "${_opts[@]}" -o bin/ryelang
}

check() {
  cd rye

  bin/ryelang -version
}

package() {
  cd rye

  # executable
  install -vDm0755 -t "$pkgdir/usr/bin" bin/ryelang

  # README and examples
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  cp -vfa examples "$pkgdir/usr/share/doc/$pkgname/"

  # license
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# eof
