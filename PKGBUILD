# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>
# Contributor: Shawn Nock <shawn@monadnock.ca>
# -*- sh -*-

pkgname='littlefs-fuse'
pkgver=2.7.10
pkgrel=1
pkgdesc='A FUSE wrapper that puts the littlefs in user-space'
url='https://github.com/littlefs-project/littlefs-fuse'
arch=('aarch64' 'x86_64')
license=('BSD-3-Clause')  # SPDX-License-Identifier: BSD-3-Clause
depends=('fuse2' 'glibc')
options=('lto')
source=("littefs-$pkgver.tar.gz::https://github.com/littlefs-project/${pkgname}/archive/v${pkgver}.tar.gz")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Make sure the binary has “FULL RELRO”:
  # shellcheck disable=SC2016
  sed -i '/^ifdef DEBUG/i override CFLAGS += $(LDFLAGS)' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

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

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -vDm0755 lfs        "$pkgdir/usr/bin/lfs"
  install -vDm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -vDm0644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=(
  '26c5a5d1974af5efdfd55c165ec41877cdff801380d91743a747774a847cab9b'
)
b2sums=(
  '9e4013cefcb904f28622f8bad56167c6b56c4789df4e09b22a570b3b6a3ec60a4b7a042b33d95bdcc582e2a2580638c6905c905773be9e368d681c36d07fce59'
)

# eof
