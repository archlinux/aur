# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

###  may require "ln -s /usr/include/locale.h /usr/include/xlocale.h"

pkgname=(pulseaudio-nosystemd-minimal-git libpulse-nosystemd-minimal-git alsa-card-profiles-nosystemd-minimal-git)
pkgdesc="A featureful, general-purpose sound server"
pkgver=14.99.2+15+gbea3fa7d2
pkgrel=1
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
license=(GPL)
makedepends=(libcap attr libxtst libsm libsndfile rtkit
             speexdsp tdb dbus
             openssl orc check git meson)
source=("git+https://gitlab.freedesktop.org/pulseaudio/pulseaudio.git")
sha256sums=('SKIP')

pkgver() {
  cd pulseaudio
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd pulseaudio

}

build() {
  arch-meson pulseaudio build \
    -D alsadatadir=/usr/share/alsa-card-profile/mixer \
    -D pulsedsp-location='/usr/\$LIB/pulseaudio' \
    -D stream-restore-clear-old-devices=true \
    -D udevrulesdir=/usr/lib/udev/rules.d \
    -D gcov=false \
    -D tests=false \
    -D systemd=disabled \
    -D man=false \
    -D legacy-database-entry-format=false \
    -D asyncns=disabled \
    -D avahi=disabled \
    -D bluez5=disabled \
    -D bluez5-gstreamer=disabled \
    -D bluez5-native-headset=false \
    -D bluez5-ofono-headset=false \
    -D dbus=disabled \
    -D fftw=disabled \
    -D glib=enabled \
    -D gsettings=disabled \
    -D gstreamer=disabled \
    -D gtk=disabled \
    -D hal-compat=false \
    -D ipv6=false \
    -D jack=disabled \
    -D lirc=disabled \
    -D openssl=disabled \
    -D oss-output=disabled \
    -D samplerate=disabled \
    -D soxr=disabled \
    -D speex=enabled \
    -D valgrind=disabled \
    -D adrian-aec=false \
    -D webrtc-aec=disabled \
    -D tcpwrap=disabled \
    -D elogind=disabled \
    -D database=simple \
    -D doxygen=false
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs
#  ninja $NINJAFLAGS -C build test-daemon
#}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_pulseaudio-nosystemd-minimal-git() {
  depends=(libpulse alsa-card-profiles rtkit speexdsp
           tdb orc libxtst)
  optdepends=('pulseaudio-alsa: ALSA configuration (recommended)'
              'pulseaudio-zeroconf: Zeroconf support'
              'pulseaudio-lirc: IR (lirc) support'
              'pulseaudio-jack: Jack support'
              'pulseaudio-bluetooth: Bluetooth support'
              'pulseaudio-equalizer: Graphical equalizer'
              'pulseaudio-rtp: RTP and RAOP support')
  provides=(pulseaudio)
  conflicts=(pulseaudio)
  backup=(etc/pulse/{daemon.conf,default.pa,system.pa})
  replaces=('pulseaudio-xen<=9.0' 'pulseaudio-gconf<=11.1')

  local pulsever=$(cd pulseaudio; ./git-version-gen .tarball-version)
  while [[ $pulsever = *.*.* ]]; do
    pulsever=${pulsever%.*}
  done
  pulsever=${pulsever%%-*}

  DESTDIR="$pkgdir" meson install -C build

  cd "$pkgdir"

  # Superseded by socket activation
  sed -e '/autospawn/iautospawn = no' \
      -i etc/pulse/client.conf

  # Disable cork-request module, can result in e.g. media players unpausing
  # when there's a Skype call incoming
  sed -e 's|/usr/bin/pactl load-module module-x11-cork-request|#&|' \
      -i usr/bin/start-pulseaudio-x11

  # Required by qpaeq
  sed -e '/Load several protocols/aload-module module-dbus-protocol' \
      -i etc/pulse/default.pa

#  rm -r etc/dbus-1

  # Split packages
  _pick libpulse etc/pulse/client.conf
  _pick libpulse usr/bin/pa{cat,ctl,mon,play,rec,record}
  _pick libpulse usr/lib/libpulse{,-simple,-mainloop-glib}.so*
  _pick libpulse usr/lib/{cmake,pkgconfig}
  _pick libpulse usr/lib/pulseaudio/libpulsecommon-*.so
  _pick libpulse usr/include
#  _pick libpulse usr/share/man/man1/pa{cat,ctl,dsp,mon,play,rec,record}.1
#  _pick libpulse usr/share/man/man5/pulse-client.conf.5
  _pick libpulse usr/share/vala

  _pick alsa-card-profiles usr/share/alsa-card-profile

  local moddir=usr/lib/pulse-$pulsever/modules

#  _pick zeroconf $moddir/libavahi-wrap.so
#  _pick zeroconf $moddir/module-zeroconf-{publish,discover}.so
#  _pick zeroconf $moddir/module-raop-discover.so

#  _pick lirc $moddir/module-lirc.so

#  _pick jack $moddir/module-jack-{sink,source}.so
#  _pick jack $moddir/module-jackdbus-detect.so

#  _pick bluetooth $moddir/libbluez5-util.so
#  _pick bluetooth $moddir/module-bluetooth-{discover,policy}.so
#  _pick bluetooth $moddir/module-bluez5-{discover,device}.so

#  _pick equalizer $moddir/module-equalizer-sink.so
#  _pick equalizer usr/bin/qpaeq

#  _pick rtp $moddir/librtp.so
#  _pick rtp $moddir/module-rtp-{send,recv}.so
#  _pick rtp $moddir/module-raop-sink.so
}

package_libpulse-nosystemd-minimal-git() {
  pkgdesc="$pkgdesc (client library)"
  depends=(dbus libcap libxcb libsm libsndfile)
  optdepends=('glib2: mainloop integration')
  provides=(libpulse{,-simple,-mainloop-glib}.so libpulse)
  conflicts=(libpulse)
  license=(LGPL)
  backup=(etc/pulse/client.conf)

  mv libpulse/* "$pkgdir"
}

package_alsa-card-profiles-nosystemd-minimal-git() {
  pkgdesc="ALSA card profiles shared by PulseAudio"
  provides=(alsa-card-profiles)
  conflicts=(alsa-card-profiles)
  license=(LGPL)

  mv alsa-card-profiles/* "$pkgdir"
}

# vim:set sw=2 et:
