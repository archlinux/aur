# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='abs-lang'
pkgname="$_pkgname-git"
pkgver=2.7.1.r2.g1121328
pkgrel=1
pkgdesc='ABS programming language: the joy of shell scripting (build from latest git commit)'
arch=('aarch64' 'x86_64')
url='https://github.com/abs-lang/abs'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('git' 'go')
source=("git+$url")
provides=("${_pkgname%-lang}" "$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')
options=('lto')

prepare() {
  cd "${_pkgname%-lang}"

  git clean -dfx
  go mod tidy
  mkdir -p _build
}

pkgver() {
  cd "${_pkgname%-lang}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname%-lang}"

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

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.Version=$pkgver" \
    -mod=readonly \
    -modcacherw \
    -o _build \
      .
}

package() {
  cd "${_pkgname%-lang}"

  install -vDm0755 -t "$pkgdir/usr/bin" _build/abs
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  cp -vfax examples   "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# eof
