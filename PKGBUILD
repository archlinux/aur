# Maintainer: Huang-Huang Bao <eh5@sokka.cn>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=pipewire-full-git
pkgname=(
  pipewire-full-git
  libpipewire-full-git
  pipewire-full-docs-git
  pipewire-full-audio-git
  pipewire-full-alsa-git
  pipewire-full-ffado-git
  pipewire-full-jack-client-git
  pipewire-full-jack-git
  pipewire-full-pulse-git
  pipewire-full-roc-git
  gst-plugin-pipewire-full-git
  pipewire-full-zeroconf-git
  pipewire-full-v4l2-git
  pipewire-full-x11-bell-git
  pipewire-full-vulkan-git
  pipewire-full-ffmpeg-git
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
  vulkan-headers vulkan-icd-loader
  ffmpeg
  modemmanager
)
checkdepends=(
  openal
)
source=(
  "git+https://gitlab.freedesktop.org/pipewire/pipewire.git"
  jack-link-pipewire-jack.patch
)
b2sums=(
  'SKIP'
  f82000d699619ab92794c1db49284ea5877b73d7cb934ecce697b267e9109c9d72fd3b4d4eb3e19aa9948e34dbfd97ba62f63ce8cba98e0b8a12da8d17012ea8
)

pkgver() {
  cd pipewire
  git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd pipewire

  # use internal jack headers and library in build stage,
  # libspa-jack.so would still link to /usr/lib/libjack.so,
  # which provided by both pipewire-jack and jack2,
  patch -Np1 < ../jack-link-pipewire-jack.patch
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
    -D jack-link-pipewire-jack=enabled
    -D vulkan=enabled
    -D pw-cat-ffmpeg=enabled
    -D ffmpeg=enabled
    -D bluez5-backend-native-mm=enabled
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

package_pipewire-full-git() {
  license+=(LGPL-2.1-or-later)  # libspa-alsa
  provides=("pipewire=$_short_pkgver")
  conflicts=(pipewire)
  depends=(
    gcc-libs
    glibc
    "libpipewire-full-git=$pkgver-$pkgrel"
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
    'gst-plugin-pipewire-full-git: GStreamer plugin'
    'pipewire-full-alsa-git: ALSA configuration'
    'pipewire-full-audio-git: Audio support'
    'pipewire-full-docs-git: Documentation'
    'pipewire-full-ffado-git: FireWire support'
    'pipewire-full-jack-client-git: PipeWire as JACK client'
    'pipewire-full-jack-git: JACK replacement'
    'pipewire-full-pulse-git: PulseAudio replacement'
    'pipewire-full-roc-git: ROC streaming'
    'pipewire-session-manager: Session manager'
    'pipewire-full-v4l2-git: V4L2 interceptor'
    'pipewire-full-x11-bell-git: X11 bell'
    'pipewire-full-zeroconf-git: Zeroconf support'
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
    _pick audio usr/share/man/man7/libpipewire-module-{avb,echo-cancel,fallback-sink,filter-chain*,loopback,netjack2*,pipe-tunnel,protocol-simple,rtp-{sap,sink,source},vban*}.7
    _pick audio usr/share/pipewire/filter-chain*
    _pick audio usr/share/pipewire/pipewire-{aes67,avb}.conf
    _pick audio usr/share/spa-0.2/bluez5

    _pick ffado usr/lib/pipewire-$_so_ver/libpipewire-module-ffado*.so
    _pick ffado usr/share/man/man7/libpipewire-module-ffado-driver.7

    _pick jack-client usr/lib/pipewire-$_so_ver/libpipewire-module-jack{-tunnel,dbus-detect}.so
    _pick jack-client usr/lib/spa-0.2/jack
    _pick jack-client usr/share/man/man7/libpipewire-module-jack{-tunnel,dbus-detect}.7

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
    _pick pulse usr/share/man/man5/pipewire-pulse.conf.5
    _pick pulse usr/share/man/man7/pipewire-pulse*.7
    _pick pulse usr/share/man/man7/libpipewire-module-{protocol-pulse,pulse-tunnel}.7
    _pick pulse usr/share/pipewire/pipewire-pulse.conf

    _pick roc usr/lib/pipewire-$_so_ver/libpipewire-module-roc*.so

    _pick gst usr/lib/gstreamer-1.0

    _pick zeroconf usr/lib/pipewire-$_so_ver/libpipewire-module-{raop,zeroconf}-*.so
    _pick zeroconf usr/lib/pipewire-$_so_ver/libpipewire-module-rtp-session.so
    _pick zeroconf usr/share/man/man7/libpipewire-module-{raop-*,rtp-session,zeroconf*}.7

    _pick v4l2 usr/bin/pw-v4l2 usr/lib/pipewire-$_so_ver/v4l2

    _pick x11-bell usr/lib/pipewire-$_so_ver/libpipewire-module-x11-bell.so
    _pick x11-bell usr/share/man/man7/libpipewire-module-x11-bell.7

    _pick vulkan usr/lib/spa-0.2/vulkan

    _pick ffmpeg usr/lib/spa-0.2/ffmpeg

    # directories for overrides
    mkdir -p etc/pipewire/{client-rt,client,minimal,pipewire}.conf.d
  )

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_libpipewire-full-git() {
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

package_pipewire-full-docs-git() {
  options=(!strip)
  pkgdesc+=" - documentation"
  provides=(pipewire-docs)
  conflicts=(pipewire-docs)

  mv docs/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-full-audio-git() {
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
    libpipewire-full-git
    libavcodec.so libavformat.so libavutil.so
  )

  mv audio/* "$pkgdir"

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/50-pipewire.conf

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-full-alsa-git() {
  pkgdesc+=" - ALSA configuration"
  depends=(
    pipewire-full-git
    pipewire-full-audio-git
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

package_pipewire-full-ffado-git() {
  pkgdesc+=" - FireWire support"
  depends=(
    glibc
    libffado.so
    libpipewire-$_so_ver.so
    pipewire-full-git
    pipewire-full-audio-git
  )
  provides=(pipewire-ffado)
  conflicts=(pipewire-ffado)

  mv ffado/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-full-jack-client-git() {
  pkgdesc+=" - PipeWire as JACK client"
  depends=(
    glibc
    libdbus-1.so
    libjack.so
    libpipewire-$_so_ver.so
    pipewire-full-git
    pipewire-full-audio-git
  )
  provides=(pipewire-jack-client)
  conflicts=(pipewire-jack-client)

  mv jack-client/* "${pkgdir}"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-full-jack-git() {
  pkgdesc+=" - JACK replacement"
  license+=(LGPL-2.1-or-later GPL-2.0-only)  # libjackserver
  depends=(
    glibc
    libpipewire-$_so_ver.so
    pipewire-full-git
    pipewire-full-audio-git
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

package_pipewire-full-pulse-git() {
  pkgdesc+=" - PulseAudio replacement"
  depends=(
    dbus
    gcc-libs
    glibc
    libavahi-{client,common}.so
    libglib-2.0.so
    libpipewire-$_so_ver.so
    libpulse.so
    pipewire-full-git
    pipewire-full-audio-git
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

package_pipewire-full-roc-git() {
  pkgdesc+=" - ROC streaming support"
  provides=(pipewire-roc)
  conflicts=(pipewire-roc)
  depends=(
    glibc
    libpipewire-$_so_ver.so
    libroc.so
    pipewire-full-git
    pipewire-full-audio-git
    roc-toolkit
  )

  mv roc/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_gst-plugin-pipewire-full-git() {
  pkgdesc="Multimedia graph framework - pipewire plugin"
  provides=(gst-plugin-pipewire)
  conflicts=(gst-plugin-pipewire)
  depends=(
    glib2
    glibc
    gst-plugins-base-libs
    gstreamer
    libpipewire-$_so_ver.so
    pipewire-full-git
    pipewire-session-manager
  )

  mv gst/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-full-zeroconf-git() {
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
    pipewire-full-git
    pipewire-full-audio-git
  )

  mv zeroconf/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-full-v4l2-git() {
  pkgdesc+=" - V4L2 interceptor"
  provides=(pipewire-v4l2)
  conflicts=(pipewire-v4l2)
  depends=(
    glibc
    libpipewire-$_so_ver.so
    pipewire-full-git
    pipewire-session-manager
    sh
  )

  mv v4l2/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-full-x11-bell-git() {
  pkgdesc+=" - X11 bell"
  depends=(
    glibc
    libcanberra.so
    libpipewire-$_so_ver.so
    libx11
    libxfixes
    pipewire-full-git
    pipewire-full-audio-git
  )
  provides=(pipewire-x11-bell)
  conflicts=(pipewire-x11-bell)

  mv x11-bell/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-full-vulkan-git() {
  pkgdesc="Vulkan SPA plugin"
  depends=(vulkan-icd-loader)
  provides=(pipewire-vulkan)
  conflicts=(pipewire-vulkan)

  mv vulkan/* "${pkgdir}"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

package_pipewire-full-ffmpeg-git() {
  pkgdesc="FFmpeg SPA plugin"
  depends=(libavcodec.so)
  provides=(pipewire-ffmpeg)
  conflicts=(pipewire-ffmpeg)

  mv ffmpeg/* "${pkgdir}"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 pipewire/COPYING
}

# vim:set sw=2 sts=-1 et:
