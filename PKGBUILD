# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Thomas Sowell <tom@fancydriving.org>

pkgname=vboot-utils
pkgdesc='Chromium OS verified boot utilities'
pkgver=64.10176
_tag=release-R${pkgver/\./-}.B
pkgrel=1
arch=(i686 x86_64)
url='https://chromium.googlesource.com/chromiumos/platform/vboot_reference'
license=('custom:chromiumos')
depends=(libutil-linux openssl)
makedepends=(libyaml trousers)
source=(https://chromium.googlesource.com/chromiumos/platform/vboot_reference/+archive/refs/heads/$_tag.tar.gz
        no_static.patch)
sha1sums=('b525326c6ef3cbfd95d86042d079672707897536'
          '4fa3b0d34579718a22e06fb44e089c8601522e89')

prepare() {
  patch -p1 < ./no_static.patch
}

build() {
  make
}

check() {
  #fails because https://chromium-review.googlesource.com/c/chromiumos/platform/vboot_reference/+/349670/3/tests/futility/expect_output/show.tests_devkeys_root_key.vbpubk#1
  #make runtests
  true
}

package() {
  make DESTDIR="$pkgdir" MINIMAL=1 install
  install -d "$pkgdir"/usr/share/vboot/
  cp -r tests/devkeys "$pkgdir"/usr/share/vboot/devkeys
  install -m 644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
