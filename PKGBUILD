# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: falkTX <falktx at gmail dot com>

_name=Cadence
pkgname=cadence
pkgver=0.9.2
pkgrel=3
pkgdesc="JACK toolbox for audio production."
arch=(x86_64)
url="https://kx.studio/Applications:Cadence"
license=(GPL2)
depends=(
  alsa-utils # for aplay/ arecord calls
  bash
  gcc-libs
  glibc
  hicolor-icon-theme
  jack2-dbus
  python
  python-dbus
  python-pyqt5
  qt5-base
  qt5-svg
  sh
)
makedepends=(
  a2jmidid
  jack_capture
  libpulse
  pulseaudio-jack
  python-rdflib
  zita-ajbridge
)
optdepends=(
  'a2jmidid: ALSA to JACK MIDI bridge'
  'jack_capture: recording via Cadence-Render'
  'pulseaudio-jack: PulseAudio to JACK bridge'
  'python-rdflib: LADSPA-RDF support in Carla'
  'zita-ajbridge: ALSA to JACK bridge'
)
source=(
  https://github.com/falkTX/$pkgname/archive/v$pkgver/$pkgname-v$pkgver.tar.gz
  0001-cadence_aloop_daemon-place-lockfile-into-non-public-.patch
  0001-cadence_py-wine-ASIO-settings-use-safe-tempfile.patch
)
sha512sums=('d8a1b52c361e3e18a193d1c283bb69abe18ce667b554fc53cb9b752d92747269145144ae512895ffbb5df76efe8671cfc0782f29e59d0d7cd3d97c97240bdecf'
            'c145404f12b26a88075c2475ad2bffbbdfe46ed294e7e9c88f7e11db645890afa35cfec99e2dd4bf14bb4bfaaf8e23c1ee64cc0d91d163274f7b02b32c080b75'
            '7c66d7fcf7b05d50ff98373b29a2a884088be62c6e025fbd4362387c67018eeac6b9fc16e6866704e268eafdb4b2f12bfcc62927a3ea5914693a32b93d5e8775')
b2sums=('a5422e4d74618e2e45d9c6f275393a6e918783fc37d60a54142725aa54e691435c41f76dd0346fae7684c452988b07a18d817902abd917dbceaff5fb4aaa6c47'
        '2a1cfa17a75f9e652064cb7f3fcddb0a3ff1ad7d829cb58fd924e6c406d3dd07091a2ccb0067b001378212dbdba7549c5e04ef0b99ee83ffddfd7e525a68da66'
        'ef6f6a40736c57b6dbd3570ca5c5119432552f4000d230199d0ea329cd08b76abe30c8afa53380e5bbcabbbe6b97afa6f093bb0424c909ad8d8fa5f37e43661f')

prepare() {
  # fix CVE-2023-43782, CVE-2023-43783
  # https://seclists.org/oss-sec/2023/q4/45
  patch -Np1 -d $_name-$pkgver -i ../0001-cadence_aloop_daemon-place-lockfile-into-non-public-.patch
  patch -Np1 -d $_name-$pkgver -i ../0001-cadence_py-wine-ASIO-settings-use-safe-tempfile.patch
}

build() {
  make -C $_name-$pkgver
}

package() {
  make DESTDIR="$pkgdir" PREFIX=/usr install -C $_name-$pkgver
  install -vDm 644 $_name-$pkgver/{README.md,TODO} -t "$pkgdir/usr/share/doc/$pkgname/"

  # removing claudia, as its runtime dependency ladish (dead) depends on
  # flowcanvas (dead)
  rm -rfv "$pkgdir/usr/bin/claudia"* \
          "$pkgdir/usr/share/applications/claudia"* \
          "$pkgdir/usr/share/$pkgname/"{icons,src}/{,ui_}claudia* \
          "$pkgdir/usr/share/icons/hicolor/"{128x128,16x16,256x256,48x48,scalable}/apps/claudia*
}
