# Maintainer EliasofWaffle <eliascontato@protonmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=pipewire-ldac
pkgname=(
  pipewire-ldac
  libpipewire-ldac
  alsa-card-profiles-ldac
  pipewire-docs-ldac
  pipewire-libcamera-ldac
  pipewire-audio-ldac
  pipewire-alsa-ldac
  pipewire-ffado-ldac
  pipewire-jack-client-ldac
  pipewire-jack-ldac
  pipewire-pulse-ldac
  pipewire-roc-ldac
  gst-plugin-pipewire-ldac
  pipewire-zeroconf-ldac
  pipewire-v4l2-ldac
  pipewire-x11-bell-ldac
  pipewire-session-manager-ldac
  pulse-native-provider-ldac
)
pkgver=1.6.5
pkgrel=1
epoch=1
pkgdesc="Low-latency audio/video router and processor with ldac decoder support"
url="https://pipewire.org"
arch=(x86_64)
license=(MIT)
makedepends=(
  alsa-lib
  avahi
  bluez-libs
  dbus
  doxygen
  git
  glib2
  glib2-devel
  graphviz
  gst-plugins-base
  jack2
  libcamera
  libcanberra
  libebur128
  libfdk-aac
  libffado
  libfreeaptx
  liblc3
  libldac
  libldacdec
  libmysofa
  libpulse
  libsndfile
  libusb
  libx11
  libxfixes
  lilv
  meson
  ncurses
  opus
  python-docutils
  readline
  roc-toolkit
  rtkit
  sbc
  sdl2
  systemd
  valgrind
  webrtc-audio-processing-1
)
checkdepends=(
  desktop-file-utils
  openal
)
source=(
  "git+https://gitlab.freedesktop.org/pipewire/pipewire.git#tag=$pkgver"
)
b2sums=('48b5141cef2faaae187cef485b4559d876de0c42c5cd07efda38a69134232ccb37406f1c6b015fcb5c9722f000952018bf0eceeaf3c8265940225fcdd282c8d1')


prepare() {
  cd pipewire
  # From https://gitlab.archlinux.org/archlinux/packaging/packages/pipewire commit ddff36ce2d4136e5c39c8385a33672289bbc1e5f
  # Fix build
  git cherry-pick -n fb47e739d9f605772b5098421a809537c108d30c

}

