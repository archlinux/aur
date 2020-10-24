# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>

# BUILD INSTRUCTIONS
#
# The source for `elftosb` is available behind a login wall.
#
# By default, `nxp-dlagent` is used to fetch, you can avoid the prompts
# by setting `NXP_USERNAME` and `NXP_PASSWORD` for your account.
#
# Alternatively, visit <https://www.nxp.com/webapp/Download?colCode=elftosb_5.1.19&appType=license>,
# accept the license terms, and place the downloaded ZIP file in the same directory as this PKGBUILD.

pkgname=elftosb
pkgver=5.1.19
pkgname_pkgver=${pkgname}_$pkgver
pkgrel=3
pkgdesc="ELF to Secure Binary Utility for NXP MCUs"
url="https://www.nxp.com/design/software/development-software/mcuxpresso-software-and-tools-/mcuboot-mcu-bootloader-for-nxp-microcontrollers:MCUBOOT"
# could also support 32-bit with some more work
arch=(x86_64)
license=(BSD custom:NXP)
makedepends=(nxp-dlagent)
depends=()

DLAGENTS=(
  "nxp::/usr/bin/nxp-dl %u"
  # need to add https dlagent back since we are overriding DLAGENTS
  'https::/usr/bin/curl -gqb "" -fLC - --retry 3 --retry-delay 3 -o %o %u'
)
source=(
  "elftosb_5.1.19.zip"::"nxp://elftosb_5.1.19"
  # This is `v16 October 2020` as of 2020-10-24
  "https://www.nxp.com/docs/en/disclaimer/LA_OPT_NXP_SW.html"
)
sha256sums=(
  "c5becbe8905ce4002c4bd351ecb585125cf8090c1ae043b324432598707a5d2b"
  "1cdeb68e00f98a2764b918c2fa6f2a02c93b03354e84051473f608d79844efde"
)


build() {
  cd $srcdir/$pkgname_pkgver/proj/$pkgname
  make all

  # TODO: there is also source code for
  # - encryptgpk
  # - keygen
  # - sbtool
  # for which the makefile is missing. However, there are .vcxproj files
  # that seem simple enough to convert to make.
}

package() {
  # binary
  bld=$srcdir/$pkgname_pkgver/proj/$pkgname/bld/linux
  install -Dm 755 $bld/elftosb -t $pkgdir/usr/bin

  # licenses:
  # - source code itself is BSD-3-Clause, as stated in `SW-Content-Register.txt`
  # - no file with the BSD copyright line is included, source files have copyright headers
  # - for production use, however, Section 2.3 of the LA_OPT_NXP_SW software license applies
  # - subcomponents have various different licenses (MIT, Public Domain, BSD-2-clause, Apache-2.0,...
  install -Dm 644 $srcdir/LA_OPT_NXP_SW.html -t $pkgdir/usr/share/licenses/$pkgname/
  install -Dm 644 $srcdir/$pkgname_pkgver/SW-Content-Register.txt -t $pkgdir/usr/share/licenses/$pkgname/

  # documentation
  install -Dm 644 \
	$srcdir/$pkgname_pkgver/docs/"elftosb User's Guide.pdf" \
	$pkgdir/usr/share/doc/$pkgname/MBOOTELFTOSBUG-rev7-202002.pdf

}
