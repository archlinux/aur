# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='ryelang'
pkgname="$_pkgname-git"
pkgdesc='Rye — a programming language trying to be flexible about expression, but strict about state (development version)'
pkgver=0.2.7.r1.ga4a20ae
pkgrel=1
url='https://ryelang.org/'
_url='https://github.com/refaktor/rye'
install="$pkgname.install"
arch=('aarch64' 'x86_64')
license=('BSD-3-Clause')
makedepends=('git' 'go')
depends=('glibc')
optdepends=(
  'python-beautifulsoup4: needed for some of the examples'
  'python-colorama: needed for some of the examples'
  'python-openai: needed for some of the examples'
  'python-requests: needed for some of the examples'
  'python-rich: needed for some of the examples'
)
provides=('ryelang')
conflicts=("${provides[@]}")
source=("git+$_url.git")
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

  cd "examples/mqtt" && \
  sed -i 's|#!/usr/bin/env rye$|#!/usr/bin/ryelang|g' \
    publisher.rye subscriber.rye
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
  install -Dm0755 -t "$pkgdir/usr/bin" bin/ryelang

  # README and examples
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  cp -fa examples    "$pkgdir/usr/share/doc/$pkgname/"

  # license
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # Symlinks for convenience
  for _dir in doc licenses; do
    pushd "$pkgdir/usr/share/$_dir"
    ln -sr "$pkgname" "$_pkgname"
    popd
  done > /dev/null
}

# eof
