# Maintainer: Maik Broemme <mbroemme@libmpq.org>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
pkgname="dahdi-linux"
pkgdesc="DAHDI drivers for Asterisk (Digium, OpenVox, Allo and Yeastar cards)"
pkgver=2.10.2
pkgrel=2
arch=("i686" "x86_64")
url="http://www.asterisk.org/"
license=("LGPLv2")
depends=("linux>=4.2" "linux<4.3")
makedepends=("linux-headers>=4.2" "linux-headers<4.3")
conflicts=("dahdi")
install="${pkgname}.install"
source=(
  "http://downloads.asterisk.org/pub/telephony/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  "http://mirror.netcologne.de/gentoo/distfiles/gentoo-dahdi-patchset-1.2.3.tar.bz2"
  "http://www.junghanns.net/downloads/jnet-dahdi-drivers-1.0.14.tar.gz"
)
sha256sums=(
  "6270444cb9b345941267b162038cc45f5ef4485139176e88e2c4d22fa35a2c59"
  "4bd57ffa61d718b847080af274fdf2414bf83a6567dffa05786e3e9b900cdf5f"
  "c71d1ac29c78511b59914cc9aa1798529ae7b344cdc8403a797dbcddbe486974"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # junghanns hw.
  cp "${srcdir}/jnet-dahdi-drivers-1.0.14/cwain/"*.[ch] drivers/dahdi
  cp "${srcdir}/jnet-dahdi-drivers-1.0.14/qozap/"*.[ch] drivers/dahdi
  cp "${srcdir}/jnet-dahdi-drivers-1.0.14/ztgsm/"*.[ch] drivers/dahdi

  # enable additional drivers.
  patch -Np1 -i "${srcdir}/dahdi-patchset/01-no-depmod.diff"
  patch -Np1 -i "${srcdir}/dahdi-patchset/02-parallel-make.diff"
  patch -Np1 -i "${srcdir}/dahdi-patchset/03-grsecurity-no-constify.diff"
  patch -Np1 -i "${srcdir}/dahdi-patchset/04-dahdi-irq-shared.diff"
  patch -Np1 -i "${srcdir}/dahdi-patchset/98-non-digium-hardware-and-oslec.diff"
  patch -Np1 -i "${srcdir}/dahdi-patchset/99-irqf-disabled.diff"

  # fix wrong installation paths.
  sed 's,$(DESTDIR)/lib/firmware,$(DESTDIR)/usr/lib/firmware,g' -i drivers/dahdi/firmware/Makefile
  sed 's,$DESTDIR/lib/firmware,$DESTDIR/usr/lib/firmware,g' -i build_tools/install_firmware

  # compile.
  make -j1 DESTDIR="${pkgdir}" all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install-firmware
  make DESTDIR="${pkgdir}" install-include
  make DESTDIR="${pkgdir}" install-xpp-firm

  # beautifying firmware directory.
  rm "${pkgdir}/usr/lib/firmware/".d*

  cd drivers
  find . -name "*.ko" -exec gzip "{}" \; -exec install -D -m 0644 "{}.gz" "${pkgdir}/usr/lib/modules/extramodules-4.2-ARCH/{}.gz" \;
}
