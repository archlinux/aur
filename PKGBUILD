# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Thomas Sowell <tom@fancydriving.org>

pkgname=vboot-utils
pkgdesc='Chromium OS verified boot utilities'
pkgver=84.13099
_tag=release-R${pkgver/\./-}.B
pkgrel=1
arch=(i686 x86_64)
url='https://chromium.googlesource.com/chromiumos/platform/vboot_reference'
license=('custom:chromiumos')
depends=(libutil-linux openssl)
makedepends=(git libyaml trousers)
source=(git+https://chromium.googlesource.com/chromiumos/platform/vboot_reference#branch=$_tag
        fix.patch
        makefile.patch)
sha256sums=('SKIP'
            '1303b8c82e4cec2300d50173d45d892b42579efbdaa5d7ea66704c1916323778'
            '695da021a15d43174a9ac9227ef28f834d6393c7c97750611ac27c6c4ea82dfd')

prepare() {
  cd vboot_reference
  patch -p1 < ../makefile.patch
  patch -p1 < ../fix.patch
}

build() {
  cd vboot_reference
  make
}

check() {
  cd vboot_reference
  make runtests || true
}

package() {
  cd vboot_reference
  make install DESTDIR="$pkgdir" MINIMAL=1
  install -d "$pkgdir"/usr/share/vboot/
  cp -r tests/devkeys "$pkgdir"/usr/share/vboot/devkeys
  install -m 644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
