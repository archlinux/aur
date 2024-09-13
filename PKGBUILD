# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=snd-hdspe-dkms
pkgver=1.0
pkgrel=1
pkgdesc='A linux kernel module for RME HDSPe sound cards and extension modules'
url='https://github.com/PhilippeBekaert/snd-hdspe'
arch=('any')
license=('GPL-3.0-or-later')
depends=('dkms')
makedepends=('git')
provides=("snd-hdspe=${pkgver}-${pkgrel}")
source=("git+https://github.com/PhilippeBekaert/snd-hdspe.git"
        'dkms.conf'
        '0001-kernel-6.1.patch')
sha256sums=('SKIP'
            'be3237a00d9bc0729da9b2d05b2003bdf2aa55c85b2947ac034e1c9f0def22d1'
            'cddd90c669bb39594ef100fd09a45ac58303b7adbcd270870650c881961fe1ae')

prepare() {
  # Set module name and version
  sed -e 's|alsa-hdspe|snd-hdspe|' -e 's|0.0|1.0|' -i snd-hdspe/Makefile
  # Patches
  patch -d snd-hdspe -Np1 -i "${srcdir}/0001-kernel-6.1.patch"
}

package() {
  install -Dm644 snd-hdspe/Makefile dkms.conf -t \
    "${pkgdir}/usr/src/snd-hdspe-${pkgver}"
  install -Dm644 snd-hdspe/sound/pci/hdsp/Makefile -t \
    "${pkgdir}/usr/src/snd-hdspe-${pkgver}/sound/pci/hdsp"
  install -Dm644 snd-hdspe/sound/pci/hdsp/hdspe/{Makefile,*{.h,.c}} -t \
    "${pkgdir}/usr/src/snd-hdspe-${pkgver}/sound/pci/hdsp/hdspe"
}

# vim: ts=2 sw=2 et:
