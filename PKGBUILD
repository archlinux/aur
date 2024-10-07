# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Alex Gu <gualse.mail@yandex.com>

pkgname='mycorrhiza'
pkgver=1.15.1
pkgrel=1
pkgdesc='Filesystem and git-based wiki engine written in Go using mycomarkup'
arch=('aarch64' 'armv7h' 'x86_64')
url="https://codeberg.org/bouncepaw/$pkgname"
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
depends=('git' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
options=('lto')

prepare() {
  cd "$pkgname"

  mkdir -p build \
  && go mod tidy
}

build() {
  cd "$pkgname"

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

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.version=$pkgver" \
    -mod=readonly \
    -modcacherw \
    -o build \
     .
}

check() {
  cd "$pkgname"

  build/mycorrhiza -version
}

package() {
  cd "$pkgname"

  install -Dm0755 "build/mycorrhiza"  "$pkgdir/usr/bin/mycorrhiza"
  install -Dm0644 "README.md"         "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 "help/mycorrhiza.1" "$pkgdir/usr/share/man/man1/mycorrhiza.1"
}

sha256sums=(
  'a4f01e5f06421b285d1d9041fc5503cc71383931e337dd9ae8b2b6de166f2364'
)
b2sums=(
  'edba1f275295a39a807532a553dfe6eb8ad3d2e9222561c93dc8b0e530ea2dc7253c6956fde4b3cfdd031a4ea477ac253e46dcfadf72b08b1ac5f9be117c549f'
)

# eof
