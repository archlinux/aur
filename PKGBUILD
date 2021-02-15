# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

###  may require "ln -s /usr/include/locale.h /usr/include/xlocale.h"

pkgname=(pulseaudio-nosystemd-git libpulse-nosystemd-git alsa-card-profiles-nosystemd-git pulseaudio-{zeroconf,lirc,jack,bluetooth,equalizer,rtp}-nosystemd-git)
pkgdesc="A featureful, general-purpose sound server"
pkgver=14.2
pkgrel=1
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
license=(GPL)
makedepends=(libasyncns libcap attr libxtst libsm libsndfile rtkit libsoxr
             speexdsp tdb dbus avahi bluez bluez-libs jack sbc
             lirc openssl fftw orc gtk3 webrtc-audio-processing check git meson
             xmltoman valgrind)
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
    -D elogind=disabled
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

package_pulseaudio-nosystemd-git() {
  depends=(libpulse alsa-card-profiles rtkit libltdl speexdsp
           tdb orc libsoxr webrtc-audio-processing libxtst)
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

  rm -r etc/dbus-1

  # Split packages
  _pick libpulse etc/pulse/client.conf
  _pick libpulse usr/bin/pa{cat,ctl,dsp,mon,play,rec,record}
  _pick libpulse usr/lib/libpulse{,-simple,-mainloop-glib}.so*
  _pick libpulse usr/lib/{cmake,pkgconfig}
  _pick libpulse usr/lib/pulseaudio/libpulse{dsp,common-*}.so
  _pick libpulse usr/include
  _pick libpulse usr/share/man/man1/pa{cat,ctl,dsp,mon,play,rec,record}.1
  _pick libpulse usr/share/man/man5/pulse-client.conf.5
  _pick libpulse usr/share/vala

  _pick alsa-card-profiles usr/share/alsa-card-profile

  local moddir=usr/lib/pulse-$pulsever/modules

  _pick zeroconf $moddir/libavahi-wrap.so
  _pick zeroconf $moddir/module-zeroconf-{publish,discover}.so
  _pick zeroconf $moddir/module-raop-discover.so

  _pick lirc $moddir/module-lirc.so

  _pick jack $moddir/module-jack-{sink,source}.so
  _pick jack $moddir/module-jackdbus-detect.so

  _pick bluetooth $moddir/libbluez5-util.so
  _pick bluetooth $moddir/module-bluetooth-{discover,policy}.so
  _pick bluetooth $moddir/module-bluez5-{discover,device}.so

  _pick equalizer $moddir/module-equalizer-sink.so
  _pick equalizer usr/bin/qpaeq

  _pick rtp $moddir/lib{rtp,raop}.so
  _pick rtp $moddir/module-rtp-{send,recv}.so
  _pick rtp $moddir/module-raop-sink.so
}

package_libpulse-nosystemd-git() {
  pkgdesc="$pkgdesc (client library)"
  depends=(dbus libasyncns libcap libxcb libsm libsndfile)
  optdepends=('glib2: mainloop integration')
  provides=(libpulse{,-simple,-mainloop-glib}.so libpulse)
  conflicts=(libpulse)
  license=(LGPL)
  backup=(etc/pulse/client.conf)

  mv libpulse/* "$pkgdir"
}

package_alsa-card-profiles-nosystemd-git() {
  pkgdesc="ALSA card profiles shared by PulseAudio"
  provides=(alsa-card-profiles)
  conflicts=(alsa-card-profiles)
  license=(LGPL)

  mv alsa-card-profiles/* "$pkgdir"
}

package_pulseaudio-zeroconf-nosystemd-git(){
  pkgdesc="Zeroconf support for PulseAudio"
  depends=("pulseaudio=$pkgver-$pkgrel" avahi openssl)
  provides=(pulseaudio-zeroconf)
  conflicts=(pulseaudio-zeroconf)

  mv zeroconf/* "$pkgdir"
}

package_pulseaudio-lirc-nosystemd-git(){
  pkgdesc="IR (lirc) support for PulseAudio"
  depends=("pulseaudio=$pkgver-$pkgrel" lirc)
  provides=(pulseaudio-lirc)
  conflicts=(pulseaudio-lirc)

  mv lirc/* "$pkgdir"
}

package_pulseaudio-jack-nosystemd-git(){
  pkgdesc="Jack support for PulseAudio"
  depends=("pulseaudio=$pkgver-$pkgrel" jack)
  provides=(pulseaudio-jack)
  conflicts=(pulseaudio-jack)

  mv jack/* "$pkgdir"
}

package_pulseaudio-bluetooth-nosystemd-git(){
  pkgdesc="Bluetooth support for PulseAudio"
  depends=("pulseaudio=$pkgver-$pkgrel" bluez bluez-libs sbc)
  provides=(pulseaudio-bluetooth)
  conflicts=(pulseaudio-bluetooth)

  mv bluetooth/* "$pkgdir"
}

package_pulseaudio-equalizer-nosystemd-git(){
  pkgdesc="Graphical equalizer for PulseAudio"
  depends=("pulseaudio=$pkgver-$pkgrel" python-{pyqt5,dbus} fftw)
  provides=(pulseaudio-equalizer)
  conflcits=(pulseaudio-equalizer)

  mv equalizer/* "$pkgdir"
}

package_pulseaudio-rtp-nosystemd-git(){
  pkgdesc="RTP and RAOP support for PulseAudio"
  depends=("pulseaudio=$pkgver-$pkgrel")
  provides=(pulseaudio-rtp)
  conflicts=(pulseaudio-rtp)

  mv rtp/* "$pkgdir"
}

# vim:set sw=2 et:
