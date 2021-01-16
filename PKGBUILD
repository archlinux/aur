# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi@gmail.com>
# Contriubtor: Ben Morgan <neembi@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>

pkgname=(pulseaudio-nosystemd-git libpulse-nosystemd-git pulseaudio-{zeroconf,lirc,jack,bluetooth,equalizer}-nosystemd-git)
pkgdesc="A featureful, general-purpose sound server"
pkgver=13.99.1+98+g460d0c0b7
pkgrel=1
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
license=(GPL)
depends=(lib{ltdl,soxr,asyncns,xtst,sndfile} "rtkit" "speexdsp" "tdb" "orc"
         "webrtc-audio-processing" jack "lirc" bluez{,-libs} "sbc"
         python-{pyqt5,dbus,sip} "fftw" dconf)
makedepends=("git" lib{asyncns,xtst,tool,soxr,sndfile} "attr" "rtkit" "speexdsp"
             "tdb" jack bluez{,-libs} "intltool"  "sbc" "lirc" "fftw"
             "orc" "gtk3" "webrtc-audio-processing" "check" "meson" "dconf")
optdepends=("alsa-plugins: ALSA support"
            "pulseaudio-alsa: ALSA configuration (recommended)"
            "lirc-utils: infra-red support")
backup=(etc/pulse/{daemon.conf,default.pa,system.pa,client.conf})
options=(!emptydirs)
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
    -D pulsedsp-location='/usr/\$LIB/pulseaudio' \
    -D stream-restore-clear-old-devices=true \
    -D udevrulesdir=/usr/lib/udev/rules.d \
    -D gcov=false \
    -D tests=false \
    -D systemd=disabled
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs
#  ninja -C build test-daemon
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
  depends=(rtkit libltdl speexdsp tdb orc libsoxr
           webrtc-audio-processing gst-plugins-base-libs)
  optdepends=('pulseaudio-alsa: ALSA configuration (recommended)')
  backup=(etc/pulse/{daemon.conf,default.pa,system.pa})
  provides=(pulseaudio)
  conflicts=(pulseaudio)
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

### Split modules
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
}

package_libpulse-nosystemd-git() {
  pkgdesc="$pkgdesc (client library)"
  depends=(dbus libasyncns libcap libxtst libsm libsndfile)
  provides=(libpulse{,-simple,-mainloop-glib}.so libpulse)
  conflicts=(libpulse)
  license=(LGPL)
  backup=(etc/pulse/client.conf)

  mv libpulse/* "$pkgdir"
}

package_pulseaudio-zeroconf-nosystemd-git(){
  pkgdesc="Zeroconf support for PulseAudio"
  provides=(pulseaudio-zeroconf)
  conflicts=(pulseaudio-zeroconf)
  depends=(pulseaudio avahi openssl)

  mv zeroconf/* "$pkgdir"
}

package_pulseaudio-lirc-nosystemd-git(){
  pkgdesc="IR (lirc) support for PulseAudio"
  depends=(pulseaudio lirc)
  provides=(pulseaudio-lirc)
  conflicts=(pulseaudio-lirc)

  mv lirc/* "$pkgdir"
}

package_pulseaudio-jack-nosystemd-git(){
  pkgdesc="Jack support for PulseAudio"
  depends=(pulseaudio jack)
  provides=(pulseaudio-jack)
  conflicts=(pulseaudio-jack)

  mv jack/* "$pkgdir"
}

package_pulseaudio-bluetooth-nosystemd-git(){
  pkgdesc="Bluetooth support for PulseAudio"
  depends=(pulseaudio bluez bluez-libs sbc)
  provides=(pulseaudio-bluetooth)
  conflicts=(pulseaudio-bluetooth)

  mv bluetooth/* "$pkgdir"
}

package_pulseaudio-equalizer-nosystemd-git(){
  pkgdesc="Equalizer for PulseAudio"
  depends=(pulseaudio python-{pyqt5,dbus} fftw)
  provides=(pulseaudio-equalizer)
  conflicts=(pulseaudio-equalizer)

  mv equalizer/* "$pkgdir"
}

# vim:set sw=2 et:
