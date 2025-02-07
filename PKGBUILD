# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# -*- mode: sh -*-

pkgname=fuzzynote
pkgver=0.25.5
pkgrel=3
_pkgdate=1669972080
pkgdesc='Terminal-based, CRDT-backed, local-first, collaborative note-taking'
arch=('aarch64' 'x86_64')
url='https://github.com/Sambigeara/fuzzynote'
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
makedepends=('go')
depends=('glibc')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Sambigeara/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)

prepare() {
  cd "$pkgname-$pkgver"

  go mod tidy
}

build() {
  cd "$pkgname-$pkgver"

  case "Z${CARCH:-unknown}" in
    'Zx86_64' )
      # RFC-0023: https://rfc.archlinux.page/0023-pack-relative-relocs/
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
      # Fix shadow stack error message
      export LDFLAGS="$LDFLAGS -Wl,-z,shstk"
    ;;
    * ) : pass ;;
  esac

  # https://wiki.archlinux.org/title/Go_package_guidelines
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.version=$pkgver -X main.date=$_pkgdate" \
    -mod=readonly \
    -modcacherw \
    -o bin/fzn ./cmd/term
}

package() {
  cd "$pkgname-$pkgver"

  install -vDm0755 bin/fzn   "$pkgdir/usr/bin/fzn"
  install -vDm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=(
  '342d92973ac0f06a7cda5cdda1049cc7b295478ecfcc7af550ea8c47ecf164c8'
)
b2sums=(
  'a34c11c62f7c72ef72e39ae8e8ccbf8ddb5be5f73f9e574c7102aa9002651b6a8da80cd140757775e99bcb20a511f4a300c4d454b2e6645429309900afb46ae7'
)

# eof
