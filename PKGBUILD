# Maintainer: Huang-Huang Bao <eh5@sokka.cn>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbase=pipewire
pkgbase=pipewire-full-git
pkgname=(
  pipewire-full-git
  pipewire-full-docs-git
  pipewire-full-alsa-git
  pipewire-full-jack-git
  pipewire-full-pulse-git
  pipewire-full-v4l2-git
  pipewire-full-x11-bell-git
  pipewire-full-zeroconf-git
  gst-plugin-pipewire-full-git
  pipewire-full-jack-client-git
  pipewire-full-vulkan-git
  pipewire-full-ffmpeg-git
  pipewire-full-roc-git
)
pkgver=0.3.63.r22.ga65a58d1
pkgrel=2
pkgdesc="Low-latency audio/video router and processor"
url="https://pipewire.org"
license=(MIT)
arch=(x86_64)
makedepends=(
  git meson doxygen python-docutils graphviz ncurses
  readline systemd libsndfile alsa-lib dbus rtkit libpulse
  glib2 webrtc-audio-processing libusb bluez-libs
  sbc libldac libfreeaptx libfdk-aac opus
  lilv libx11 libxfixes libcanberra libcamera
  liblc3
  avahi openssl
  gst-plugins-base-libs
  jack2
  vulkan-headers vulkan-icd-loader
  ffmpeg
  'roc-toolkit>=0.2'
)
source=("git+https://gitlab.freedesktop.org/pipewire/${_pkgbase}.git")
sha256sums=('SKIP')

prepare() {
  cd $_pkgbase
  # remove export of LD_LIBRARY_PATH for pw-jack as it would add /usr/lib
  sed -i '/LD_LIBRARY_PATH/d' pipewire-jack/src/pw-jack.in
}

pkgver() {
  cd $_pkgbase
  git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # make AUR helper happy
  rm -rf build || true

  local meson_options=(
    -D bluez5-codec-lc3plus=disabled
    -D docs=enabled
    -D jack-devel=true
    -D libjack-path=/usr/lib
    -D sdl2=disabled
    -D session-managers='[]'
    -D test=enabled
    -D bluez5-codec-lc3=enabled
    -D vulkan=enabled
    -D ffmpeg=enabled
    -D udevrulesdir=/usr/lib/udev/rules.d
  )

  arch-meson $_pkgbase build "${meson_options[@]}"
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

_ver=${pkgver:0:3}
_short_pkgver=${pkgver%%.r*}

package_pipewire-full-git() {
  license+=(LGPL)
  depends=(
    rtkit libdbus-1.so libncursesw.so libreadline.so
    libsndfile.so libudev.so libasound.so libsystemd.so
    libwebrtc_audio_processing.so libusb-1.0.so
    libbluetooth.so libsbc.so libldacBT_{enc,abr}.so
    libfreeaptx.so libfdk-aac.so libopus.so
    liblilv-0.so
    libcamera-base.so libcamera.so
    liblc3.so
  )
  optdepends=(
    'pipewire-session-manager: Session manager'
    'pipewire-full-docs-git: Documentation'
    'pipewire-full-alsa-git: ALSA configuration'
    'pipewire-full-jack-git: JACK support'
    'pipewire-full-jack-client-git: JACK device/client'
    'pipewire-full-pulse-git: PulseAudio replacement'
    'pipewire-full-v4l2-git: V4L2 interceptor'
    'pipewire-full-x11-bell-git: X11 bell'
    'pipewire-full-zeroconf-git: Zeroconf support'
    'pipewire-full-roc-git: ROC support'
    'gst-plugin-pipewire-full-git: GStreamer support'
    'ofono: ofono Bluetooth HFP support'
    'hsphfpd: hsphfpd Bluetooth HSP/HFP support'
  )
  provides=(
    "pipewire=$_short_pkgver" alsa-card-profiles libpipewire-$_ver.so
    pipewire-full-libcamera-git
  )
  conflicts=(
    pipewire alsa-card-profiles
    pipewire-full-libcamera-git
  )
  install=pipewire.install

  meson install -C build --destdir "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING

  cd "$pkgdir"

  mkdir -p etc/alsa/conf.d
  ln -st etc/alsa/conf.d /usr/share/alsa/alsa.conf.d/50-pipewire.conf

  # directories for overrides
  mkdir -p etc/pipewire/{client-rt,client,minimal,pipewire,pipewire-pulse}.conf.d

  _pick docs usr/share/doc

  _pick jack usr/bin/pw-jack
  _pick jack usr/include/jack
  _pick jack usr/lib/libjack*
  _pick jack usr/lib/pkgconfig/jack.pc
  _pick jack usr/share/man/man1/pw-jack.1
  _pick jack usr/share/pipewire/jack.conf

  _pick pulse usr/bin/pipewire-pulse
  _pick pulse usr/lib/pipewire-$_ver/libpipewire-module-protocol-pulse.so
  _pick pulse usr/lib/pipewire-$_ver/libpipewire-module-pulse-tunnel.so
  _pick pulse usr/lib/systemd/user/pipewire-pulse.*

  _pick v4l2 usr/bin/pw-v4l2 usr/lib/pipewire-$_ver/v4l2

  _pick x11-bell usr/lib/pipewire-$_ver/libpipewire-module-x11-bell.so

  _pick zeroconf usr/lib/pipewire-$_ver/libpipewire-module-{raop,zeroconf}-discover.so

  _pick gst usr/lib/gstreamer-1.0

  _pick jack-client usr/lib/spa-0.2/jack

  _pick vulkan usr/lib/spa-0.2/vulkan

  _pick ffmpeg usr/lib/spa-0.2/ffmpeg

  _pick roc usr/lib/pipewire-$_ver/libpipewire-module-roc-{sink,source}.so
}

package_pipewire-full-docs-git() {
  arch=(any)
  options=(!strip)
  provides=(pipewire-docs)
  conflicts=(pipewire-docs)
  pkgdesc+=" - documentation"

  mv docs/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-alsa-git() {
  pkgdesc+=" - ALSA configuration"
  depends=(pipewire-session-manager pipewire-full-git)
  provides=(pipewire-alsa pulseaudio-alsa)
  conflicts=(pipewire-alsa)

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf
  install -Dm644 /dev/null "$pkgdir/usr/share/pipewire/media-session.d/with-alsa"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-jack-git() {
  pkgdesc+=" - JACK support"
  license+=(GPL2)
  depends=(sh pipewire-session-manager pipewire-full-git
           libpipewire-$_ver.so)
  optdepends=('jack-example-tools: for official JACK example-clients and tools')
  provides=(pipewire-jack jack libjack.so libjackserver.so libjacknet.so)
  conflicts=(pipewire-jack jack jack2)

  mv jack/* "$pkgdir"

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-jack"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-pulse-git() {
  pkgdesc+=" - PulseAudio replacement"
  depends=(pipewire-session-manager pipewire-full-git
           libpipewire-$_ver.so libpulse.so libglib-2.0.so
           libavahi-{client,common}.so
           )
  provides=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
  conflicts=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
  install=pipewire-pulse.install

  mv pulse/* "$pkgdir"

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-pulseaudio"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-v4l2-git() {
  pkgdesc+=" - V4L2 interceptor"
  depends=(pipewire-session-manager pipewire-full-git
           libpipewire-$_ver.so)
  provides=(pipewire-v4l2)
  conflicts=(pipewire-v4l2)

  mv v4l2/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-x11-bell-git() {
  pkgdesc+=" - X11 bell"
  depends=(sh libx11 libxfixes pipewire-full-git
           libpipewire-$_ver.so libcanberra.so)
  provides=(pipewire-x11-bell)
  conflicts=(pipewire-x11-bell)

  mv x11-bell/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-zeroconf-git() {
  pkgdesc+=" - Zeroconf support"
  depends=(pipewire-full-git libpipewire-$_ver.so
           libavahi-{client,common}.so openssl)
  provides=(pipewire-zeroconf)
  conflicts=(pipewire-zeroconf)

  mv zeroconf/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_gst-plugin-pipewire-full-git() {
  pkgdesc="Multimedia graph framework - pipewire plugin"
  depends=(gst-plugins-base-libs pipewire-session-manager
           pipewire-full-git libpipewire-$_ver.so)
  provides=(gst-plugin-pipewire)
  conflicts=(gst-plugin-pipewire)

  mv gst/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-jack-client-git() {
  pkgdesc="JACK client SPA plugin"
  depends=(pipewire-full-git libjack.so)
  provides=(pipewire-jack-client)
  conflicts=(pipewire-jack-client)

  mv jack-client/* "${pkgdir}"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-vulkan-git() {
  pkgdesc="Vulkan SPA plugin"
  depends=(pipewire-full-git vulkan-icd-loader)
  provides=(pipewire-vulkan)
  conflicts=(pipewire-vulkan)

  mv vulkan/* "${pkgdir}"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-ffmpeg-git() {
  pkgdesc="FFmpeg SPA plugin"
  depends=(pipewire-full-git libavcodec.so libavformat.so)
  provides=(pipewire-ffmpeg)
  conflicts=(pipewire-ffmpeg)

  mv ffmpeg/* "${pkgdir}"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-full-roc-git() {
  pkgdesc+=" - ROC support"
  depends=(pipewire-full-git libroc.so)
  provides=(pipewire-roc)
  conflicts=(pipewire-roc)

  mv roc/* "${pkgdir}"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}
