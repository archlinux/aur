# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Thomas Sowell <tom@fancydriving.org>

pkgname=vboot-utils
pkgdesc='Chromium OS verified boot utilities'
pkgver=112.15359
_tag=release-R${pkgver/\./-}.B
pkgrel=1
arch=(i686 x86_64)
url='https://chromium.googlesource.com/chromiumos/platform/vboot_reference'
license=('custom:chromiumos')
depends=(libutil-linux openssl libzip flashrom-git)
makedepends=(git libyaml trousers)
source=(git+https://chromium.googlesource.com/chromiumos/platform/vboot_reference#branch=$_tag
        disable-errors.patch)
sha256sums=('SKIP'
            'b70df18064195e2fb9b2d5335ce788d2d1db49ab9981c63367089587c6d697ce')

prepare() {
  cd vboot_reference
  patch -p1 < ../disable-errors.patch
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
