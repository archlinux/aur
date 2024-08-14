# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi@gmail.com>
# Maintainer: Ben Morgan <neembi@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

_pkgname="pulseaudio"
pkgbase="$_pkgname-git"
pkgname=(
    pulseaudio-git
    libpulse-git
    pulseaudio-lirc-git
    pulseaudio-zeroconf-git
    pulseaudio-jack-git
    pulseaudio-bluetooth-git
    pulseaudio-equalizer-git
    pulseaudio-rtp-git
)
pkgdesc="A featureful, general-purpose sound server (development version)"
pkgver=17.0.r38.gcba313d8f
pkgrel=1
arch=("i686" "x86_64" "armv7h")
url="http://pulseaudio.org/"
license=(LGPL-2.1-or-later)
install=pulseaudio.install
makedepends=( alsa-lib
  attr
  avahi
  bluez
  bluez-libs
  check
  dbus
  doxygen
  fftw
  git
  gst-plugins-base-libs
  gtk3
  jack2
  libasyncns
  libcap
  libsm
  libsndfile
  libsoxr
  libxtst
  lirc
  meson
  openssl
  orc
  rtkit
  sbc
  speexdsp
  systemd
  tdb
  valgrind
  webrtc-audio-processing-1
  xmltoman
  libwrap
  libltdl
  python-dbus
  python-pyqt5
)
options=(!emptydirs)
source=("git+https://gitlab.freedesktop.org/pulseaudio/pulseaudio.git"
        "pulseaudio.install")
sha256sums=('SKIP'
            '1d4890b10fadb9208c3fefbbed4aca1f22e63a0f102f4c598dc573a55e724cb2')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson pulseaudio build \
    -D stream-restore-clear-old-devices=true \
    -D pulsedsp-location='/usr/\$LIB/pulseaudio' \
    -D udevrulesdir=/usr/lib/udev/rules.d \
    -D elogind=disabled \
    -D consolekit=disabled
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

package_pulseaudio-git() {
  depends=(
    alsa-lib
    fftw
    libcap
    libltdl
    "libpulse-git=$pkgver-$pkgrel"
    libsm
    libsoxr
    libxtst
    orc
    rtkit
    speexdsp
    tdb
    webrtc-audio-processing-1
    libwrap
    libsndfile
    dconf
  )
  optdepends=(
    'pulseaudio-alsa: ALSA configuration (recommended)'
    'pulseaudio-bluetooth-git: Bluetooth support'
    'pulseaudio-equalizer-git: Graphical equalizer'
    'pulseaudio-jack-git: Jack support'
    'pulseaudio-lirc-git: IR (lirc) support'
    'pulseaudio-rtp-git: RTP and RAOP support'
    'pulseaudio-zeroconf-git: Zeroconf support'
  )
  provides=("pulse-native-provider" "pulseaudio")
  conflicts=("pipewire-pulse" "pulseaudio")
  backup=(
    etc/pulse/daemon.conf
    etc/pulse/default.pa
    etc/pulse/system.pa
  )
  install=pulseaudio.install
  replaces=(
    'pulseaudio-gconf<=11.1'
    'pulseaudio-xen<=9.0'
  )

     meson install -C build --destdir "$pkgdir"

    cd "$pkgdir"

    # Assumes that any volume adjustment is intended by the user, who can control
    # each app's volume. Misbehaving clients can trigger earsplitting volume
    # jumps. App volumes can diverge wildly and cause apps without their own
    # volume control to fall below sink volume; a sink-only volume control will
    # suddenly be unable to make such an app loud enough.
    sed -e '/flat-volumes/iflat-volumes = no' \
        -i etc/pulse/daemon.conf

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
        
      # Avoid warning about nonexistent dir
      # https://gitlab.archlinux.org/archlinux/packaging/packages/pulseaudio/-/issues/3
      mkdir -p etc/pulse/{default,system}.pa.d
      
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

  local moddir=usr/lib/pulseaudio/modules

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

package_libpulse-git() {
  pkgdesc="$pkgdesc (client library) (development)"
  depends=(
    dbus
    libasyncns
    libsndfile
    libxcb
    systemd
  )
  optdepends=(
    'glib2: mainloop integration'
    'pulse-native-provider: PulseAudio backend'
  )
  provides=(
    libpulse-mainloop-glib.so
    libpulse-simple.so
    libpulse.so
  )
  license=(LGPL)
  backup=(etc/pulse/client.conf)
  provides=(libpulse)
  conflicts=(libpulse)

  mv libpulse/* "$pkgdir"
}

package_pulseaudio-zeroconf-git() {
  pkgdesc="Zeroconf support for PulseAudio (development)"
  depends=(
    avahi
    "pulseaudio-git=$pkgver-$pkgrel"
  )
  provides=(pulseaudio-zeroconf)
  conflicts=(pulseaudio-zeroconf)

  mv zeroconf/* "$pkgdir"
}

package_pulseaudio-lirc-git() {
  pkgdesc="IR (lirc) support for PulseAudio (development)"
  depends=(
    lirc
    "pulseaudio-git=$pkgver-$pkgrel"
  )
  provides=(pulseaudio-lirc)
  conflicts=(pulseaudio-lirc)

  mv lirc/* "$pkgdir"
}

package_pulseaudio-jack-git() {
  pkgdesc="Jack support for PulseAudio (development)"
  depends=(
    jack
    "pulseaudio-git=$pkgver-$pkgrel"
  )
  provides=(pulseaudio-jack)
  conflicts=(pulseaudio-jack)

  mv jack/* "$pkgdir"
}

package_pulseaudio-bluetooth-git() {
  pkgdesc="Bluetooth support for PulseAudio (development)"
  depends=(
    bluez
    bluez-libs
    gst-plugins-base-libs
    "pulseaudio-git=$pkgver-$pkgrel"
    sbc
  )
  conflicts=(pulseaudio-bluetooth)
  provides=(pulseaudio-bluetooth)
  optdepends=('gst-plugins-bad: AptX and LDAC support')

  mv bluetooth/* "$pkgdir"
}

package_pulseaudio-equalizer-git() {
  pkgdesc="Graphical equalizer for PulseAudio (development)"
  depends=(
    "pulseaudio-git=$pkgver-$pkgrel"
    python-dbus
    python-pyqt5
    fftw
    python
    glibc
    dbus
 )
  conflicts=(pulseaudio-equalizer)
  provides=(pulseaudio-equalizer)

  mv equalizer/* "$pkgdir"
}

package_pulseaudio-rtp-git() {
  pkgdesc="RTP and RAOP support for PulseAudio (development)"
  provides=(pulseaudio-rtp)
  conflicts=(pulseaudio-rtp)
  depends=(
    gst-plugins-base
    gst-plugins-base-libs
    gst-plugins-good
    openssl
    "pulseaudio-git=$pkgver-$pkgrel"
  )

  mv rtp/* "$pkgdir"
}

# vim:set sw=2 et:

