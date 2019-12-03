# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: falkTX <falktx at gmail dot com>

_name=Cadence
pkgname=cadence
pkgver=0.9.0
pkgrel=5
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/falkTX/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-dbus_type_cast.patch::https://github.com/falkTX/Cadence/pull/261.patch")
sha512sums=('381c9c57c1d96452a91969e134420d63ef06f5ec144050779d0a06a1098e8ed1693c70165b6640e04acc448d382e717e71ead1b29ba5043f0668675850cad7d1'
            '799d251468d92194b77c1c94f61cd8dc8fe89f5f54d622038170626a7a369d267a1e3406ef69cd100c491f66ed76834c2e116f7764ce5172cbb33ddba7cddbd0')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "../${pkgname}-${pkgver}-dbus_type_cast.patch"
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
  # removing claudia, as its runtime dependency ladish (dead) depends on
  # flowcanvas (dead)
  rm -rfv "${pkgdir}/usr/bin/claudia"* \
          "${pkgdir}/usr/share/applications/claudia"* \
          "${pkgdir}/usr/share/${pkgname}/"{icons,src}/{,ui_}claudia* \
          "${pkgdir}/usr/share/icons/hicolor/"{128x128,16x16,256x256,48x48,scalable}/apps/claudia*
}

