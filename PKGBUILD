# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: falkTX <falktx at gmail dot com>

_name=Cadence
pkgname=cadence
pkgver=0.9.1
pkgrel=4
pkgdesc="JACK toolbox for audio production."
arch=('x86_64')
url="https://kx.studio/Applications:Cadence"
license=('GPL2')
groups=('pro-audio')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'jack2-dbus' 'python-dbus'
'python-pyqt5' 'qt5-base' 'qt5-svg')
makedepends=('a2jmidid' 'jack_capture' 'libpulse' 'pulseaudio-jack'
'python-rdflib' 'zita-ajbridge')
optdepends=('a2jmidid: ALSA to JACK MIDI bridge'
            'jack_capture: recording via Cadence-Render'
            'pulseaudio-jack: PulseAudio to JACK bridge'
            'python-rdflib: LADSPA-RDF support in Carla'
            'zita-ajbridge: ALSA to JACK bridge')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/falkTX/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}-0.9.1-qt5.15.patch::https://github.com/falkTX/Cadence/pull/289/commits/887c3fde037c79f0f24bfeb8bc96e704fb2afd25.patch"
)
sha512sums=('daa9df947f0198522172451ec3d2a0e138de5245d4fa849c89ae17fc141388467bdb2e5b1ed191d1db372f4d1c02a8f1c32458c20b893d413af8fdce72ee9219'
            '07cf8055f89b5a75ab817896f4ec68e8b1e21cf3a8f7a4f13cd1ed9a9ef1a669be624201daeacf6d13e7ee6f922b16ef650d402640710a971cd05e87b6b92389')
b2sums=('0f96a3eadc90540ef455e3b9c9abe1b8dc0d912936642c77e52a3704367f06e870b4cbe0bee78482436b9b099063c66b0b04007e8905b7eaf213d6b2f9aa08d1'
        'bd50aceb435ce7c1245543aa3c686679757a4731aafcb6d4f14519deebaf2a0fed1289546f241d35593057be0589a7ca2fe1d8918a4d7f0302fc882576000eeb')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../"${pkgname}-0.9.1-qt5.15.patch"
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
