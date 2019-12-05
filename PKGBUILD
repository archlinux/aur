# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: falkTX <falktx at gmail dot com>

_name=Cadence
pkgname=cadence
pkgver=0.9.1
pkgrel=1
pkgdesc="JACK toolbox for audio production."
arch=('x86_64')
url="https://kxstudio.linuxaudio.org/Applications:Cadence"
license=('GPL2')
groups=('pro-audio')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'jack' 'python-dbus' 'python-pyqt5' 'qt5-base')
makedepends=('a2jmidid' 'jack_capture' 'libpulse' 'pulseaudio-jack' 'python-rdflib' 'zita-ajbridge')
optdepends=('a2jmidid: ALSA to JACK MIDI bridge'
            'jack_capture: recording via Cadence-Render'
            'pulseaudio-jack: PulseAudio to JACK bridge'
            'python-rdflib: LADSPA-RDF support in Carla'
            'zita-ajbridge: ALSA to JACK bridge')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/falkTX/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('daa9df947f0198522172451ec3d2a0e138de5245d4fa849c89ae17fc141388467bdb2e5b1ed191d1db372f4d1c02a8f1c32458c20b893d413af8fdce72ee9219')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  # docs
  install -vDm 644 {README.md,TODO} -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # removing empty directory
  rm -rfv "${pkgdir}/usr/share/cadence/icons"
  # removing claudia, as its runtime dependency ladish (dead) depends on
  # flowcanvas (dead)
  rm -rfv "${pkgdir}/usr/bin/claudia"* \
          "${pkgdir}/usr/share/applications/claudia"* \
          "${pkgdir}/usr/share/${pkgname}/"{icons,src}/{,ui_}claudia* \
          "${pkgdir}/usr/share/icons/hicolor/"{128x128,16x16,256x256,48x48,scalable}/apps/claudia*
}
