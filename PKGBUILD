# Maintainer: Andrew Rabert <ar@nullsum.net>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=fluidsynth-nolibinstpatch
pkgver=2.1.1
pkgrel=1
pkgdesc="A real-time software synthesizer based on the SoundFont 2 specifications"
arch=('x86_64')
url="http://www.fluidsynth.org/"
license=('LGPL2.1')
groups=('pro-audio')
depends=('glibc' 'glib2' 'sdl2')
makedepends=('alsa-lib' 'cmake' 'dbus' 'doxygen' 'jack' 'ladspa'
'libpulse' 'libsndfile' 'portaudio' 'readline' 'systemd-libs')
provides=('libfluidsynth.so' 'soundfont-synthesizer' 'fluidsynth')
conflicts=('fluidsynth')
backup=("etc/conf.d/fluidsynth")
source=("fluidsynth-$pkgver.tar.gz::https://github.com/fluidsynth/fluidsynth/archive/v$pkgver.tar.gz")
sha512sums=('f8776c59aa0aa4a25fe3c38973c994e8608f8fad8a2e478db0d0232d4c787983dfdcba200c558cd810e892930b50184af4bc4a7f3c98ec5c38e147fd715e51b8')

build() {
  cd "fluidsynth-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DFLUID_DAEMON_ENV_FILE=/etc/conf.d/fluidsynth \
        -Denable-ladspa=ON \
        -Denable-portaudio=ON \
        -DLIB_SUFFIX="" \
        -B build \
        -Denable-libinstpatch=OFF \
        .
  make -C build VERBOSE=1
}

check() {
  cd "fluidsynth-${pkgver}"
  make -C build -k check
}

package() {
  depends+=('libasound.so' 'libdbus-1.so' 'libjack.so'
  'libportaudio.so' 'libpulse-simple.so' 'libreadline.so' 'libsndfile.so'
  'libsystemd.so')
  cd "fluidsynth-${pkgver}"
  make -C build DESTDIR="$pkgdir" install
  # systemd user unit
  install -vDm 644 "build/fluidsynth.service" \
    -t "$pkgdir/usr/lib/systemd/user/"
  # system-wide configuration file
  install -vDm 644 "build/fluidsynth.conf" "${pkgdir}/etc/conf.d/fluidsynth"
  # docs
  install -vDm 644 {AUTHORS,ChangeLog,{CONTRIBUTING,README}.md,THANKS,TODO} \
    -t "${pkgdir}/usr/share/doc/fluidsynth"
}
