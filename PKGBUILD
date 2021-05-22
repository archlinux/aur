# Maintainer: <software+aur@disavowed.jp>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
pkgname="dahdi-tools"
pkgdesc="DAHDI tools for Asterisk (Digium, OpenVox, Allo and Yeastar cards)"
pkgver=3.1.0
pkgrel=2
arch=("i686" "x86_64")
url="http://www.asterisk.org/"
license=("LGPLv2")
depends=("libusb" "perl") # remove dahdi-linux until that package is fixed
backup=(
  "etc/dahdi/genconf_parameters"
  "etc/dahdi/system.conf"
)
source=(
  "https://downloads.asterisk.org/pub/telephony/dahdi-tools/dahdi-tools-3.1.0.tar.gz"
  "patch-xpp_mpptalk.c"
  "patch-hotplug_dahdi_span_config"
)
sha256sums=(
  "ea852ebd274ee1cc90ff5e4ac84261b0b787b1a74e8b76ad659bc9ec4f77e67e"
  "0e965748c679f99c21123338e3371a5d88737d4a128349bdfea3c278ab15de79"
  "ba3f5d9cc323b6d3544283b9c54b52aaa42b15a7946f0894292c5ed5425ce079"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  for i in `ls "${srcdir}"/patch-*`; do patch -p0 -i "${i}"; done

  # bootstrap.sh is broken, so do this manually
  rm -rf autom4te*.cache
  aclocal && \
	autoheader && \
	libtoolize --force --copy && \
	automake --include-deps --add-missing --foreign --copy && \
	autoconf

  ./configure --sbindir=/usr/bin --with-udevrules=/usr/lib/udev/rules.d
  make DESTDIR="${pkgdir}" all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # install.
  make DESTDIR="${pkgdir}" install
  install -D -m 0644 xpp/genconf_parameters "${pkgdir}/etc/dahdi/genconf_parameters"

  # cleanup installation.
  #cp "${pkgdir}/etc/dahdi/system.conf.sample" "${pkgdir}/etc/dahdi/system.conf"
  #mv "${pkgdir}/usr/lib/udev/rules.d/xpp.rules" "${pkgdir}/usr/lib/udev/rules.d/98-xpp.rules"
  #rm "${pkgdir}/usr/lib/udev/rules.d/dahdi.rules"
}
