# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>
# Maintainer: SanskritFritz (gmail)

pkgname=oolite
pkgver=1.88
pkgrel=1
pkgdesc="A space-sim based on the classic Elite"
arch=('x86_64')
url="http://www.oolite.org/"
license=('GPL2')
depends=('gnustep-gui' 'sdl_mixer' 'glu' 'espeak' 'nspr' 'python2' 'icu' 'gnustep-base' 'openal')
makedepends=('gnustep-make' 'curl' 'zip' 'mesa' 'gcc-objc')
#options=(makeflags)
source=("oolite"
        "https://github.com/OoliteProject/oolite/releases/download/${pkgver}/oolite-source-${pkgver}.tar.bz2")
sha512sums=('56fd49c040ea0abdb50fc14072d26aef8f6133bfa5c112a88e6c9f4716c8eaed3060587d8a41a2d6aeaa75de9a4cea4fd8e9c6418b01d2550eeeda41f8f08e44'
            '196957e67dec9e2a9ecbb20ed2d8e3c15086158d7968ab339369ff372009c0b7157916916946a95c83a7462870dd98a73a3411f362fadb47106676f4eb9ec5ca')

build() {
  cd "oolite-source-${pkgver}"
  unset CPPFLAGS
  #sed -i '/void png_error/d' src/Core/Materials/OOPNGTextureLoader.m
  sed -i "/ADDITIONAL_OBJCFLAGS/s/=/= -fobjc-exceptions/" GNUmakefile
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
  make -f Makefile release-deployment
}

package() {
  cd "oolite-source-${pkgver}"

  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{oolite,applications,pixmaps,doc/oolite}

  cp -r oolite.app/* ${pkgdir}/usr/share/oolite/

  install -D -m755 ../oolite ${pkgdir}/usr/bin/oolite
  install -D -m644 installers/FreeDesktop/oolite-icon.png ${pkgdir}/usr/share/pixmaps/oolite-icon.png
  install -D -m644 installers/FreeDesktop/oolite.desktop ${pkgdir}/usr/share/applications/oolite.desktop
  install -D -m644 Doc/AdviceForNewCommanders.pdf Doc/OoliteReadMe.pdf Doc/OoliteRS.pdf ${pkgdir}/usr/share/doc/oolite/
 }
# vim:set ts=2 sw=2 et:
