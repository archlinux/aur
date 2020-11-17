# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>

# BUILD INSTRUCTIONS
#
# The source for `blhost` is available behind a login wall.
#
# By default, `nxp-dlagent` is used to fetch, you can avoid the prompts
# by setting `NXP_USERNAME` and `NXP_PASSWORD` for your account.
#
# Alternatively, visit <https://www.nxp.com/webapp/Download?colCode=blhost_2.6.2&appType=license>,
# accept the license terms, and place the downloaded ZIP file in the same directory as this PKGBUILD.

pkgname=blhost
pkgver=2.6.2
pkgname_pkgver=${pkgname}_$pkgver
pkgrel=3
pkgdesc="Bootloader Host Application for NXP MCUs"
url="https://www.nxp.com/design/software/development-software/mcuxpresso-software-and-tools-/mcuboot-mcu-bootloader-for-nxp-microcontrollers:MCUBOOT"
# could also support 32-bit with some more work
arch=(x86_64)
license=(custom:NXP)
makedepends=(nxp-dlagent)
depends=()

DLAGENTS=("nxp::/usr/bin/nxp-dl %u")
source=("blhost_2.6.2.zip"::"nxp://blhost_2.6.2")
sha256sums=("2e7aa1aa430fbbe01093412f97d618e1773ea40f2f6f24ffcc1e26102d36eb2b")

# File common.mk seems to be used only to prettify compile output
# See e.g. the version in the ZIP for NXP_Kinetis_Bootloader_2_0_0 from the same download page

prepare() {
  makefile=$srcdir/$pkgname_pkgver/proj/blhost/gcc/Makefile
  # install -D common.mk -t $srcdir/${pkgname}_$pkgver/mk
  sed -i '/mk\/common.mk/d' $makefile
  # bug in the Makefile
  sed -i 's|/tools/blhost/src/blhost.cpp|/proj/blhost/src/blhost.cpp|g' $makefile
}

build() {
  cd $srcdir/$pkgname_pkgver/proj/$pkgname/gcc
  make all
}

package() {
  bld=$srcdir/$pkgname_pkgver/proj/blhost/gcc/Release
  install -Dm 755 $bld/$pkgname -t $pkgdir/usr/bin

  # documentation
  install -Dm 644 \
    $srcdir/$pkgname_pkgver/docs/"blhost User's Guide.pdf" \
	$pkgdir/usr/share/doc/$pkgname/MCUBLHOSTUG-rev7-20200429.pdf
}
