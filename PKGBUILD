# Maintainer: Matias <matiase@archlinux.org>
# Contributor: <software+aur@disavowed.jp>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>

pkgname=dahdi-tools
pkgdesc='DAHDI tools for Asterisk (Digium, OpenVox, Allo and Yeastar cards)'
pkgver=3.4.0
pkgrel=1
arch=(x86_64)
url=https://www.asterisk.org
license=(LGPL-2.1-only)
depends=(dahdi-linux libnewt libusb perl)
makedepends=(autoconf automake libtool libusb-compat)
backup=(
  etc/dahdi/genconf_parameters
  etc/dahdi/system.conf
)
source=(
  "https://downloads.asterisk.org/pub/telephony/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
  9b9cd53ba51f4a03baf58bbcecda6d7bd7024e3ea3f7e0b864f666bdd794fcc5
)

prepare() {
  cd "${pkgname}-${pkgver}"

  # bootstrap.sh is broken, so do this manually
  rm -rf autom4te*.cache
  aclocal
  autoheader
  libtoolize --force --copy
  automake --include-deps --add-missing --foreign --copy
  autoconf
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --sbindir=/usr/bin --with-udevrules=/usr/lib/udev/rules.d
  make all
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -D -m 0644 system.conf.sample "${pkgdir}/etc/dahdi/system.conf"
  install -D -m 0644 xpp/genconf_parameters "${pkgdir}/etc/dahdi/genconf_parameters"
}
