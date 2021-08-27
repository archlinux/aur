# Maintainer: Mr. Tao <tao@post.cz>
# Contributtor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=(pulseaudio-airplay libpulse-airplay pulseaudio-airplay-{zeroconf,lirc,jack,bluetooth,equalizer,rtp})
pkgdesc="A featureful, general-purpose sound server"
pkgver=14.99.2+14+gd6dc500b7
pkgrel=2
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
license=(GPL)
makedepends=(libasyncns libcap attr libxtst libsm libsndfile rtkit libsoxr
             speexdsp tdb systemd dbus avahi bluez bluez-libs jack2 sbc
             lirc openssl fftw orc gtk3 webrtc-audio-processing check git meson
             xmltoman valgrind doxygen)
_commit=d6dc500b78e7d537bd65b2244ee54c3eeb42d3ea  # tags/v14.99.2
source=("git+https://gitlab.freedesktop.org/mr-tao/pulseaudio.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd pulseaudio
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd pulseaudio

  # Freeze version before patching
  ./git-version-gen doesnt-exist >.tarball-version
}

build() {
  local meson_options=(
    -D stream-restore-clear-old-devices=true
    -D pulsedsp-location='/usr/\$LIB/pulseaudio'
    -D udevrulesdir=/usr/lib/udev/rules.d
    -D bluez5-gstreamer=disabled
    -D elogind=disabled
    -D tcpwrap=disabled
  )

  arch-meson pulseaudio build "${meson_options[@]}"
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

package_pulseaudio-airplay() {
  provides=(pulseaudio)
  conflicts=(pulseaudio)
  depends=("libpulse-airplay=$pkgver-$pkgrel" rtkit libltdl speexdsp tdb orc libsoxr
           webrtc-audio-processing libxtst)
  optdepends=('pulseaudio-alsa: ALSA configuration (recommended)'
              'pulseaudio-zeroconf: Zeroconf support'
              'pulseaudio-lirc: IR (lirc) support'
              'pulseaudio-jack: Jack support'
              'pulseaudio-bluetooth: Bluetooth support'
              'pulseaudio-equalizer: Graphical equalizer'
              'pulseaudio-rtp: RTP and RAOP support')
  backup=(etc/pulse/{daemon.conf,default.pa,system.pa})
  install=pulseaudio.install
  replaces=('pulseaudio-xen<=9.0' 'pulseaudio-gconf<=11.1')

  local pulsever=$(cd pulseaudio; ./git-version-gen .tarball-version)
  while [[ $pulsever = *.*.* ]]; do
    pulsever=${pulsever%.*}
  done
  pulsever=${pulsever%%-*}

  meson install -C build --destdir "$pkgdir"

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
  _pick libpulse usr/share/bash-completion/completions/pa{cat,ctl,dsp,play,rec,record}
  _pick libpulse usr/share/bash-completion/completions/pulseaudio
  _pick libpulse usr/share/vala
  _pick libpulse usr/share/zsh

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

package_libpulse-airplay() {
  provides=(libpulse)
  conflicts=(libpulse)
  pkgdesc="$pkgdesc (client library)"
  depends=(dbus libasyncns libcap libxcb libsm libsndfile systemd)
  optdepends=('glib2: mainloop integration')
  provides+=(libpulse{,-simple,-mainloop-glib}.so)
  license=(LGPL)
  backup=(etc/pulse/client.conf)

  mv libpulse/* "$pkgdir"
}

package_pulseaudio-airplay-zeroconf(){
  provides=(pulseaudio-zeroconf)
  conflicts=(pulseaudio-zeroconf)
  pkgdesc="Zeroconf support for PulseAudio"
  depends=("pulseaudio-airplay=$pkgver-$pkgrel" avahi openssl)

  mv zeroconf/* "$pkgdir"
}

package_pulseaudio-airplay-lirc(){
  provides=(pulseaudio-lirc)
  conflicts=(pulseaudio-lirc)
  pkgdesc="IR (lirc) support for PulseAudio"
  depends=("pulseaudio-airplay=$pkgver-$pkgrel" lirc)

  mv lirc/* "$pkgdir"
}

package_pulseaudio-airplay-jack(){
  provides=(pulseaudio-jack)
  conflicts=(pulseaudio-jack)
  pkgdesc="Jack support for PulseAudio"
  depends=("pulseaudio-airplay=$pkgver-$pkgrel" jack)

  mv jack/* "$pkgdir"
}

package_pulseaudio-airplay-bluetooth(){
  provides=(pulseaudio-bluetooth)
  conflicts=(pulseaudio-bluetooth)
  pkgdesc="Bluetooth support for PulseAudio"
  depends=("pulseaudio-airplay=$pkgver-$pkgrel" bluez bluez-libs sbc)

  mv bluetooth/* "$pkgdir"
}

package_pulseaudio-airplay-equalizer(){
  provides=(pulseaudio-equalizer)
  conflicts=(pulseaudio-equalizer)
  pkgdesc="Equalizer for PulseAudio"
  depends=("pulseaudio-airplay=$pkgver-$pkgrel" python-{pyqt5,dbus,sip} fftw)

  mv equalizer/* "$pkgdir"
}

package_pulseaudio-airplay-rtp() {
  pkgdesc="RTP and RAOP support for PulseAudio"
  depends=("pulseaudio-airplay=$pkgver-$pkgrel")

  mv rtp/* "$pkgdir"
}

# vim:set sw=2 et:
