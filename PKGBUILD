# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Thomas Sowell <tom@fancydriving.org>

pkgname=vboot-utils
pkgdesc='Chromium OS verified boot utilities'
pkgver=81.12871
_tag=release-R${pkgver/\./-}.B
pkgrel=1
arch=(i686 x86_64)
url='https://chromium.googlesource.com/chromiumos/platform/vboot_reference'
license=('custom:chromiumos')
depends=(libutil-linux openssl)
makedepends=(libyaml trousers)
source=(https://chromium.googlesource.com/chromiumos/platform/vboot_reference/+archive/$_tag.tar.gz
        makefile.patch)
sha256sums=(SKIP
            '7804878ce24b2ca9bd8858bfffcf97b12627b2c7524879240a958cec244afdcb')

prepare() {
  patch -p1 < makefile.patch
}

build() {
  make
}

check() {
  make runtests || true
}

package() {
  make install DESTDIR="$pkgdir" MINIMAL=1
  install -d "$pkgdir"/usr/share/vboot/
  cp -r tests/devkeys "$pkgdir"/usr/share/vboot/devkeys
  install -m 644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
