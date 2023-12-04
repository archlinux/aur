# Maintainer: Huang-Huang Bao <eh5@sokka.cn>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=pipewire-common-git
pkgname=(
  pipewire-common-git
  libpipewire-common-git
  pipewire-common-docs-git
  pipewire-common-audio-git
  pipewire-common-alsa-git
  pipewire-common-ffado-git
  pipewire-common-jack-git
  pipewire-common-pulse-git
  pipewire-common-roc-git
  gst-plugin-pipewire-common-git
  pipewire-common-zeroconf-git
  pipewire-common-v4l2-git
  pipewire-common-x11-bell-git
)
pkgver=1.0.0.r24.gf5546d27
_so_ver=0.3
_short_pkgver=${pkgver%%.r*}
pkgrel=2
pkgdesc="Low-latency audio/video router and processor"
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
  graphviz
  gst-plugins-base
  libcamera
  libcanberra
  libfdk-aac
  libffado
  libfreeaptx
  liblc3
  libldac
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
  python
  readline
  roc-toolkit
  rtkit
  sbc
  sdl2
  systemd
  valgrind
  webrtc-audio-processing-1
  abseil-cpp # header required by webrtc-audio-processing-1
)
checkdepends=(
  openal
)
source=(
  "git+https://gitlab.freedesktop.org/pipewire/pipewire.git"
)
b2sums=(
  'SKIP'
)

pkgver() {
  cd pipewire
  git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd pipewire
}

