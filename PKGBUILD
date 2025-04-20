# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='atto'
pkgver=1.6.0
pkgrel=3
pkgdesc='A tiny Nano wallet, focused on ease of use through simplicity'
arch=('x86_64')
url='https://github.com/codesoap/atto'
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=('go')
depends=('glibc')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
options=('lto')

prepare() {
  cd "$pkgname-$pkgver"

  go mod tidy
}

build() {
  cd "$pkgname-$pkgver"

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

  # https://wiki.archlinux.org/title/Go_package_guidelines
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'

  go build ./cmd/atto
  go build ./cmd/atto-safesign
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 atto          "$pkgdir/usr/bin/atto"
  install -Dm0755 atto-safesign "$pkgdir/usr/bin/atto-safesign"
  install -Dm0644 README.md     "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  '6c4c5b57777487114f7b336a1fd8e501a0fe49b164e80f3e30f87ef994f3ebed'
)
b2sums=(
  '677fd1adb69bc2aa604c435f96dfc24465a4f32c8dd5d75f733c4a1bc7047435445856260d42552bb7c0e10a1691596db951bdbb3ac882e7af08b7ef9efb64d4'
)

# eof
