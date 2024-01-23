# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>
# Contributor: Shawn Nock <shawn@monadnock.ca>
# -*- sh -*-

pkgname='littlefs-fuse'
pkgver=2.7.5
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
  sed -i '/^ifdef DEBUG/i override CFLAGS += $(LDFLAGS)' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "${CARCH:-unknown}" in
    'x86_64' | 'i386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm0755 lfs        "$pkgdir/usr/bin/lfs"
  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm0644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=(
  '8f5c80b72c7a87ef49e16c9d3f93007ad8cb87e8c5e2ce69f13c15f5e33531c5'
)
b2sums=(
  'bc25ded1a943fda84ae7f6f473a5973999f6ec6a8db017a9327d8ff07778fca895b077883f1ed822591ba0f61e851940a4175fdd63f1a1492c4d1453edb79f5f'
)

# eof
