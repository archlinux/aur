# Maintainer Mariah Carey <mariahscarycarey@mariahscarycarey.org>
# Originally maintained by Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributions by Thomas Sowell <tom@fancydriving.org>
pkgname=vboot-utils
pkgver=148.16640
_tag=release-R${pkgver/\./-}.B
pkgrel=1
pkgdesc='Chromium OS verified boot utilities'
arch=(i686 x86_64)
url='https://chromium.googlesource.com/chromiumos/platform/vboot_reference'
license=('BSD')
depends=(libutil-linux openssl libzip chromeos-flashrom-git cbfstool)
makedepends=(git libyaml trousers)
source=(git+https://chromium.googlesource.com/chromiumos/platform/vboot_reference#branch=${_tag})
sha256sums=('SKIP')

build() {
  cd vboot_reference
  make all WERROR=
}

check() {
  cd vboot_reference
  export PATH="$PATH:$(pwd)/build/futility"
  make runtests WERROR=
}

package() {
  cd vboot_reference
  make install DESTDIR="$pkgdir" MINIMAL=1
  install -d "$pkgdir"/usr/share/vboot/
  cp -r tests/devkeys "$pkgdir"/usr/share/vboot/devkeys
  install -m 644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
