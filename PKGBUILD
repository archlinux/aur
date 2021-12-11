# Maintainer: Huang-Huang Bao <eh5@sokka.cn>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbase=pipewire
pkgbase=pipewire-common-git
pkgname=(pipewire-common-git
         pipewire-common-docs-git
         pipewire-common-alsa-git
         pipewire-common-jack-git
         pipewire-common-pulse-git
         pipewire-common-v4l2-git
         pipewire-common-zeroconf-git
         gst-plugin-pipewire-common-git
         )
pkgver=0.3.40.r125.gbcd867f8
pkgrel=1
pkgdesc="Low-latency audio/video router and processor"
url="https://pipewire.org"
license=(MIT)
arch=(x86_64)
makedepends=(git meson doxygen python-docutils graphviz ncurses
             readline libsndfile alsa-lib dbus rtkit libpulse
             webrtc-audio-processing libusb bluez-libs
             sbc libldac libfreeaptx libfdk-aac
             lilv
             avahi openssl
             gst-plugins-base-libs
             )
source=("git+https://gitlab.freedesktop.org/pipewire/${_pkgbase}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # make AUR helper happy
  rm -rf build || true
  arch-meson $_pkgbase build \
    -D docs=enabled \
    -D test=enabled \
    -D libcamera=disabled \
    -D sdl2=disabled \
    -D roc=disabled \
    -D session-managers=[] \
    -D jack=disabled \
    -D vulkan=disabled \
    -D ffmpeg=disabled \
    -D udevrulesdir=/usr/lib/udev/rules.d
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

package_pipewire-common-git() {
  license+=(LGPL)
  depends=(rtkit libdbus-1.so libncursesw.so libreadline.so
           libsndfile.so libudev.so libasound.so libsystemd.so
           libwebrtc_audio_processing.so libusb-1.0.so
           libbluetooth.so libsbc.so libldacBT_{enc,abr}.so
           libfreeaptx.so libfdk-aac.so
           liblilv-0.so)
  optdepends=('pipewire-session-manager: Session manager'
              'pipewire-common-docs-git: Documentation'
              'pipewire-common-alsa-git: ALSA configuration'
              'pipewire-common-jack-git: JACK support'
              'pipewire-common-pulse-git: PulseAudio replacement'
              'pipewire-common-zeroconf-git: Zeroconf support'
              'gst-plugin-pipewire-common-git: GStreamer support'
              'ofono: ofono Bluetooth HFP support'
              'hsphfpd: hsphfpd Bluetooth HSP/HFP support')
  provides=("pipewire=$pkgver" alsa-card-profiles libpipewire-$_ver.so)
  conflicts=(pipewire alsa-card-profiles)
  install=pipewire.install

  meson install -C build --destdir "$pkgdir"

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/50-pipewire.conf

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING

  cd "$pkgdir"

  _pick docs usr/share/doc

  _pick jack usr/bin/pw-jack usr/lib/pipewire-$_ver/jack
  _pick jack usr/share/man/man1/pw-jack.1
  _pick jack usr/share/pipewire/jack.conf

  _pick pulse usr/bin/pipewire-pulse
  _pick pulse usr/lib/pipewire-$_ver/libpipewire-module-protocol-pulse.so
  _pick pulse usr/lib/pipewire-$_ver/libpipewire-module-pulse-tunnel.so
  _pick pulse usr/lib/systemd/user/pipewire-pulse.*

  _pick v4l2 usr/bin/pw-v4l2 usr/lib/pipewire-$_ver/v4l2

  _pick zeroconf usr/lib/pipewire-$_ver/libpipewire-module-zeroconf-discover.so
  _pick zeroconf usr/lib/pipewire-$_ver/libpipewire-module-raop-discover.so
  _pick zeroconf usr/lib/pipewire-$_ver/libpipewire-module-raop-sink.so

  _pick gst usr/lib/gstreamer-1.0
}

package_pipewire-common-docs-git() {
  arch=(any)
  options=(!strip)
  provides=(pipewire-docs)
  conflicts=(pipewire-docs)
  pkgdesc+=" - documentation"

  mv docs/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-common-alsa-git() {
  pkgdesc+=" - ALSA configuration"
  depends=(pipewire-common-git pipewire-session-manager)
  provides=(pipewire-alsa pulseaudio-alsa)
  conflicts=(pipewire-alsa)

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" \
    /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf
  install -Dm644 /dev/null "$pkgdir/usr/share/pipewire/media-session.d/with-alsa"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-common-jack-git() {
  pkgdesc+=" - JACK support"
  license+=(GPL2)
  depends=(pipewire-session-manager pipewire-common-git
           libpipewire-$_ver.so)
  provides=(pipewire-jack)
  conflicts=(pipewire-jack)

  mv jack/* "$pkgdir"

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-jack"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-common-pulse-git() {
  pkgdesc+=" - PulseAudio replacement"
  depends=(pipewire-session-manager pipewire-common-git
           libpipewire-$_ver.so libpulse.so
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

package_pipewire-common-v4l2-git() {
  pkgdesc+=" - V4L2 interceptor"
  depends=(pipewire-session-manager pipewire-common-git
           libpipewire-$_ver.so)
  provides=(pipewire-v4l2)
  conflicts=(pipewire-v4l2)

  mv v4l2/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_pipewire-common-zeroconf-git() {
  pkgdesc+=" - Zeroconf support"
  depends=(pipewire-common-git libpipewire-$_ver.so
           libavahi-{client,common}.so openssl)
  provides=(pipewire-zeroconf)
  conflicts=(pipewire-zeroconf)

  mv zeroconf/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}

package_gst-plugin-pipewire-common-git() {
  pkgdesc="Multimedia graph framework - pipewire plugin"
  depends=(gst-plugins-base-libs pipewire-session-manager
           pipewire-common-git libpipewire-$_ver.so)
  provides=(gst-plugin-pipewire)
  conflicts=(gst-plugin-pipewire)

  mv gst/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}
