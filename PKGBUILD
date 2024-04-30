# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>
# Contributor: Shawn Nock <shawn@monadnock.ca>
# -*- sh -*-

pkgname='littlefs-fuse'
pkgver=2.7.8
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
  '46db1a467c67e2696da9070087c96e5bc9b7236ee0c0f0417add3a0a8f82db41'
)
b2sums=(
  '7e4d675a7d62a495bc3bc43ba72ffdfc5ba757a65ea94d765277acff02619e2728901385911e8c266ac2f170f4625c993ecbfee53e1032113628e3d11b790688'
)

# eof
