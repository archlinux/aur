# Maintainer: Maik Broemme <mbroemme@libmpq.org>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
pkgname="dahdi-tools"
pkgdesc="DAHDI tools for Asterisk (Digium, OpenVox, Allo and Yeastar cards)"
pkgver=2.11.0
pkgrel=1
arch=("i686" "x86_64")
url="http://www.asterisk.org/"
license=("LGPLv2")
depends=("dahdi-linux" "libusb" "perl")
backup=(
  "etc/dahdi/genconf_parameters"
  "etc/dahdi/system.conf"
)
source=(
  "http://downloads.asterisk.org/pub/telephony/dahdi-tools/${pkgname}-${pkgver}.tar.gz"
  "http://mirror.netcologne.de/gentoo/distfiles/gentoo-dahdi-tools-patchset-0.4.tar.bz2"
)
sha256sums=(
  "0075b34c698fea6be8f1bf0738953225caad0e37c831b95ef368b908217241e1"
  "71642a87e566220c7e7f908adb25dadcf87ff62a23150a6e6074708fd91297b1"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # enable additional drivers.
  patch -Np1 -i "${srcdir}/dahdi-tools-patchset/01-blacklist-non-digium-modules.diff"

  # compile.
  unset CFLAGS
  unset LDFLAGS
  ./configure --sbindir=/usr/bin --with-udevrules=/usr/lib/udev/rules.d
  make DESTDIR="${pkgdir}" all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # install.
  make DESTDIR="${pkgdir}" install
  install -D -m 0644 xpp/genconf_parameters "${pkgdir}/etc/dahdi/genconf_parameters"

  # cleanup installation.
  cp "${pkgdir}/etc/dahdi/system.conf.sample" "${pkgdir}/etc/dahdi/system.conf"
  mv "${pkgdir}/usr/lib/udev/rules.d/xpp.rules" "${pkgdir}/usr/lib/udev/rules.d/98-xpp.rules"
  rm "${pkgdir}/usr/lib/udev/rules.d/dahdi.rules"
}
