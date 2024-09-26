# $Id$
# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
pkgname=pcmciautils
pkgver=018
pkgrel=9
pkgdesc="Utilities for inserting and removing PCMCIA cards"
arch=('i486' 'i686' 'pentium4' 'x86_64')
url="http://kernel.org/pub/linux/utils/kernel/pcmcia/pcmcia.html"
license=('GPL')
groups=('base')
depends=('systemd' 'sysfsutils')
conflicts=('pcmcia-cs')
source=(https://kernel.org/pub/linux/utils/kernel/pcmcia/${pkgname}-${pkgver}.tar.{xz,sign}
        initcpio-install-pcmcia)
options=(!makeflags)
sha512sums=('69a01cb4d6cefc4bcb31309fafbd76f937dd0599fbd097a5f22d76d3bc4eeddfccd16bddf42d8e079b323bd8eb62f4b0b25e1da3755664bd01cb2ccbf939c7cf'
            'SKIP'
            '8e486c7432264bdce6698c3831f89b1473400b99dc5aad70df70b2b01cd4219066595fe3f7bc062c56cc2487ad9d65bb6d27d843e20ebfb03e5479f69a9d5299')
validpgpkeys=('DD46DC35691C79509D15F58CFEF39108F6FD2C20')
makedepends=('sysfsutils')

build() {
  cd "$pkgname-$pkgver"
  sed -i -e 's,/lib/udev,/usr/lib/udev,g' Makefile
  sed -i -e 's,/sbin,/usr/bin,g' Makefile
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install

  # install the mkinitpcio hook
  install -Dm644 initcpio-install-pcmcia "$pkgdir/usr/lib/initcpio/install/pcmcia"
}