build() {
  # make AUR helper happy
  rm -rf build || true

  local meson_options=(
    -D bluez5-codec-lc3plus=disabled
    -D docs=enabled
    -D man=enabled
    -D jack-devel=true
    -D libjack-path=/usr/lib
    -D rlimits-install=false
    -D session-managers=[]
    -D udevrulesdir=/usr/lib/udev/rules.d
    -D selinux=disabled
    -D jack=disabled
    -D vulkan=disabled
    -D ffmpeg=disabled
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

package_pipewire-common-git() {
  license+=(LGPL-2.1-or-later)  # libspa-alsa
  provides=("pipewire=$_short_pkgver")
  conflicts=(pipewire)
  depends=(
    gcc-libs
    glibc
    "libpipewire-common-git=$pkgver-$pkgrel"
    libcamera-base.so
    libcamera.so
    libdbus-1.so
    libglib-2.0.so
    libncursesw.so
    libpipewire-$_so_ver.so
    libreadline.so
    libsystemd.so
    libudev.so
  )
  optdepends=(
    'gst-plugin-pipewire-common-git: GStreamer plugin'
    'pipewire-common-alsa-git: ALSA configuration'
    'pipewire-common-audio-git: Audio support'
    'pipewire-common-docs-git: Documentation'
    'pipewire-common-ffado-git: FireWire support'
    'pipewire-common-jack-git: JACK support'
    'pipewire-common-pulse-git: PulseAudio replacement'
    'pipewire-common-roc-git: ROC streaming'
    'pipewire-session-manager: Session manager'
    'pipewire-common-v4l2-git: V4L2 interceptor'
    'pipewire-common-x11-bell-git: X11 bell'
    'pipewire-common-zeroconf-git: Zeroconf support'
    'realtime-privileges: realtime privileges with rt module'
    'rtkit: realtime privileges with rtkit module'
  )
  install=pipewire.install

  meson install -C build --destdir "$pkgdir"

  (
    cd "$pkgdir"

    # Replace copies with symlinks
    for _f in pipewire-{aes67,avb,pulse}; do
      cmp usr/bin/pipewire usr/bin/$_f
      ln -sf pipewire usr/bin/$_f
    done

    _pick lib usr/include/{pipewire-$_so_ver,spa-0.2}
    _pick lib usr/lib/libpipewire-$_so_ver.so*
    _pick lib usr/lib/pkgconfig/lib{pipewire-$_so_ver,spa-0.2}.pc

    # ACP
    _pick audio usr/lib/udev
    _pick audio usr/share/alsa-card-profile

    _pick docs usr/share/doc

    _pick audio usr/bin/pipewire-{aes67,avb}
    _pick audio usr/bin/pw-{cat,{,enc}play,record,midi{play,record},dsdplay}
    _pick audio usr/bin/pw-{loopback,mididump}
    _pick audio usr/bin/spa-{acp-tool,resample}
    _pick audio usr/lib/alsa-lib
    _pick audio usr/lib/pipewire-$_so_ver/libpipewire-module-avb.so
    _pick audio usr/lib/pipewire-$_so_ver/libpipewire-module-echo-cancel.so
    _pick audio usr/lib/pipewire-$_so_ver/libpipewire-module-fallback-sink.so
    _pick audio usr/lib/pipewire-$_so_ver/libpipewire-module-filter-chain*.so
    _pick audio usr/lib/pipewire-$_so_ver/libpipewire-module-loopback.so
    _pick audio usr/lib/pipewire-$_so_ver/libpipewire-module-netjack2-*.so
    _pick audio usr/lib/pipewire-$_so_ver/libpipewire-module-pipe-tunnel.so
    _pick audio usr/lib/pipewire-$_so_ver/libpipewire-module-protocol-simple.so
    _pick audio usr/lib/pipewire-$_so_ver/libpipewire-module-rtp-{sap,sink,source}.so
    _pick audio usr/lib/pipewire-$_so_ver/libpipewire-module-vban-{recv,send}.so
    _pick audio usr/lib/spa-0.2/{aec,alsa,audio*,avb,bluez5}
    _pick audio usr/lib/systemd/user/filter-chain.service
    _pick audio usr/share/alsa
    _pick audio usr/share/man/man1/pw-{cat,mididump}.1
    _pick audio usr/share/pipewire/filter-chain*
    _pick audio usr/share/pipewire/pipewire-{aes67,avb}.conf
    _pick audio usr/share/spa-0.2/bluez5

    _pick ffado usr/lib/pipewire-$_so_ver/libpipewire-module-ffado*.so

    _pick jack usr/bin/pw-jack
    _pick jack usr/include/jack
    _pick jack usr/lib/libjack*
    _pick jack usr/lib/pkgconfig/jack.pc
    _pick jack usr/share/man/man1/pw-jack.1
    _pick jack usr/share/pipewire/jack.conf

    _pick pulse usr/bin/pipewire-pulse
    _pick pulse usr/lib/pipewire-$_so_ver/libpipewire-module-protocol-pulse.so
    _pick pulse usr/lib/pipewire-$_so_ver/libpipewire-module-pulse-tunnel.so
    _pick pulse usr/lib/systemd/user/pipewire-pulse.*
    _pick pulse usr/share/man/man1/pipewire-pulse.1
    _pick pulse usr/share/pipewire/pipewire-pulse.conf

    _pick roc usr/lib/pipewire-$_so_ver/libpipewire-module-roc*.so

    _pick gst usr/lib/gstreamer-1.0

    _pick zeroconf usr/lib/pipewire-$_so_ver/libpipewire-module-{raop,zeroconf}-*.so
    _pick zeroconf usr/lib/pipewire-$_so_ver/libpipewire-module-rtp-session.so

    _pick v4l2 usr/bin/pw-v4l2 usr/lib/pipewire-$_so_ver/v4l2

    _pick x11-bell usr/lib/pipewire-$_so_ver/libpipewire-module-x11-bell.so

    # directories for overrides
    mkdir -p etc/pipewire/{client-rt,client,minimal,pipewire}.conf.d
  )

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_libpipewire-common-git() {
  pkgdesc+=" - client library"
  depends=(
    glibc
    gcc-libs
  )
  provides=(
    "libpipewire=$_short_pkgver"
    libpipewire-$_so_ver.so
  )
  conflicts=(libpipewire)

  mv lib/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-common-docs-git() {
  options=(!strip)
  pkgdesc+=" - documentation"
  provides=(pipewire-docs)
  conflicts=(pipewire-docs)

  mv docs/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-common-audio-git() {
  pkgdesc+=" - Audio support"
  provides=(pipewire-audio alsa-card-profiles)
  conflicts=(pipewire-audio alsa-card-profiles)
  depends=(
    dbus
    gcc-libs
    glib2
    glibc
    libasound.so
    libbluetooth.so
    libfdk-aac.so
    libfreeaptx.so
    liblc3.so
    libldacBT_enc.so
    liblilv-0.so
    libmysofa.so
    libopus.so
    libpipewire-$_so_ver.so
    libsbc.so
    libsndfile.so
    libusb-1.0.so
    libwebrtc-audio-processing-1.so
    pipewire
    systemd-libs
    libpipewire-common-git
  )

  mv audio/* "$pkgdir"

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/50-pipewire.conf

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-common-alsa-git() {
  pkgdesc+=" - ALSA configuration"
  depends=(
    pipewire-common-git
    pipewire-common-audio-git
    pipewire-session-manager
  )
  conflicts=(pulseaudio-alsa pipewire-alsa)
  provides=(pulseaudio-alsa pipewire-alsa)

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-alsa"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-common-ffado-git() {
  pkgdesc+=" - FireWire support"
  depends=(
    glibc
    libffado.so
    libpipewire-$_so_ver.so
    pipewire-common-git
    pipewire-common-audio-git
  )
  provides=(pipewire-ffado)
  conflicts=(pipewire-ffado)

  mv ffado/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-common-jack-git() {
  pkgdesc+=" - JACK replacement"
  license+=(LGPL-2.1-or-later GPL-2.0-only)  # libjackserver
  depends=(
    glibc
    libpipewire-$_so_ver.so
    pipewire-common-git
    pipewire-common-audio-git
    pipewire-session-manager
    sh
  )
  optdepends=('jack-example-tools: for official JACK example-clients and tools')
  conflicts=(jack jack2 pipewire-jack)
  provides=(jack libjack.so libjackserver.so libjacknet.so pipewire-jack)

  mv jack/* "$pkgdir"

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-jack"

  # directories for overrides
  mkdir -p "$pkgdir/etc/pipewire/jack.conf.d"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-common-pulse-git() {
  pkgdesc+=" - PulseAudio replacement"
  depends=(
    dbus
    gcc-libs
    glibc
    libavahi-{client,common}.so
    libglib-2.0.so
    libpipewire-$_so_ver.so
    libpulse.so
    pipewire-common-git
    pipewire-common-audio-git
    pipewire-session-manager
    systemd-libs
  )
  provides=(
    pulse-native-provider
    pulseaudio
    pulseaudio-bluetooth
    pipewire-pulse
  )
  conflicts=(
    pulseaudio
    pulseaudio-bluetooth
    pipewire-pulse
  )
  install=pipewire-pulse.install

  mv pulse/* "$pkgdir"

  # directory for overrides
  mkdir -p "$pkgdir/etc/pipewire/pipewire-pulse.conf.d"

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-pulseaudio"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-common-roc-git() {
  pkgdesc+=" - ROC streaming support"
  provides=(pipewire-roc)
  conflicts=(pipewire-roc)
  depends=(
    glibc
    libpipewire-$_so_ver.so
    libroc.so
    pipewire-common-git
    pipewire-common-audio-git
    roc-toolkit
  )

  mv roc/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_gst-plugin-pipewire-common-git() {
  pkgdesc="Multimedia graph framework - pipewire plugin"
  provides=(gst-plugin-pipewire)
  conflicts=(gst-plugin-pipewire)
  depends=(
    glib2
    glibc
    gst-plugins-base-libs
    gstreamer
    libpipewire-$_so_ver.so
    pipewire-common-git
    pipewire-session-manager
  )

  mv gst/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-common-zeroconf-git() {
  pkgdesc+=" - Zeroconf support"
  provides=(pipewire-zeroconf)
  conflicts=(pipewire-zeroconf)
  depends=(
    gcc-libs
    glibc
    libavahi-{client,common}.so
    libpipewire-$_so_ver.so
    openssl
    opus
    pipewire-common-git
    pipewire-common-audio-git
  )

  mv zeroconf/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-common-v4l2-git() {
  pkgdesc+=" - V4L2 interceptor"
  provides=(pipewire-v4l2)
  conflicts=(pipewire-v4l2)
  depends=(
    glibc
    libpipewire-$_so_ver.so
    pipewire-common-git
    pipewire-session-manager
    sh
  )

  mv v4l2/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-common-x11-bell-git() {
  pkgdesc+=" - X11 bell"
  depends=(
    glibc
    libcanberra.so
    libpipewire-$_so_ver.so
    libx11
    libxfixes
    pipewire-common-git
    pipewire-common-audio-git
  )
  provides=(pipewire-x11-bell)
  conflicts=(pipewire-x11-bell)

  mv x11-bell/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

# vim:set sw=2 sts=-1 et:
