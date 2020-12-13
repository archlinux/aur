# Maintainer: SpineEyE <at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=pulseaudio-hsphfpd
pkgname=(pulseaudio-hsphfpd libpulse-hsphfpd alsa-card-profiles-hsphfpd pulseaudio-{zeroconf,lirc,jack,bluetooth,equalizer,rtp}-hsphfpd)
pkgdesc="A fork of pulseaudio providing superior bluetooth headset functionality"
pkgver=14.0+49+g40a68e93a
pkgrel=2
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
license=(GPL)
makedepends=(libasyncns libcap attr libxtst libsm libsndfile rtkit libsoxr
             speexdsp tdb systemd dbus avahi bluez bluez-libs jack2 sbc
             lirc openssl fftw orc gtk3 webrtc-audio-processing check git meson
             xmltoman gst-plugins-base-libs libopenaptx)
_commit=d1e0594e939e3309435c966d994b0207b10f5175  # tags/v14.0^0
source=("git+https://gitlab.freedesktop.org/pulseaudio/pulseaudio.git#commit=$_commit"
        "pa_hsphfpd::git+https://gitlab.freedesktop.org/kapiwko/pulseaudio.git#branch=hsphfpd")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd pulseaudio
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd pulseaudio

  # Freeze version before patching
  ./git-version-gen doesnt-exist >.tarball-version
 
  # Merge from pali
  git pull --strategy=recursive --no-edit ../pa_hsphfpd
}

build() {
  arch-meson pulseaudio build \
    -D alsadatadir=/usr/share/alsa-card-profile/mixer \
    -D pulsedsp-location='/usr/\$LIB/pulseaudio' \
    -D stream-restore-clear-old-devices=true \
    -D udevrulesdir=/usr/lib/udev/rules.d
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
  ninja -C build test-daemon
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_pulseaudio-hsphfpd() {
  depends=("libpulse-hsphfpd=$pkgver-$pkgrel" alsa-card-profiles rtkit libltdl speexdsp
           tdb orc libsoxr webrtc-audio-processing libxtst hsphfpd-git)
  optdepends=('pulseaudio-alsa: ALSA configuration (recommended)'
              'pulseaudio-zeroconf-hsphfpd: Zeroconf support'
              'pulseaudio-lirc-hsphfpd: IR (lirc) support'
              'pulseaudio-jack-hsphfpd: Jack support'
              'pulseaudio-bluetooth-hsphfpd: Bluetooth support'
              'pulseaudio-equalizer-hsphfpd: Graphical equalizer'
              'pulseaudio-rtp-hsphfpd: RTP and RAOP support')
  backup=(etc/pulse/{daemon.conf,default.pa,system.pa})
  install=pulseaudio.install
  replaces=('pulseaudio-xen<=9.0' 'pulseaudio-gconf<=11.1')
  provides=("pulseaudio=$pkgver-$pkgrel")
  conflicts=(pulseaudio)

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

package_libpulse-hsphfpd() {
  pkgdesc="$pkgdesc (client library)"
  depends=(dbus libasyncns libcap libxcb libsm libsndfile systemd)
optdepends=('glib2: mainloop integration')
  provides=(libpulse{,-simple,-mainloop-glib}.so "libpulse=$pkgver-$pkgrel")
  conflicts=(libpulse)
  license=(LGPL)
  backup=(etc/pulse/client.conf)

  mv libpulse/* "$pkgdir"
}

package_alsa-card-profiles-hsphfpd() {
  pkgdesc="ALSA card profiles shared by PulseAudio"
  provides=("alsa-card-profiles=$pkgver-$pkgrel")
  conflicts=(alsa-card-profiles)
  license=(LGPL)

  mv alsa-card-profiles/* "$pkgdir"
}

package_pulseaudio-zeroconf-hsphfpd(){
  pkgdesc="Zeroconf support for PulseAudio"
  depends=("pulseaudio-hsphfpd=$pkgver-$pkgrel" avahi openssl)
  provides=("pulseaudio-zeroconf=$pkgver-$pkgrel")
  conflicts=(pulseaudio-zeroconf)

  mv zeroconf/* "$pkgdir"
}

package_pulseaudio-lirc-hsphfpd(){
  pkgdesc="IR (lirc) support for PulseAudio"
  depends=("pulseaudio-hsphfpd=$pkgver-$pkgrel" lirc)
  provides=("pulseaudio-lirc=$pkgver-$pkgrel")
  conflicts=(pulseaudio-lirc)

  mv lirc/* "$pkgdir"
}

package_pulseaudio-jack-hsphfpd(){
  pkgdesc="Jack support for PulseAudio"
  depends=("pulseaudio-hsphfpd=$pkgver-$pkgrel" jack)
  provides=("pulseaudio-jack=$pkgver-$pkgrel")
  conflicts=(pulseaudio-jack)

  mv jack/* "$pkgdir"
}

package_pulseaudio-bluetooth-hsphfpd(){
  pkgdesc="Bluetooth support for PulseAudio"
  depends=("pulseaudio-hsphfpd=$pkgver-$pkgrel" bluez bluez-libs sbc)
  provides=("pulseaudio-bluetooth=$pkgver-$pkgrel")
  conflicts=(pulseaudio-bluetooth)

  mv bluetooth/* "$pkgdir"
}

package_pulseaudio-equalizer-hsphfpd(){
  pkgdesc="Graphical equalizer for PulseAudio"
  depends=("pulseaudio-hsphfpd=$pkgver-$pkgrel" python-{pyqt5,dbus} fftw)
  provides=("pulseaudio-equalizer=$pkgver-$pkgrel")
  conflicts=(pulseaudio-equalizer)

  mv equalizer/* "$pkgdir"
}

package_pulseaudio-rtp-hsphfpd(){
  pkgdesc="RTP and RAOP support for PulseAudio"
  depends=("pulseaudio=$pkgver-$pkgrel")

  mv rtp/* "$pkgdir"
}

# vim:set sw=2 et:
