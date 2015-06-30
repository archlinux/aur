# Maintainer: Maik Broemme <mbroemme@libmpq.org>
pkgname="dahdi-linux"
pkgdesc="DAHDI drivers for Asterisk (Digium, OpenVox, Allo and Yeastar cards)"
pkgver=2.10.1
pkgrel=2
arch=("i686" "x86_64")
url="http://www.asterisk.org/"
license=("LGPLv2")
depends=("linux>=4.0" "linux<4.1")
makedepends=("linux-headers>=4.0" "linux-headers<4.1")
conflicts=("dahdi")
install="${pkgname}.install"
source=(
  "http://downloads.asterisk.org/pub/telephony/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  "oslec.h::http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/drivers/misc/echo/oslec.h?id=refs/tags/v4.0"
  "dahdi-linux-2.10.1-allo.patch"
  "dahdi-linux-2.10.1-openvox-1.patch"
  "dahdi-linux-2.10.1-openvox-2.patch"
  "dahdi-linux-2.10.1-openvox-3.patch"
  "dahdi-linux-2.10.1-yeastar.patch"
  "dahdi-kernel-4.0-1.patch::https://github.com/asterisk/dahdi-linux/commit/1cc0ad510acd404e63923ed3062b9302d53580da.diff"
  "dahdi-kernel-4.0-2.patch::https://github.com/asterisk/dahdi-linux/commit/1559db9d1ae03780788788c07334ca54cdd1253a.diff"
)
sha256sums=(
  "94c532e190fc6372f9731df71f8c590fc6f6f184d5394339ce892ac6788843aa"
  "dc8b86ded9963ad825ea7a18bdbcfb0a4758bbc9dcac5fc9cd9bcf58074a0748"
  "626c63d2baad6d7236e98904002d447eefc055b051a87264c4e0175446be7625"
  "5e1e109039395a09412a6639fd25c5e70cc353ebc1c7b1ef26709bec1f22c6cb"
  "941c8fba7516b1f8fe961fe31087894a556243f2e28fdcbbf25ae0ea962bfd13"
  "1e06d18f7a995ac2534fc0109f6f170981cd4be9ebc6e69779552a0b2ebd5634"
  "1830ed6696f6c28f61943d5f037e2f6306237a4a7ba0b6b1c2d5b801378413b8"
  "ac261ef988e16ef348f9b67e0ccf9cded32808c90b487cc13d8422252516e808"
  "4cf5aaa0c288661ade991122fbcd5c5dca7f2a3fa4cfad32d98b807b6641d9f1"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # enable additional drivers.
  patch -Np1 -i "${srcdir}/dahdi-linux-2.10.1-allo.patch"
  patch -Np1 -i "${srcdir}/dahdi-linux-2.10.1-openvox-1.patch"
  patch -Np1 -i "${srcdir}/dahdi-linux-2.10.1-openvox-2.patch"
  patch -Np1 -i "${srcdir}/dahdi-linux-2.10.1-openvox-3.patch"
  patch -Np1 -i "${srcdir}/dahdi-linux-2.10.1-yeastar.patch"

  # linux >= 4.0 patches.
  patch -Np1 -i "${srcdir}/dahdi-kernel-4.0-1.patch"
  patch -Np1 -i "${srcdir}/dahdi-kernel-4.0-2.patch"

  # enable dahdi oslec with upstream echo module.
  mkdir -p drivers/staging/echo
  cp "${srcdir}/oslec.h" drivers/staging/echo/oslec.h
  sed 's|ifneq (,$(wildcard $(src)/../staging/echo/echo.c))|ifneq (,$(wildcard $(src)/../staging/echo/oslec.h))|' -i drivers/dahdi/Kbuild
  sed '\|obj-m += ../staging/echo/echo.o|d' -i drivers/dahdi/Kbuild

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
  cd drivers
  find . -name "*.ko" -exec gzip "{}" \; -exec install -D -m 0644 "{}.gz" "${pkgdir}/usr/lib/modules/extramodules-4.0-ARCH/{}.gz" \;
}
