# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>
pkgname=oolite
pkgver=1.86
pkgrel=2
pkgdesc="A space-sim based on the classic Elite"
arch=('x86_64')
url="http://www.oolite.org/"
license=('GPL2')
depends=('gnustep-gui' 'sdl_mixer' 'glu' 'espeak' 'nspr' 'python2' 'icu' 'gnustep-base' 'openal')
makedepends=('gnustep-make' 'curl' 'zip' 'mesa' 'gcc-objc')
#options=(makeflags)
source=(oolite
        "https://github.com/OoliteProject/oolite/releases/download/${pkgver}/oolite-source-${pkgver}.tar.bz2")
sha512sums=('56fd49c040ea0abdb50fc14072d26aef8f6133bfa5c112a88e6c9f4716c8eaed3060587d8a41a2d6aeaa75de9a4cea4fd8e9c6418b01d2550eeeda41f8f08e44'
            'e06b3fde008dc91f636e2dd95114f00131197f99387f57fa365a8c66129cb9579664950bf3a1dab124a2ed9c9a3023b1a6b9444f4c5655a70eee269a07f8703c')

build() {
  cd oolite-source-${pkgver}
  unset CPPFLAGS
  #sed -i '/void png_error/d' src/Core/Materials/OOPNGTextureLoader.m
  sed -i "/ADDITIONAL_OBJCFLAGS/s/=/= -fobjc-exceptions/" GNUmakefile
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
  make -f Makefile release-deployment
}

package() {
  cd oolite-source-${pkgver}

  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{oolite,applications,pixmaps,doc/oolite}

  cp -r oolite.app/* ${pkgdir}/usr/share/oolite/

  install -D -m755 ../oolite ${pkgdir}/usr/bin/oolite
  install -D -m644 installers/FreeDesktop/oolite-icon.png ${pkgdir}/usr/share/pixmaps/oolite-icon.png
  install -D -m644 installers/FreeDesktop/oolite.desktop ${pkgdir}/usr/share/applications/oolite.desktop
  install -D -m644 Doc/AdviceForNewCommanders.pdf Doc/OoliteReadMe.pdf Doc/OoliteRS.pdf ${pkgdir}/usr/share/doc/oolite/
 }
# vim:set ts=2 sw=2 et:
