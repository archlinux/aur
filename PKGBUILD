# Maintainer: Aidan Dang <dang at aidan dot gg>
# Contributor: Manuel Domke <manuel-domke at gmx dot org>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgbase=infnoise
pkgname=(infnoise libinfnoise infnoise-tools)
pkgver=0.3.3
pkgrel=1
pkgdesc="Infinite Noise TRNG"
arch=('x86_64')
url="https://github.com/leetronics/infnoise"
license=('custom:CC0 1.0 Universal')
depends=('libftdi')
makedepends=('git' 'sed')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leetronics/infnoise/archive/$pkgver.tar.gz")
b2sums=('f0d72df3dfd53f1f13f4a5c3f96cb911f4dad6268e3c6faf7772294019ab9f959edcbe2d30be387afdc41087e83a201df5aa8c6d0558c8d75dbd8a8f08c530a1')

build() {
  cd $pkgbase-$pkgver/software
  make -f Makefile.linux

  # Build infnoise-tools
  cd tools
  make all
}

package_libinfnoise() {
  pkgdesc="Infinite Noise TRNG library"

  cd $pkgbase-$pkgver
  install -Dm644 "LICENSE"                                     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "software/libinfnoise.h"                      "${pkgdir}/usr/include/libinfnoise.h"
  install -Dm755 "software/libinfnoise.so"                     "${pkgdir}/usr/lib/libinfnoise.so"
}

package_infnoise() {
  pkgdesc="Infinite Noise TRNG driver"
  backup=("etc/infnoise.conf")

  cd $pkgbase-$pkgver
  install -Dm644 "LICENSE"                                     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "software/init_scripts/75-infnoise.rules"     "${pkgdir}/usr/lib/udev/rules.d/75-infnoise.rules"
  install -Dm644 "software/init_scripts/infnoise.conf.systemd" "${pkgdir}/etc/infnoise.conf"
  install -Dm644 "software/init_scripts/infnoise.service.bin"  "${pkgdir}/usr/lib/systemd/system/infnoise.service"
  install -Dm755 "software/infnoise"                           "${pkgdir}/usr/bin/infnoise"

  # in Arch the `uucp` group owns /dev/tty* devices, not `dialout`
  sed --in-place 's/dialout/uucp/g' "${pkgdir}/usr/lib/udev/rules.d/75-infnoise.rules"
}

package_infnoise-tools() {
  pkgdesc="Infinite Noise TRNG tools"
  depends=('glibc')

  cd $pkgbase-$pkgver
  install -Dm644 "LICENSE"                                     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "software/tools/bin2hex"                      "${pkgdir}/usr/bin/infnoise-bin2hex"
  install -Dm755 "software/tools/dice"                         "${pkgdir}/usr/bin/infnoise-dice"
  install -Dm755 "software/tools/entcheck"                     "${pkgdir}/usr/bin/infnoise-entcheck"
  install -Dm755 "software/tools/findlongest"                  "${pkgdir}/usr/bin/infnoise-findlongest"
  install -Dm755 "software/tools/flipbits"                     "${pkgdir}/usr/bin/infnoise-flipbits"
  install -Dm755 "software/tools/healthcheck"                  "${pkgdir}/usr/bin/infnoise-healthcheck"
  install -Dm755 "software/tools/hex2bin"                      "${pkgdir}/usr/bin/infnoise-hex2bin"
  install -Dm755 "software/tools/passgen"                      "${pkgdir}/usr/bin/infnoise-passgen"
}
