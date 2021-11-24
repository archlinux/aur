# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=ghostery-dawn-bin
_vendorname=ghostery
pkgver=2021.9
_builddate=2021-09-15
pkgrel=1
pkgdesc="Privacy aware web browser from Ghostery (binary release)."
arch=('x86_64')
url="https://www.ghostery.com/dawn"
license=('MPL2')
provides=('ghostery-dawn')
conflicts=('ghostery-dawn')
depends=(dbus-glib
	 gtk2
	 gtk3
	 libxt
	 nss)
optional=('firejail')
install=install

source=("https://github.com/ghostery/user-agent-desktop/releases/download/${_builddate}/Ghostery-${pkgver}.en-US.linux-x86_64.tar.bz2"
	"https://raw.githubusercontent.com/ghostery/user-agent-desktop/master/LICENSE"
        "ghostery.profile")
sha256sums=('1f80432306c3e675dd26ef82f156087ded71ba9603a901afa230a738c4bcf2c3'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
            'dbdfb7e32bb874d6b0c67b10524508620e2137662b7f928750f41f0df926040f')

prepare() {
  cd $srcdir
  tar xjf Ghostery-${pkgver}.en-US.linux-x86_64.tar.bz2
}

package() {
  cd $srcdir

  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${_vendorname}/LICENSE
  install -d -m755 ${pkgdir}/usr/lib
  cp -R Ghostery ${pkgdir}/usr/lib/${_vendorname}/

  install -D -m644 ghostery.profile ${pkgdir}/etc/firejail/ghostery.profile

  install -d -m755 ${pkgdir}/usr/bin
  printf '#!/bin/sh
exec /usr/lib/ghostery/Ghostery "$@"' > ${pkgdir}/usr/bin/ghostery
  chmod 755 ${pkgdir}/usr/bin/ghostery
}
