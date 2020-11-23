# Maintainer: Davide Depau <davide@depau.eu>
# Contributor: Prism019 <derektutaj at gmail dot com>
# Original Maintainer: David Runge <dave@sleepmap.de>
# Original Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Original Contributor: falkTX <falktx at gmail dot com>

_name=Cadence
pkgname=cadence-claudia
srcname=cadence
pkgver=0.9.1
pkgrel=2
pkgdesc="JACK toolbox for audio production. (With Claudia)"
arch=('x86_64')
url="https://kxstudio.linuxaudio.org/Applications:Cadence"
license=('GPL2')
depends=('hicolor-icon-theme' 'jack' 'ladish' 'python-dbus' 'python-pyqt5' 'qt5-svg')
optdepends=('a2jmidid: ALSA to JACK MIDI bridge'
            'jack_capture: recording via Cadence-Render'
            'pulseaudio-jack: PulseAudio to JACK bridge'
            'python-rdflib: LADSPA-RDF support in Carla'
            'zita-ajbridge: ALSA to JACK bridge')
conflicts=('cadence')
provides=('cadence')
source=(
  "${srcname}-${pkgver}.tar.gz::https://github.com/falkTX/Cadence/archive/v${pkgver}.tar.gz"
  "0001-Fix-build-with-Qt-5.15.patch"
)
sha512sums=('daa9df947f0198522172451ec3d2a0e138de5245d4fa849c89ae17fc141388467bdb2e5b1ed191d1db372f4d1c02a8f1c32458c20b893d413af8fdce72ee9219'
            'c39d68d11e9b9f5fad71a1c1dcac61f35e57ad9109cb61cf696a7e8ea03c3ae4f1d1b6ae6d5eeab3159b4bc5e75aab82975ec5c36384949002ac129b27a557b1')

prepare() {
  [ ! -d "${srcname}-${pkgver}" ] && mv -v "${_name}-${pkgver}" "${srcname}-${pkgver}"
  cd "${srcname}-${pkgver}"
  patch -Np1 < "$srcdir/0001-Fix-build-with-Qt-5.15.patch"
}

build() {
  cd "${srcname}-${pkgver}"
  make
}

package() {
  cd "${srcname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  # docs
  install -vDm 644 {README.md,TODO} -t "${pkgdir}/usr/share/doc/${srcname}/"
}
