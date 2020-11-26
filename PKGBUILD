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

pkgname=(pulseaudio-nosystemd-minimal-git libpulse-nosystemd-minimal-git pulseaudio-zeroconf-nosystemd-minimal-git)
pkgdesc="A featureful, general-purpose sound server"
pkgver=13.99.1+98+g460d0c0b7
pkgrel=1
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
license=(GPL)
depends=("libltdl" "rtkit" "tdb" "orc" "dconf")
makedepends=("git" "attr" "rtkit"
             "tdb" "intltool"
             "orc" "check" "meson")
optdepends=("alsa-plugins: ALSA support"
            "pulseaudio-alsa: ALSA configuration (recommended)")
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
    -D systemd=disabled \
    -D man=false \
    -D legacy-database-entry-format=false \
    -D asyncns=disabled \
    -D avahi=disabled \
    -D bluez5=false \
    -D bluez5-native-headset=false \
    -D bluez5-ofono-headset=false \
    -D dbus=disabled \
    -D fftw=disabled \
    -D glib=disabled \
    -D gsettings=disabled \
    -D gstreamer=disabled \
    -D gtk=disabled \
    -D ipv6=false \
    -D jack=disabled \
    -D lirc=disabled \
    -D openssl=disabled \
    -D soxr=disabled \
    -D speex=disabled \
    -D adrian-aec=true \
    -D webrtc-aec=disabled 
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

package_pulseaudio-nosystemd-minimal-git() {
  depends=(rtkit libltdl tdb orc)
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

package_libpulse-nosystemd-minimal-git() {
  pkgdesc="$pkgdesc (client library)"
  depends=(libcap libxtst libsm)
  provides=(libpulse{,-simple,-mainloop-glib}.so libpulse)
  conflicts=(libpulse)
  license=(LGPL)
  backup=(etc/pulse/client.conf)

  mv libpulse/* "$pkgdir"
}

package_pulseaudio-zeroconf-nosystemd-minimal-git(){
  pkgdesc="Zeroconf support for PulseAudio"
  provides=(pulseaudio-zeroconf)
  conflicts=(pulseaudio-zeroconf)
  depends=(pulseaudio)

  mv zeroconf/* "$pkgdir"
}
# vim:set sw=2 et:
