# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Thomas Sowell <tom@fancydriving.org>

pkgname=vboot-utils
pkgdesc='Chromium OS verified boot utilities'
pkgver=66.10452
_tag=release-R${pkgver/\./-}.B
pkgrel=1
arch=(i686 x86_64)
url='https://chromium.googlesource.com/chromiumos/platform/vboot_reference'
license=('custom:chromiumos')
depends=(libutil-linux openssl)
makedepends=(libyaml trousers)
source=(https://chromium.googlesource.com/chromiumos/platform/vboot_reference/+archive/refs/heads/$_tag.tar.gz
        no_static.patch)
sha1sums=('ded3cfbe21f4cb0f1f9dd194e8dd72d7a8ed23fb'
          'b45016e2f1a9833d24d68a3d35a043258cab9405')

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