build() {
  local meson_options=(
    -D bluez5-codec-lc3plus=disabled
    -D bluez5-codec-ldac-dec=enabled
    -D onnxruntime=disabled
    -D docs=enabled
    -D jack-devel=true
    -D libjack-path=/usr/lib
    -D man=enabled
    -D rlimits-install=false
    -D selinux=disabled
    -D session-managers=[]
    -D snap=disabled
    -D udevrulesdir=/usr/lib/udev/rules.d
  )

  arch-meson pipewire build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
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

_pwname=pipewire-0.3
_spaname=spa-0.2

package_pipewire-ldac() {
  license+=(
    # libspa-alsa
    LGPL-2.1-or-later
  )
  depends=(
    libpipewire lib$_pwname.so
    dbus libdbus-1.so
    gcc-libs
    glib2 libglib-2.0.so
    glibc
    ncurses libncursesw.so
    readline libreadline.so
    systemd-libs libsystemd.so libudev.so
  )
  optdepends=(
    'gst-plugin-pipewire-ldac: GStreamer plugin'
    'pipewire-alsa-ldac: ALSA configuration'
    'pipewire-audio-ldac: Audio support'
    'pipewire-docs-ldac: Documentation'
    'pipewire-ffado-ldac: FireWire support'
    'pipewire-jack-client-ldac: PipeWire as JACK client'
    'pipewire-jack-ldac: JACK replacement'
    'pipewire-libcamera-ldac: Libcamera support'
    'pipewire-pulse-ldac: PulseAudio replacement'
    'pipewire-roc-ldac: ROC streaming'
    'pipewire-session-manager-ldac: Session manager'
    'pipewire-v4l2-ldac: V4L2 interceptor'
    'pipewire-x11-bell-ldac: X11 bell'
    'pipewire-zeroconf-ldac: Zeroconf support'
    'realtime-privileges: realtime privileges with rt module'
    'rtkit: realtime privileges with rtkit module'
  )
  provides=(pipewire-ldac pipewire)
  conflicts=(pipewire)

  install=pipewire-ldac.install

  meson install -C build --destdir "$pkgdir"

  (
    cd "$pkgdir"

    # Replace copies with symlinks
    for _f in pipewire-{aes67,avb,pulse}; do
      cmp usr/bin/pipewire usr/bin/$_f
      ln -sf pipewire usr/bin/$_f
    done

    _pick lib usr/include/{$_pwname,$_spaname}
    _pick lib usr/lib/$_spaname/libspa.so*
    _pick lib usr/lib/lib$_pwname.so*
    _pick lib usr/lib/pkgconfig/lib{$_pwname,$_spaname}.pc

    _pick acp usr/lib/udev
    _pick acp usr/share/alsa-card-profile

    _pick docs usr/share/doc

    _pick libcamera usr/lib/$_spaname/libcamera

    _pick audio usr/bin/pipewire-{aes67,avb}
    _pick audio usr/bin/pw-{cat,loopback,mididump}
    _pick audio usr/bin/pw-{dsd,enc,midi,}play
    _pick audio usr/bin/pw-{midi,}record
    _pick audio usr/bin/spa-{acp-tool,resample}
    _pick audio usr/lib/alsa-lib
    _pick audio usr/lib/$_pwname/libpipewire-module-avb.so
    _pick audio usr/lib/$_pwname/libpipewire-module-echo-cancel.so
    _pick audio usr/lib/$_pwname/libpipewire-module-fallback-sink.so
    _pick audio usr/lib/$_pwname/libpipewire-module-filter-chain*.so
    _pick audio usr/lib/$_pwname/libpipewire-module-loopback.so
    _pick audio usr/lib/$_pwname/libpipewire-module-netjack2*.so
    _pick audio usr/lib/$_pwname/libpipewire-module-parametric-equalizer.so
    _pick audio usr/lib/$_pwname/libpipewire-module-pipe-tunnel.so
    _pick audio usr/lib/$_pwname/libpipewire-module-protocol-simple.so
    _pick audio usr/lib/$_pwname/libpipewire-module-rtp-{sap,sink,source}.so
    _pick audio usr/lib/$_pwname/libpipewire-module-vban*.so
    _pick audio usr/lib/$_spaname/{aec,alsa,audio*,avb,bluez5,filter-graph}
    _pick audio usr/lib/systemd/user/filter-chain.service
    _pick audio usr/share/alsa
    _pick audio usr/share/man/man1/pw-{cat,loopback,mididump}.1
    _pick audio usr/share/man/man1/spa-{acp-tool,resample}.1
    _pick audio usr/share/man/man5/pipewire-filter-chain.conf.5
    _pick audio usr/share/man/man7/libpipewire-module-avb.7
    _pick audio usr/share/man/man7/libpipewire-module-echo-cancel.7
    _pick audio usr/share/man/man7/libpipewire-module-fallback-sink.7
    _pick audio usr/share/man/man7/libpipewire-module-filter-chain*.7
    _pick audio usr/share/man/man7/libpipewire-module-loopback.7
    _pick audio usr/share/man/man7/libpipewire-module-netjack2*.7
    _pick audio usr/share/man/man7/libpipewire-module-parametric-equalizer.7
    _pick audio usr/share/man/man7/libpipewire-module-pipe-tunnel.7
    _pick audio usr/share/man/man7/libpipewire-module-protocol-simple.7
    _pick audio usr/share/man/man7/libpipewire-module-rtp-{sap,sink,source}.7
    _pick audio usr/share/man/man7/libpipewire-module-vban*.7
    _pick audio usr/share/pipewire/filter-chain*
    _pick audio usr/share/pipewire/pipewire-{aes67,avb}.conf
    _pick audio usr/share/$_spaname/bluez5

    _pick ffado usr/lib/$_pwname/libpipewire-module-ffado*.so
    _pick ffado usr/share/man/man7/libpipewire-module-ffado-driver.7

    _pick jack-client usr/lib/$_pwname/libpipewire-module-jack{-tunnel,dbus-detect}.so
    _pick jack-client usr/lib/$_spaname/jack
    _pick jack-client usr/share/man/man7/libpipewire-module-jack{-tunnel,dbus-detect}.7

    _pick jack usr/bin/pw-jack
    _pick jack usr/include/jack
    _pick jack usr/lib/libjack*
    _pick jack usr/lib/pkgconfig/jack*.pc
    _pick jack usr/share/man/man1/pw-jack.1
    _pick jack usr/share/man/man5/pipewire-jack.conf.5
    _pick jack usr/share/pipewire/jack.conf

    _pick pulse usr/bin/pipewire-pulse
    _pick pulse usr/lib/$_pwname/libpipewire-module-protocol-pulse.so
    _pick pulse usr/lib/$_pwname/libpipewire-module-pulse-tunnel.so
    _pick pulse usr/lib/systemd/user/pipewire-pulse.*
    _pick pulse usr/share/glib-2.0/schemas/org.freedesktop.pulseaudio.gschema.xml
    _pick pulse usr/share/man/man1/pipewire-pulse.1
    _pick pulse usr/share/man/man5/pipewire-pulse.conf.5
    _pick pulse usr/share/man/man7/libpipewire-module-{protocol-pulse,pulse-tunnel}.7
    _pick pulse usr/share/man/man7/pipewire-pulse*.7
    _pick pulse usr/share/pipewire/pipewire-pulse.conf

    _pick roc usr/lib/$_pwname/libpipewire-module-roc*.so
    _pick roc usr/share/man/man7/libpipewire-module-roc-{sink,source}.7

    _pick gst usr/lib/gstreamer-1.0

    _pick zeroconf usr/lib/$_pwname/libpipewire-module-{raop,zeroconf}-*.so
    _pick zeroconf usr/lib/$_pwname/libpipewire-module-rtp-session.so
    _pick zeroconf usr/lib/$_pwname/libpipewire-module-snapcast-discover.so
    _pick zeroconf usr/share/man/man7/libpipewire-module-{raop,zeroconf}-*.7
    _pick zeroconf usr/share/man/man7/libpipewire-module-rtp-session.7
    _pick zeroconf usr/share/man/man7/libpipewire-module-snapcast-discover.7

    _pick v4l2 usr/bin/pw-v4l2 usr/lib/$_pwname/v4l2
    _pick v4l2 usr/share/man/man1/pw-v4l2.1

    _pick x11-bell usr/lib/$_pwname/libpipewire-module-x11-bell.so
    _pick x11-bell usr/share/man/man7/libpipewire-module-x11-bell.7

    # directories for overrides
    mkdir -p etc/pipewire/{client-rt,client,minimal,pipewire}.conf.d
  )

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_libpipewire-ldac() {
  pkgdesc+=" - client library"
  depends=(
    glibc
    gcc-libs
  )
  provides=(libpipewire-ldac libpipewire lib$_pwname.so)
  conflicts=(libpipewire)

  mv lib/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_alsa-card-profiles-ldac() {
  pkgdesc+=" - ALSA card profiles"
  license=(LGPL-2.1-or-later)
  provides=(alsa-card-profiles-ldac alsa-card-profiles)
  conflicts=(alsa-card-profiles)

  mv acp/* "$pkgdir"
}

package_pipewire-docs-ldac() {
  pkgdesc+=" - documentation"

  mv docs/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-libcamera-ldac() {
  pkgdesc+=" - Libcamera support"
  depends=(
    gcc-libs
    glibc
    libcamera libcamera-base.so libcamera.so
    pipewire
  )
  provides=(pipewire-libcamera-ldac pipewire-libcamera)
  conflicts=(pipewire-libcamera)

  mv libcamera/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-audio-ldac() {
  pkgdesc+=" - Audio support"
  depends=(
    libpipewire lib$_pwname.so
    pipewire
    alsa-card-profiles
    alsa-lib libasound.so
    bluez-libs libbluetooth.so
    dbus libdbus-1.so
    gcc-libs
    glib2 libg{lib,object,io}-2.0.so
    glibc
    libebur128
    libfdk-aac libfdk-aac.so
    libfreeaptx libfreeaptx.so
    liblc3 liblc3.so
    libldac libldacBT_enc.so
    libldacdec libldacBT_dec.so
    libmysofa libmysofa.so
    libsndfile libsndfile.so
    libusb libusb-1.0.so
    lilv liblilv-0.so
    opus libopus.so
    sbc libsbc.so
    systemd-libs
    webrtc-audio-processing-1 libwebrtc-audio-processing-1.so
  )
  provides=(pipewire-audio-ldac pipewire-audio)
  conflicts=(pipewire-audio)

  mv audio/* "$pkgdir"

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/50-pipewire.conf

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-alsa-ldac() {
  pkgdesc+=" - ALSA configuration"
  depends=(
    pipewire-audio
    pipewire
    pipewire-session-manager
  )
  provides=(pipewire-alsa-ldac pipewire-alsa)
  conflicts=(pipewire-alsa)

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-alsa"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-ffado-ldac() {
  pkgdesc+=" - FireWire support"
  depends=(
    libpipewire lib$_pwname.so
    pipewire-audio
    pipewire
    glibc
    libffado libffado.so
  )
  provides=(pipewire-ffado-ldac pipewire-ffado-ldac)
  conflicts=(pipewire-ffado)

  mv ffado/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-jack-client-ldac() {
  pkgdesc+=" - PipeWire as JACK client"
  depends=(
    libpipewire lib$_pwname.so
    pipewire-audio
    pipewire
    dbus libdbus-1.so
    gcc-libs
    glibc
    jack libjack.so
  )
  provides=(pipewire-jack-client-ldac pipewire-jack-client)
  conflicts=(pipewire-jack)


  mv jack-client/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-jack-ldac() {
  pkgdesc+=" - JACK replacement"
  license+=(
    # libjackserver
    GPL-2.0-only
    LGPL-2.1-or-later
  )
  depends=(
    libpipewire lib$_pwname.so
    pipewire-audio
    pipewire
    glibc
    pipewire-session-manager
    sh
  )
  optdepends=(
    'jack-example-tools: for official JACK example-clients and tools'
  )
  provides=(
    jack
    libjack.so
    libjacknet.so
    libjackserver.so
    pipewire-jack-ldac
    pipewire-jack
  )
  conflicts=(
    jack libjack.so libjacknet.so libjackserver jack2 pipewire-jack
     )
  replaces=(jack2)

  mv jack/* "$pkgdir"

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-jack"

  # directories for overrides
  mkdir -p "$pkgdir/etc/pipewire/jack.conf.d"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-pulse-ldac() {
  pkgdesc+=" - PulseAudio replacement"
  depends=(
    libpipewire lib$_pwname.so
    pipewire-audio
    pipewire
    avahi libavahi-{client,common}.so
    dbus libdbus-1.so
    dconf
    gcc-libs
    glib2 libg{lib,object,io}-2.0.so
    glibc
    libpulse libpulse.so
    pipewire-session-manager
    systemd-libs libsystemd.so
  )
  provides=(pulse-native-provider-ldac pulse-native-provider pipewire-pulse-ldac pipewire-pulse)
  conflicts=(pulse-native-provider pulseaudio pipewire-pulse)
  install=pipewire-pulse.install

  mv pulse/* "$pkgdir"

  # directory for overrides
  mkdir -p "$pkgdir/etc/pipewire/pipewire-pulse.conf.d"

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-pulseaudio"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-roc-ldac() {
  pkgdesc+=" - ROC streaming support"
  depends=(
    libpipewire lib$_pwname.so
    pipewire-audio
    pipewire
    gcc-libs
    glibc
    roc-toolkit libroc.so
  )
  provides=(pipewire-roc)
  conflicts=(pipewire-roc)

  mv roc/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_gst-plugin-pipewire-ldac() {
  pkgdesc="Multimedia graph framework - pipewire plugin"
  depends=(
    libpipewire lib$_pwname.so
    pipewire-audio
    pipewire
    gcc-libs
    glib2 libg{lib,object}-2.0.so
    glibc
    gst-plugins-base-libs
    gstreamer
    pipewire-session-manager
  )
  provides=(gst-plugin-pipewire-ldac gst-plugin-pipewire)
  conflicts=(gst-plugin-pipewire)
  mv gst/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-zeroconf-ldac() {
  pkgdesc+=" - Zeroconf support"
  depends=(
    libpipewire lib$_pwname.so
    pipewire-audio
    pipewire
    avahi libavahi-{client,common}.so
    gcc-libs
    glibc
    openssl libcrypto.so
    opus libopus.so
  )
  provides=(pipewire-zeroconf-ldac pipewire-zeroconf)
  conflicts=(pipewire-zeroconf)

  mv zeroconf/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-v4l2-ldac() {
  pkgdesc+=" - V4L2 interceptor"
  depends=(
    libpipewire lib$_pwname.so
    pipewire
    glibc
    pipewire-session-manager
    sh
  )
  provides=(pipewire-v4l2-ldac pipewire-v4l2)
  conflicts=(pipewire-v4l2)

  mv v4l2/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-x11-bell-ldac() {
  pkgdesc+=" - X11 bell"
  depends=(
    libpipewire lib$_pwname.so
    pipewire-audio
    pipewire
    glibc
    libcanberra libcanberra.so
    libx11
    libxfixes
  )
  provides=(pipewire-x11-bell-ldac pipewire-x11-bell)
  conflicts=(pipewire-x11-bell)

  mv x11-bell/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-session-manager-ldac() {
  pkgdesc="Session manager for PipeWire (default provider)"
  license=(CC0-1.0)
  depends=(wireplumber)
  provides=(pipewire-session-manager-ldac pipewire-session-manager)
  conflicts=(pipewire-session-manager)
}

package_pulse-native-provider-ldac() {
  pkgdesc="PulseAudio sound server (default provider)"
  license=(CC0-1.0)
  depends=(pipewire-pulse)
  provides=(pulse-native-provider-ldac pulse-native-provider)
  conflicts=(pulse-native-provider)
}
