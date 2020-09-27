# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=libpulse.so-nosystemd-git
pkgdesc="Client library for PulseAudio"
pkgver=13.0
pkgrel=1
arch=(i686 x86_64)
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
license=(LGPL)
makedepends=(libasyncns libcap attr libxtst libsm libsndfile rtkit libsoxr
             speexdsp tdb dbus avahi bluez bluez-libs jack sbc
             lirc openssl fftw orc gtk3 webrtc-audio-processing check git meson
             xmltoman gst-plugins-base-libs)
provides=("libpulse=${pkgver}" libpulse{,-simple,-mainloop-glib}.so)
conflicts=('libpulse')
replaces=('libpulse')
backup=(etc/pulse/client.conf)
source=("git+https://gitlab.freedesktop.org/pulseaudio/pulseaudio.git")
sha256sums=('SKIP')

pkgver() {
  cd pulseaudio
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  arch-meson pulseaudio build \
    -D pulsedsp-location='/usr/\$LIB/pulseaudio' \
    -D stream-restore-clear-old-devices=true \
    -D udevrulesdir=/usr/lib/udev/rules.d \
    -D gcov=false \
    -D tests=false \
    -D systemd=disabled
  meson compile -C build
}

package_libpulse.so-nosystemd-git() {
  pkgdesc="$pkgdesc (client library)"
  depends=(dbus libasyncns libcap libxtst libsm libsndfile)
  provides=(libpulse{,-simple,-mainloop-glib}.so libpulse)
  conflicts=(libpulse)
  license=(LGPL)
  backup=(etc/pulse/client.conf)

### Split libpulse
  _pick libpulse etc/pulse/client.conf
  _pick libpulse usr/bin/pa{cat,ctl,dsp,mon,play,rec,record}
  _pick libpulse usr/lib/libpulse{,-simple,-mainloop-glib}.so*
  _pick libpulse usr/lib/{cmake,pkgconfig}
  _pick libpulse usr/lib/pulseaudio/libpulse{dsp,common-*}.so
  _pick libpulse usr/include
  _pick libpulse usr/share/man/man1/pa{cat,ctl,dsp,mon,play,rec,record}.1
  _pick libpulse usr/share/man/man5/pulse-client.conf.5
  _pick libpulse usr/share/vala

  mv libpulse/* "$pkgdir"

}
