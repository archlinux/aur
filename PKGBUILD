# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Ray Rashif <schivmeister@gmail.com>

pkgname=dssi-vst
pkgver=0.9.2
pkgrel=9
pkgdesc="DSSI adapter/wrapper for win32 VST plug-ins"
arch=('x86_64')
url="https://www.breakfastquay.com/dssi-vst/"
license=('GPL2')
groups=('pro-audio')
depends=('wine' 'jack' 'liblo')
makedepends=('dssi' 'ladspa')
source=("https://code.breakfastquay.com/attachments/download/10/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}-winexec.patch")
sha512sums=('647faa1f39dd6ffb13a23f23d5b150afa3fa20a4cb7c28fed8e71ff9b835e84f5410b24bf3b8c65fbdc147667e086cc165469f68da0132fa7a9c06b6ca17561f'
            '2f4474554fec716a63ff7a54c06872aad79eda100df74b108afbcc7307116d6b9159c270d84f14112e5c52bbe543c18bcd455fc6022cf6266ffea086baf602d8')

prepare() {
  cd "${pkgname}-${pkgver}"

  # fix executable extension issue
  patch -Np1 -i "${srcdir}/${pkgname}-winexec.patch"

  # use CXXFLAGS in build
  sed -i "/m32/! s/CXXFLAGS)/& $CXXFLAGS/" Makefile

  # /usr/lib32/dssi
  sed -i '/\/dssi-vst/s|DSSIDIR|&32|' Makefile
  sed -i '/DSSI_PATH/s|\(/usr/lib\)\(/dssi\)|&:\132\2|' remotevstclient.cpp
}

build() {
  cd "${pkgname}-${pkgver}"
  make LDFLAGS="${LDFLAGS}"
}

package() {
  cd "${pkgname}-${pkgver}"
  make BINDIR="${pkgdir}/usr/bin" \
       DSSIDIR="${pkgdir}/usr/lib/dssi" \
       DSSIDIR32="${pkgdir}/usr/lib32/dssi" \
       LADSPADIR="${pkgdir}/usr/lib/ladspa" install
}
